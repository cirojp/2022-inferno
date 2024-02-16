"
i represent a type of effect: moonwalk
"
Class {
	#name : #Moonwalk,
	#superclass : #Effect,
	#instVars : [
		'number',
		'state'
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
	^self newNormalWith: aMoonwalkNumber
	
]

{ #category : #initialization }
Moonwalk class >> newNormalWith: aMoonwalkNumber [
	"Crea una nueva instancia de SpeedUp en su estado inicial 'normal'"
        ^MoonwalkNormal new initializeWith: aMoonwalkNumber
	
]

{ #category : #applying }
Moonwalk >> applyTo: aBoard by: aSpaceship [
	self subclassResponsibility.
]

{ #category : #initialization }
Moonwalk >> initializeWith: aMoonwalkNumber [

	self subclassResponsibility.
]

{ #category : #applying }
Moonwalk >> revert [
	"Cambia el estado del objeto Moonwalk"
        self subclassResponsibility.
]

{ #category : #initialization }
Moonwalk >> setMoonwalkState: aState [
        "Establece el estado del objeto SpeedUp"
        state := aState
]
