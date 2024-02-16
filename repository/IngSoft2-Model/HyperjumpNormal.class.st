Class {
	#name : #HyperjumpNormal,
	#superclass : #Hyperjump,
	#classInstVars : [
		'jumpsArray'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
HyperjumpNormal >> applyTo: aBoard by: aSpaceship [

	self applyHyperJumpIn: aBoard to: aSpaceship
]

{ #category : #initialization }
HyperjumpNormal >> initializeWith: aJumpsArray [

	jumpsArray := aJumpsArray sorted reversed
]
