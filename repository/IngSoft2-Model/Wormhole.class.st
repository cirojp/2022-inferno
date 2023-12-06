"
i represent a type of effect: wormhole
"
Class {
	#name : #Wormhole,
	#superclass : #Object,
	#instVars : [
		'wormHoleValue',
		'reversed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Wormhole class >> assertValid: aWormHoleValue [ 
	aWormHoleValue isInteger ifFalse: [ 
			Error signal: 'Values of WormHole must be numbers' ]
]

{ #category : #asserting }
Wormhole class >> createWith: aWormHoleValue [ 
	self assertValid: aWormHoleValue.
	^self new initializeWith: aWormHoleValue.
]

{ #category : #applying }
Wormhole >> applyTo: aBoard by: aSpaceship [

	self applyWormholeIn: aBoard to: aSpaceship.
	^true.
]

{ #category : #effectApplying }
Wormhole >> applyWormholeIn: aBoard to: aSpaceship [

	| wormholeNumber |
	wormholeNumber := wormHoleValue.
	aBoard executeAWormholeTo: aSpaceship of: wormholeNumber
]

{ #category : #effectApplying }
Wormhole >> initializeWith: aWormHoleValue [
	wormHoleValue := aWormHoleValue.
]

{ #category : #effectApplying }
Wormhole >> reverse [
	reversed := reversed not.
	wormHoleValue := wormHoleValue negated.
]

{ #category : #effectApplying }
Wormhole >> setReversedFalse [
	reversed := false.
]
