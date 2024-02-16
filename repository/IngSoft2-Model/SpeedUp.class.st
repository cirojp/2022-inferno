"
i represent a type of effect: speedup
"
Class {
	#name : #SpeedUp,
	#superclass : #Effect,
	#instVars : [
		'state'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SpeedUp class >> newInstance [
	"Factory method para crear una nueva instancia de SpeedUp con el estado inicial normal"
        ^self newNormal
]

{ #category : #'instance creation' }
SpeedUp class >> newNormal [
	"Crea una nueva instancia de SpeedUp en su estado inicial 'normal'"
        ^SpeedUpNormal new
]

{ #category : #applying }
SpeedUp >> applyTo: aBoard by: aSpaceship [

	self subclassResponsibility.
]

{ #category : #'instance creation' }
SpeedUp >> revert [
        "Cambia el estado del objeto SpeedUp"
        self subclassResponsibility.
]

{ #category : #'instance creation' }
SpeedUp >> setSpeedUpState: aState [
        "Establece el estado del objeto SpeedUp"
        state := aState
]
