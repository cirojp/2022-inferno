"
i represent a type of effect: moonwalk
"
Class {
	#name : #Moonwalk,
	#superclass : #Object,
	#instVars : [
		'number',
		'isReversed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Moonwalk class >> assertValid: aMoonwalkNumber [

	aMoonwalkNumber >= 0 ifFalse: [ 
		Error signal: 'Moonwalk number cant be a negative number.' ]
]

{ #category : #initialization }
Moonwalk class >> createWith: aMoonwalkNumber [

	self assertValid: aMoonwalkNumber.
	^ self new initializeWith: aMoonwalkNumber
]

{ #category : #applying }
Moonwalk >> applyTo: aBoard by: aSpaceship [

	| positionsAfterEffect spaceships moonwalkNumber |
	spaceships := aBoard spaceshipPositions keys.
	moonwalkNumber := (number *(-1)).
	isReversed ifTrue: [ moonwalkNumber := (-1 * moonwalkNumber) ]. 
	positionsAfterEffect := Dictionary new.
	 spaceships do: [ :eachSpaceship | 
		(eachSpaceship) == aSpaceship ifFalse: [ 
			
			positionsAfterEffect at: eachSpaceship put: moonwalkNumber .
			 ] ].
	^positionsAfterEffect .
]

{ #category : #initialization }
Moonwalk >> initializeWith: aMoonwalkNumber [

	number := aMoonwalkNumber.
]

{ #category : #reversing }
Moonwalk >> reverse [
	isReversed := isReversed
		              ifTrue: [ false ]
		              ifFalse: [ true ]
]

{ #category : #setters }
Moonwalk >> setReversedFalse [
	isReversed := false.
]
