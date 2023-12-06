"
i reprsent a type of effect: cardpicker

"
Class {
	#name : #CardPicker,
	#superclass : #Object,
	#instVars : [
		'reversed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
CardPicker >> applyTo: aBoard by: aSpaceship [

	| pickedCard |
	reversed
		ifFalse: [ pickedCard := aBoard dealOneCard ]
		ifTrue: [ pickedCard := false ].
	^ pickedCard
]

{ #category : #effectApplying }
CardPicker >> reverse [
	reversed := reversed not.
]

{ #category : #effectApplying }
CardPicker >> setReversedFalse [
	reversed := false.
]
