"
i represent a board where a game can be played
"
Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'layout',
		'lengthInParsecs',
		'laps',
		'length',
		'spaceshipsPositions',
		'lastEffectAplied',
		'cardDealer',
		'playingSpaceships',
		'fleet'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #assertion }
Board class >> assertValidAmountOfLaps: anAmountOfLaps [

	anAmountOfLaps > 0 ifFalse: [
		Error signal:
			'Board cannot be created with a number of laps lower than 0.' ]
]

{ #category : #assertion }
Board class >> assertValidAmountOfSpaceship: aCollectionOfSpaceships [

	aCollectionOfSpaceships size > 1 ifFalse: [
		Error signal:
			'Board cannot be created with a number of spaceships lower than 2' ]
]

{ #category : #assertion }
Board class >> assertValidAmountOfSpots: anAmountOfSpots [

	anAmountOfSpots isEmpty ifTrue: [ 
		Error signal:
			'Board cannot be created with a number of spots lower than 1' ]
]

{ #category : #assertion }
Board class >> assertValidLengthInParsecs: anAmountOfParsecs [

	anAmountOfParsecs > 0 ifFalse: [ 
		Error signal:
			'Board cannot be created with a number of spots lower than 0' ]
]

{ #category : #'class initialization' }
Board class >> with: aCollectionOfSpots and: aLengthInParsecs playedFor: anAmountOfLaps by: aCollectionOfSpaceships dealtBy: aCardDealer [

	self assertValidAmountOfSpots: aCollectionOfSpots.
	self assertValidLengthInParsecs: aLengthInParsecs.
	self assertValidAmountOfLaps: anAmountOfLaps.
	self assertValidAmountOfSpaceship: aCollectionOfSpaceships.
	^ self new
		  initializeWith: aCollectionOfSpots
		  and: aLengthInParsecs
		  around: anAmountOfLaps
		  playedBy: aCollectionOfSpaceships
		  dealtBy: aCardDealer
]

{ #category : #getters }
Board >> addEachPositionToRanking: spaceshipArrayOfKeys [

	| orderedRanking |
	orderedRanking := OrderedCollection new: spaceshipArrayOfKeys size.
	spaceshipArrayOfKeys do: [ :eachSpaceship |
		orderedRanking
			at: eachSpaceship
			put: (spaceshipsPositions at: eachSpaceship) ].
	^ orderedRanking
]

{ #category : #adding }
Board >> addPickedCardTo: aSpaceshipName [

	| spaceship |
	spaceship := spaceshipsPositions keys
		             detect: [ :eachSpaceship |
		             eachSpaceship name = aSpaceshipName ]
		             ifNone: [
		             Error signal: 'That Spaceship does not exist.' ].
	spaceship addPickedCardToHand: cardDealer dealOne
]

{ #category : #getters }
Board >> amountOfLaps [

	^ laps
]

{ #category : #effectApplying }
Board >> applyEffect: aSpaceshipName [

	self applyEffectTriggeredBy: aSpaceshipName
]

{ #category : #effectApplying }
Board >> applyEffectTriggeredBy: aSpaceshipName [

	| spotNumber |
	spotNumber := (self positionOf: aSpaceshipName) spotNumber.
	lastEffectAplied := (layout at: spotNumber) effectAtSpot.
	lastEffectAplied applyTo: self by: aSpaceshipName.
]

{ #category : #effectApplying }
Board >> applyLastEffectTo: aSpaceshipName [

	| resultOfEffectApplying |
	resultOfEffectApplying := lastEffectAplied
		                          applyTo: self
		                          by: aSpaceshipName. 
]

{ #category : #asserting }
Board >> assertThat: aCard isBeingAppliedTo: aSpaceshipName [

	| spaceship |
	spaceship := self getSpaceshipByName: aSpaceshipName.
	(spaceship cardsBeingApplied anySatisfy: [ :eachCard |
		 eachCard isSameTypeAs: aCard ]) ifFalse: [
		Error signal:
			'No card of the same type as  is being applied to spaceship ' ].
	^ spaceship
]

{ #category : #asserting }
Board >> assertThatIsNotInitialized [

	spaceshipsPositions keysAndValuesDo: [ :spaceship :position |
		(position lapNumber = 0 and: [ position spotNumber = 1 ]) ifFalse: [
			Error signal:
				'Spaceship "' , spaceship name
				, '" is not in the starter position.' ] ]
]

{ #category : #getters }
Board >> dealer [

	^ cardDealer
]

{ #category : #effectApplying }
Board >> executeAMoonwalkTo: aSpaceshipName of: aMoonwalkNumber [

	| spaceships positionBeforeMoonwalk |
	spaceships := self spaceshipPositions keys.
	spaceships do: [ :eachSpaceship |
		eachSpaceship name == aSpaceshipName ifFalse: [
			positionBeforeMoonwalk := self positionOf: eachSpaceship name.
			
				self move: eachSpaceship name from: positionBeforeMoonwalk to: aMoonwalkNumber * -1 
				 ] ]
]

{ #category : #effectApplying }
Board >> executeASpeedUpTo: aSpaceship of: aSpeedUpNumber [

	| positionBeforeSpeedUp |
	positionBeforeSpeedUp := self positionOf: aSpaceship.
	
		self
			move: aSpaceship
			from: positionBeforeSpeedUp
			to: aSpeedUpNumber 
		
]

{ #category : #effectApplying }
Board >> executeAWormholeTo: aSpaceship of: aWormholeNumber [

	| positionBeforeWormhole |
	positionBeforeWormhole := self positionOf: aSpaceship.
	self
		move: aSpaceship
		from: positionBeforeWormhole
		to: aWormholeNumber
]

{ #category : #effectApplying }
Board >> executeAnHyperJumpTo: aSpaceship of: parsecsForThisJump [

	| positionBeforeJump jumpNumber |
	positionBeforeJump := self positionOf: aSpaceship.
	jumpNumber := self getAmountOfSpotsToMoveGivenParsecs:
		              parsecsForThisJump.
		
			self
				move: aSpaceship
				from: positionBeforeJump
				to: jumpNumber 
		
]

{ #category : #getters }
Board >> getAllCardsAffecting: aSpaceship [

	| cardsBeingAppliedToSpaceship |
	cardsBeingAppliedToSpaceship := OrderedCollection new.
	cardsBeingAppliedToSpaceship addAll: fleet cardsBeingApplied.
	(spaceshipsPositions keys includes: aSpaceship)
		ifTrue: [
		cardsBeingAppliedToSpaceship addAll: aSpaceship cardsBeingApplied ]
		ifFalse: [
		Error signal: 'That spaceship does not exist in current board.' ].
	^ cardsBeingAppliedToSpaceship
]

{ #category : #getters }
Board >> getAmountOfSpotsToMoveGivenParsecs: anAmountOfParsecs [

	| amountOfSpots parsecsPerSpot amountOfParsecsToMove amountOfSpotsToMove |
	lengthInParsecs := self lengthInParsecs.
	amountOfSpots := self lengthInSpots.
	parsecsPerSpot := lengthInParsecs / amountOfSpots.
	amountOfParsecsToMove := anAmountOfParsecs distancetInParsecs.
	amountOfSpotsToMove := amountOfParsecsToMove // parsecsPerSpot.
	^ amountOfSpotsToMove
]

{ #category : #getters }
Board >> getFleet [

	^ fleet
]

{ #category : #getters }
Board >> getHandOf: aSpaceshipName [

	| spaceship |
	spaceship := spaceshipsPositions keys
		             detect: [ :eachSpaceship |
		             eachSpaceship name = aSpaceshipName ]
		             ifNone: [
		             Error signal:
			             'There is no spaceship with that name in this board.' ].
	^ spaceship hand
]

{ #category : #getters }
Board >> getSpaceshipByName: aSpaceshipName [

	| spaceship |
	spaceship := spaceshipsPositions keys
		             detect: [ :eachSpaceship |
		             eachSpaceship name = aSpaceshipName ]
		             ifNone: [
		             Error signal: 'That spaceship does not exist.' ].

	^ spaceship
]

{ #category : #initialization }
Board >> initializeSpaceships: spaceshipNames [

	^ spaceshipNames collect: [ :eachName |
		  cardDealer dealInitialCardsTo: eachName ]
]

{ #category : #initialization }
Board >> initializeWith: aCollectionOfSpots and: aLengthInParsecs around: anAmountOfLaps playedBy: aCollectionOfSpaceshipsNames dealtBy: aCardDealer [

	| amountOfSpaceships |
	layout := aCollectionOfSpots.
	lengthInParsecs := aLengthInParsecs.
	laps := anAmountOfLaps.
	length := aCollectionOfSpots size.
	amountOfSpaceships := aCollectionOfSpaceshipsNames size.
	lastEffectAplied := NoEffect new.
	spaceshipsPositions := Dictionary new: amountOfSpaceships.
	cardDealer := aCardDealer.
	playingSpaceships := self initializeSpaceships:
		                     aCollectionOfSpaceshipsNames.
	fleet := Fleet create.
	1 to: amountOfSpaceships do: [ :spaceship |
		spaceshipsPositions
			at: (playingSpaceships at: spaceship)
			put: (Position at: 0 on: 1) ]
]

{ #category : #asserting }
Board >> isLapDecreasedIf: spotBeforeRoll moves: rollNumber [

	^ spotBeforeRoll + rollNumber < 1
]

{ #category : #asserting }
Board >> isLapFinishedIf: spotBeforeRoll moves: rollNumber [

	^ spotBeforeRoll + rollNumber > self lengthInSpots
]

{ #category : #getters }
Board >> lengthInParsecs [

	^ lengthInParsecs
]

{ #category : #getters }
Board >> lengthInSpots [

	^ length
]

{ #category : #moving }
Board >> move: aSpaceshipName from: positionBeforeRoll to: rollNumber [

	| totalSpotsCovered spotBeforeRoll lapBeforeRoll spotsAfterRoll lapAfterRoll lapLengthInSpots |
	spotBeforeRoll := positionBeforeRoll spotNumber.
	lapBeforeRoll := positionBeforeRoll lapNumber.
	lapLengthInSpots := self lengthInSpots.
	totalSpotsCovered := spotBeforeRoll
	                     + (lapBeforeRoll * lapLengthInSpots)
	                     + rollNumber.
	totalSpotsCovered >= 1
		ifTrue: [ 
			lapAfterRoll := totalSpotsCovered // lapLengthInSpots.
			spotsAfterRoll := totalSpotsCovered % lapLengthInSpots.
			spotsAfterRoll = 0 ifTrue: [ 
				spotsAfterRoll := lapLengthInSpots.
				lapAfterRoll := lapAfterRoll - 1 ].
			lapAfterRoll >= laps
				ifTrue: [ self moveToFinishLine: aSpaceshipName ]
				ifFalse: [ 
				self move: aSpaceshipName to: lapAfterRoll and: spotsAfterRoll ] ]
		ifFalse: [ self move: aSpaceshipName to: 0 and: 1 ]
]

{ #category : #moving }
Board >> move: aSpaceshipName to: aLapNumber and: aSpotNumber [

	| spaceship |
	spaceship := spaceshipsPositions keys
		             detect: [ :each | each name = aSpaceshipName ]
		             ifNone: [
		             Error signal:
			             'Spaceship not found for the given name: ' ].
	spaceshipsPositions
		at: spaceship
		put: (Position at: aLapNumber on: aSpotNumber)
]

{ #category : #moving }
Board >> moveAllSpaceshipsToStartOfLap [

	| spaceships lapBeforeAtomicBomb |
	spaceships := self spaceshipPositions keys.
	spaceships do: [ :eachSpaceship |
		lapBeforeAtomicBomb := (self positionOf: eachSpaceship name)
			                       lapNumber.
		self move: eachSpaceship name to: lapBeforeAtomicBomb and: 1 ]
]

{ #category : #moving }
Board >> moveToFinishLine: aSpaceship [

	self move: aSpaceship to: laps and: length
]

{ #category : #getters }
Board >> positionOf: aSpaceshipName [

	| spaceship |
	spaceship := spaceshipsPositions keys
		             detect: [ :each | each name = aSpaceshipName ]
		             ifNone: [
		             Error signal:
			             'Spaceship not found for the given name: ' ].
	^ spaceshipsPositions at: spaceship
]

{ #category : #getters }
Board >> rankingOfSpaceships [

	| spaceshipsArray |
	spaceshipsArray := self spaceshipPositions keys.
	self sortSpaceshipsByPosition: spaceshipsArray.
	^ spaceshipsArray
]

{ #category : #affectApplying }
Board >> revertEffectOnSpot: aSpotNumber [ 
	layout at: aSpotNumber put: ((layout at: aSpotNumber) revert).
]

{ #category : #getters }
Board >> sortSpaceshipsByPosition: spaceshipsArray [

	| positionOfFirstSpaceship positionOfSecondSpaceship |
	spaceshipsArray sort: [ :firstSpaceship :secondSpaceship |
		positionOfFirstSpaceship := self positionOf: firstSpaceship name.
		positionOfSecondSpaceship := self positionOf: secondSpaceship name.
		positionOfFirstSpaceship > positionOfSecondSpaceship ]
]

{ #category : #getters }
Board >> spaceshipPositions [

	^ spaceshipsPositions
]
