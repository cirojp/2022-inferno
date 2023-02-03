"
i represent a type of effect: wormhole
"
Class {
	#name : #Wormhole,
	#superclass : #Object,
	#instVars : [
		'isReversed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
Wormhole >> applyTo: aBoard by: aSpaceship [

	| positionsAfterEffect  wormholeNumber |
	wormholeNumber := isReversed
		                 ifTrue: [ 4 ]
		                 ifFalse: [ -4 ].
	positionsAfterEffect := Dictionary new: 1.
	positionsAfterEffect at: aSpaceship put: wormholeNumber.
	^positionsAfterEffect .
]

{ #category : #reversing }
Wormhole >> reverse [
	isReversed := isReversed
		              ifTrue: [ false ]
		              ifFalse: [ true ]
]

{ #category : #setters }
Wormhole >> setReversedFalse [
	isReversed := false.
]
