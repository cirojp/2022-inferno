"
i represent a type of effect: wormhole
"
Class {
	#name : #Wormhole,
	#superclass : #Effect,
	#instVars : [
		'state'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Wormhole class >> newInstance [
	"Factory method para crear una nueva instancia de Wormhole con el estado inicial normal"
        ^self newNormal
]

{ #category : #'instance creation' }
Wormhole class >> newNormal [
	"Crea una nueva instancia de Wormhole en su estado inicial 'normal'"
        ^WormholeNormal new
]

{ #category : #applying }
Wormhole >> applyTo: aBoard by: aSpaceship [

	self subclassResponsibility.
]

{ #category : #'instance creation' }
Wormhole >> revert [
        "Cambia el estado del objeto wormhole"
        self subclassResponsibility.
]

{ #category : #initialization }
Wormhole >> setWormholeState: aState [
        "Establece el estado del objeto Wormhole"
        state := aState
]
