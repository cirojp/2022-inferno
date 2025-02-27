"
i represent a Zathura: Inferno game.
"
Class {
	#name : #Zathura,
	#superclass : #Object,
	#instVars : [
		'board',
		'dice',
		'gameIsFinished',
		'turnController',
		'lastCardPlayed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'class initialization' }
Zathura class >> playWith: aDiceCup over: aBoard [

	aBoard assertThatIsNotInitialized.
	^ self new initializeWith: aDiceCup over: aBoard
]

{ #category : #assertions }
Zathura >> assert: aCard isBeingAppliedTo: aTarget [

	^ board assertThat: aCard isBeingAppliedTo: aTarget
]

{ #category : #assertions }
Zathura >> assertGameIsFinished [

	gameIsFinished ifTrue: [
		Error signal: 'Game is finished! You cannot keep playing this game.' ]
]

{ #category : #assertions }
Zathura >> assertItIsThatSpaceshipsTurn: aSpaceshipName [

	aSpaceshipName == turnController activeSpaceship name
		ifFalse: [ ^ false ]
		ifTrue: [ ^ true ]
]

{ #category : #assertions }
Zathura >> assertSpaceshipCanPlayCard: aSpaceship [

	aSpaceship = turnController activeSpaceship name ifFalse: [
		Error signal: 'Cannot play this card when it is not your turn' ]
]

{ #category : #cardApplying }
Zathura >> cancelCard: aCardToBeCancelled from: aTargetedSpaceshipName playedBy: applyingSpaceshipName with: aCancelCard [

	| targetSpaceship applyingSpaceship |
	targetSpaceship := self
		                   assert: aCardToBeCancelled
		                   isBeingAppliedTo: aTargetedSpaceshipName.
	targetSpaceship cancel: aCardToBeCancelled.
	applyingSpaceship := board getSpaceshipByName: applyingSpaceshipName.
	applyingSpaceship play: aCancelCard.
	lastCardPlayed := aCancelCard.
]

{ #category : #cardApplying }
Zathura >> cancelFleetCard: aFleetCard with: aCancellationCard playedBy: aSpaceshipName [

	| fleet applyingSpaceship |
	fleet := board getFleet.
	applyingSpaceship := board getSpaceshipByName: aSpaceshipName.
	applyingSpaceship play: aCancellationCard.
	fleet cancel: aFleetCard.
	aFleetCard handleCancelation: board.
	lastCardPlayed := aCancellationCard.
]

{ #category : #cardApplying }
Zathura >> cardApplicator [

	| cardsAffectingRoll addToRoll |
	cardsAffectingRoll := OrderedCollection new.
	cardsAffectingRoll addAll:
		(board getAllCardsAffecting: turnController activeSpaceship).
	addToRoll := 0.
	cardsAffectingRoll do: [ :card |
		addToRoll := addToRoll + card effectOnPlay ].
	^ addToRoll
]

{ #category : #cardApplying }
Zathura >> currentSpaceshipPlaysCard: aPermanentCard applyTo: aTargetSpaceshipName playedBy: applyingSpaceshipName [

	| cardToApply targetSpaceship applierSpaceship |
	self assertSpaceshipCanPlayCard: applyingSpaceshipName.
	applierSpaceship := board getSpaceshipByName: applyingSpaceshipName.
	targetSpaceship := board getSpaceshipByName: aTargetSpaceshipName.
	cardToApply := applierSpaceship
		               useCard: aPermanentCard
		               on: targetSpaceship.
	lastCardPlayed := cardToApply
]

{ #category : #cardApplying }
Zathura >> currentSpaceshipPlaysCard: anAcceleratorCard playedBy: aSpaceshipName [

	| target applierSpaceship |
	self assertSpaceshipCanPlayCard: aSpaceshipName.
	applierSpaceship := board getSpaceshipByName: aSpaceshipName.
	target := board getFleet.
	applierSpaceship play: anAcceleratorCard.
	target getsApplied: anAcceleratorCard.
	lastCardPlayed := anAcceleratorCard
]

{ #category : #applying }
Zathura >> currentSpaceshipPlaysReversalCard: aReversalCard ToEffectOnSpot: aSpotNumber playedBy: applyingSpaceshipName [ 
	
	| applierSpaceship theFleet |
	self assertSpaceshipCanPlayCard: applyingSpaceshipName.
	applierSpaceship := board getSpaceshipByName: applyingSpaceshipName.
	theFleet := board getFleet.
	applierSpaceship play: aReversalCard.
	aReversalCard isAffectingSpotNumber: aSpotNumber.
	board revertEffectOnSpot: aSpotNumber.
	theFleet getsApplied: aReversalCard.
	lastCardPlayed := aReversalCard
]

{ #category : #getters }
Zathura >> handOf: aSpaceshipName [

	^ board getHandOf: aSpaceshipName
]

{ #category : #getters }
Zathura >> hasGameFinished [

	^ gameIsFinished
]

{ #category : #assertions }
Zathura >> hasItReachedTheFinishLine: currentSpaceshipName [

	(board positionOf: currentSpaceshipName) spotNumber
	>= board lengthInSpots
	& ((board positionOf: currentSpaceshipName) lapNumber
		 >= board amountOfLaps) ifTrue: [ gameIsFinished := true ]
]

{ #category : #initialization }
Zathura >> initializeWith: aDiceCup over: aBoard [

	board := aBoard.
	dice := aDiceCup.
	gameIsFinished := false.
	turnController := TurnController with: aBoard spaceshipPositions.
	lastCardPlayed := CancellationCard new
]

{ #category : #accessing }
Zathura >> lastCardPlayed [

	^ lastCardPlayed
]

{ #category : #playing }
Zathura >> play: aCard by: anApplyingSpaceship affecting: aTarget [

	| action |
	action := aCard createOwnAction.
	action
		on: self
		by: anApplyingSpaceship
		to: aTarget
		with: aCard
]

{ #category : #playing }
Zathura >> playNextTurn [

	| currentSpaceship |
	self assertGameIsFinished.
	currentSpaceship := turnController activeSpaceship.
	self playTurn: currentSpaceship name
]

{ #category : #playing }
Zathura >> playTurn: aSpaceshipName [

	| positionBeforeRoll rollNumber cardsEffectsOnRoll |
	positionBeforeRoll := board positionOf: aSpaceshipName.
	(self assertItIsThatSpaceshipsTurn: aSpaceshipName) ifTrue: [ 
	rollNumber := dice roll.
	cardsEffectsOnRoll := self cardApplicator.
	board
		move: aSpaceshipName
		from: positionBeforeRoll
		to: rollNumber + cardsEffectsOnRoll.
	self hasItReachedTheFinishLine: aSpaceshipName.
	board applyEffect: aSpaceshipName.
	
	turnController nextSpaceshipInLine ] ifFalse: [ 
		board move: aSpaceshipName from: positionBeforeRoll to: -2.
		turnController skipNextTurnOf: aSpaceshipName.
	 ]

]

{ #category : #getters }
Zathura >> positionOf: aSpaceshipName [

	^ board positionOf: aSpaceshipName
]

{ #category : #getters }
Zathura >> rankingOfSpaceships [

	^ board rankingOfSpaceships
]

{ #category : #cardApplying }
Zathura >> redoCancelationCard: aCardToCancel from: targetSpaceshipName PlayedBy: applyingSpaceshipName with: aRedoCard [

	| aCancelCard applyingSpaceship |
	aCancelCard := CancellationCard new.
	lastCardPlayed := aCancelCard.
	applyingSpaceship := board getSpaceshipByName: applyingSpaceshipName.
	applyingSpaceship addPickedCardToHand: aCancelCard.
	self
		cancelCard: aCardToCancel
		from: targetSpaceshipName
		playedBy: applyingSpaceshipName
		with: aCancelCard
]

{ #category : #cardApplying }
Zathura >> redoLastCardPlayedBy: applyingSpaceshipName applyTo: targetSpaceshipName with: aRedoCard [

	| applyingSpaceship |
	applyingSpaceship := board getSpaceshipByName: applyingSpaceshipName.
	applyingSpaceship play: aRedoCard.
	self assertSpaceshipCanPlayCard: applyingSpaceshipName.
	applyingSpaceship addPickedCardToHand: lastCardPlayed.
	self
		currentSpaceshipPlaysCard: lastCardPlayed
		applyTo: targetSpaceshipName
		playedBy: applyingSpaceshipName
]

{ #category : #cardApplying }
Zathura >> redoLastCardPlayedBy: applyingSpaceshipName with: aRedoCard [

	| applyingSpaceship |
	applyingSpaceship := board getSpaceshipByName: applyingSpaceshipName.
	applyingSpaceship play: aRedoCard.
	self assertSpaceshipCanPlayCard: applyingSpaceshipName.
	applyingSpaceship addPickedCardToHand: lastCardPlayed.
	self
		currentSpaceshipPlaysCard: lastCardPlayed
		playedBy: applyingSpaceshipName
]

{ #category : #cardApplying }
Zathura >> redoRepeatCardPlayedBy: applyingSpaceshipName applyTo: targetSpaceshipName with: aRedoCard [

	| applyingSpaceship |
	applyingSpaceship := board getSpaceshipByName: applyingSpaceshipName.
	applyingSpaceship play: aRedoCard.
	applyingSpaceship addPickedCardToHand: lastCardPlayed.
	self
		repeatEffectCardPlayedBy: applyingSpaceshipName
		applyTo: targetSpaceshipName
		with: lastCardPlayed
]

{ #category : #cardPlaying }
Zathura >> redoReversalCardPlayedBy: applyingSpaceshipName applyTo: aSpotNumber with: aRedoCard [ 
	| applyingSpaceship |
	applyingSpaceship := board getSpaceshipByName: applyingSpaceshipName.
	applyingSpaceship play: aRedoCard.
	self assertSpaceshipCanPlayCard: applyingSpaceshipName.
	applyingSpaceship addPickedCardToHand: lastCardPlayed.
	self
		currentSpaceshipPlaysReversalCard: lastCardPlayed
		ToEffectOnSpot: aSpotNumber
		playedBy: applyingSpaceshipName
	
]

{ #category : #cardApplying }
Zathura >> repeatEffectCardPlayedBy: aSpaceshipName applyTo: targetSpaceshipName with: aRepeatCard [

	| applyingSpaceship |
	applyingSpaceship := board getSpaceshipByName: aSpaceshipName.
	applyingSpaceship play: aRepeatCard.
	board applyLastEffectTo: targetSpaceshipName.
	lastCardPlayed := aRepeatCard.
]

{ #category : #getters }
Zathura >> showCardsOnHandFor: aSpaceship [

	^ (board getSpaceshipByName: aSpaceship) hand
]
