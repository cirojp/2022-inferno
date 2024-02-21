"
I represent a repeat action made by a repeat card.
"
Class {
	#name : #RepeatAction,
	#superclass : #Action,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
RepeatAction >> on: aGameInstance by: aSpaceship to: aTarget with: aRepeatCard [

	aGameInstance
		repeatEffectCardPlayedBy: aSpaceship
		applyTo: aTarget targuetObject
		with: aRepeatCard
]
