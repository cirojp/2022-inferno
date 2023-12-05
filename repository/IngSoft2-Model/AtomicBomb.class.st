"
i represent a type of effect: atomicbomb
"
Class {
	#name : #AtomicBomb,
	#superclass : #Object,
	#instVars : [
		'reversed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
AtomicBomb >> applyTo: aBoard by: aSpaceship [
	aBoard moveAllSpaceshipsToStartOfLap.
]

{ #category : #effectApplying }
AtomicBomb >> reverse [
	reversed := reversed not.
]

{ #category : #effectApplying }
AtomicBomb >> setReversedFalse [
	reversed := false.
]
