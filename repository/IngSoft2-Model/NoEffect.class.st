"
i represent a type of effect, no effect, which does nothing to the game
"
Class {
	#name : #NoEffect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
NoEffect >> applyTo: aBoard by: aSpaceship [
	^ true.
]

{ #category : #effectApplying }
NoEffect >> reverse [
	
]

{ #category : #applying }
NoEffect >> setReversedFalse [
	
]
