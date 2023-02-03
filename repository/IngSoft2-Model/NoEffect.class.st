"
i represent a type of effect, no effect, which does nothing to the game
"
Class {
	#name : #NoEffect,
	#superclass : #Object,
	#instVars : [
		'isReversed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
NoEffect >> applyTo: aBoard by: aSpaceship [
]

{ #category : #assertions }
NoEffect >> assertThatIsACard [
	^ false.
]

{ #category : #reversing }
NoEffect >> reverse [

]

{ #category : #setter }
NoEffect >> setReversedFalse [
	isReversed := false.
]
