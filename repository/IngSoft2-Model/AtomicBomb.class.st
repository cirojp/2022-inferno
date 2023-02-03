"
i represent a type of effect: atomicbomb
"
Class {
	#name : #AtomicBomb,
	#superclass : #Object,
	#instVars : [
		'isReversed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
AtomicBomb >> applyTo: aBoard by: aSpaceship [
	aBoard moveAllSpaceshipsToStartOfLap.
]

{ #category : #asserting }
AtomicBomb >> assertThatIsACard [
	^false.
]

{ #category : #reversing }
AtomicBomb >> reverse [
	
]

{ #category : #setters }
AtomicBomb >> setReversedFalse [
	isReversed := false.
]
