"
i represent a type of effect: moonwalk
"
Class {
	#name : #Moonwalk,
	#superclass : #Object,
	#instVars : [
		'number',
		'reversed'
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

{ #category : #effectApplying }
Moonwalk >> applyMoonwalkIn: aBoard to: aSpaceship [ 
	aBoard executeAMoonwalkTo: aSpaceship of: number 
]

{ #category : #applying }
Moonwalk >> applyTo: aBoard by: aSpaceship [
	self applyMoonwalkIn: aBoard to: aSpaceship

]

{ #category : #initialization }
Moonwalk >> initializeWith: aMoonwalkNumber [

	number := aMoonwalkNumber
]

{ #category : #effectApplying }
Moonwalk >> reverse [
	reversed := reversed not.
	number := number negated.
]

{ #category : #effectApplying }
Moonwalk >> setReversedFalse [
	reversed := false.
]
