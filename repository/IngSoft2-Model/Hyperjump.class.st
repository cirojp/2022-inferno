"
i represent a type of effect: hyperjump
"
Class {
	#name : #Hyperjump,
	#superclass : #Object,
	#instVars : [
		'jumpsArray',
		'isReversed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #assertions }
Hyperjump class >> assertValid: aJumpsArray [ 
	aJumpsArray do: [ :distance | (distance distance) >= 0 ifFalse: [ 
			Error signal: 'Values of the collection cannot be a negative number' ] ].
]

{ #category : #'class initialization' }
Hyperjump class >> createWith: aJumpsArray [ 
	self assertValid: aJumpsArray.
	^self new initializeWith: aJumpsArray.
]

{ #category : #applying }
Hyperjump >> applyTo: aBoard by: aSpaceship [

	| jumpNumber positionsAfterEffect |
	
	jumpNumber := self getJumpNumberInSpots: aBoard.
	isReversed ifTrue: [ jumpNumber := (-1 * jumpNumber) ]. 
	positionsAfterEffect := Dictionary new: 1.
	positionsAfterEffect at: aSpaceship put: jumpNumber.
	^positionsAfterEffect .
]

{ #category : #getters }
Hyperjump >> getJumpNumberInSpots: aBoard [

	| hyperJumpValues parsecsForThisJump lengthInParsecs amountOfSpots parsecsPerSpot amountOfSpotsToJump amountOfParsecsToJump |
	hyperJumpValues := jumpsArray.
	parsecsForThisJump := hyperJumpValues removeFirst.
	hyperJumpValues addLast: parsecsForThisJump.
	lengthInParsecs := aBoard lengthInParsecs.
	amountOfSpots := aBoard lengthInSpots.
	parsecsPerSpot := lengthInParsecs / amountOfSpots.
	amountOfParsecsToJump := parsecsForThisJump distancetInParsecs.
	amountOfSpotsToJump := amountOfParsecsToJump // parsecsPerSpot.
	^ amountOfSpotsToJump
]

{ #category : #initialization }
Hyperjump >> initializeWith: aJumpsArray [

	jumpsArray := aJumpsArray sorted reversed.
]

{ #category : #getters }
Hyperjump >> jumpValues [

	^ jumpsArray
]

{ #category : #reversing }
Hyperjump >> reverse [

	isReversed := isReversed
		              ifTrue: [ false ]
		              ifFalse: [ true ]
]

{ #category : #setters }
Hyperjump >> setReversedFalse [
	isReversed := false.
]
