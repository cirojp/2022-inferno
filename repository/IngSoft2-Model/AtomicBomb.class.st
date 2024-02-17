"
i represent a type of effect: atomicbomb
"
Class {
	#name : #AtomicBomb,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
AtomicBomb >> applyTo: aBoard by: aSpaceship [

	aBoard moveAllSpaceshipsToStartOfLap
]

{ #category : #applying }
AtomicBomb >> revert [
	^self
]
