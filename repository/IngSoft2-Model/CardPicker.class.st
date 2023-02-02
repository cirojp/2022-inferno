"
i reprsent a type of effect: cardpicker

"
Class {
	#name : #CardPicker,
	#superclass : #Object,
	#instVars : [
		'isReversed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
CardPicker >> applyTo: aBoard by: aSpaceship [

	| pickedCard |
	pickedCard := aBoard dealCard.
	^ pickedCard
]

{ #category : #reversing }
CardPicker >> reverse [
	
]

{ #category : #setters }
CardPicker >> setReversedFalse [
	isReversed := false.
]
