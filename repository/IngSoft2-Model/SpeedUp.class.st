"
i represent a type of effect: speedup
"
Class {
	#name : #SpeedUp,
	#superclass : #Object,
	#instVars : [
		'isReversed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
SpeedUp >> applyTo: aBoard by: aSpaceship [

	| speedUpNumber positionsAfterEffect |
	speedUpNumber := isReversed
		                 ifTrue: [ -4 ]
		                 ifFalse: [ 4 ].
	positionsAfterEffect := Dictionary new: 1.
	positionsAfterEffect at: aSpaceship put: speedUpNumber.
	^ positionsAfterEffect
]

{ #category : #reversing }
SpeedUp >> reverse [
	isReversed := isReversed
		              ifTrue: [ false ]
		              ifFalse: [ true ]
]

{ #category : #setter }
SpeedUp >> setReversedFalse [
	isReversed := false.
]
