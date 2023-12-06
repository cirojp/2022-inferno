"
i represent a type of effect: speedup
"
Class {
	#name : #SpeedUp,
	#superclass : #Object,
	#instVars : [
		'reversed',
		'speedUpValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #assertions }
SpeedUp class >> assertValid: aSpeedupValue [ 
	aSpeedupValue isInteger ifFalse: [ 
			Error signal: 'Values of SpeedUp must be numbers' ]
]

{ #category : #'class initialization' }
SpeedUp class >> createWith: aSpeedUpValue [ 
	self assertValid: aSpeedUpValue.
	^self new initializeWith: aSpeedUpValue.
]

{ #category : #effectApplying }
SpeedUp >> applySpeedUpIn: aBoard to: aSpaceship [

	| speedUpNumber |
	speedUpNumber := speedUpValue.
	aBoard executeASpeedUpTo: aSpaceship of: speedUpNumber
]

{ #category : #applying }
SpeedUp >> applyTo: aBoard by: aSpaceship [

	self applySpeedUpIn: aBoard to: aSpaceship.
	^true
]

{ #category : #initialization }
SpeedUp >> initializeWith: aSpeedUpValue [
	speedUpValue := aSpeedUpValue.
]

{ #category : #effectApplying }
SpeedUp >> reverse [
	reversed := reversed not.
	speedUpValue := speedUpValue negated.
]

{ #category : #effectApplying }
SpeedUp >> setReversedFalse [
	reversed := false.
]
