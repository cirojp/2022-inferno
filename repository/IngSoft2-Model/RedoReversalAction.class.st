"
I represent an action or play made by an aredo card when the last card played was a reversal card.
"
Class {
	#name : #RedoReversalAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
RedoReversalAction >> on: aGameInstance by: aSpaceship to: aSpot with: aRedoCard [ 
	aGameInstance
		redoReversalCardPlayedBy: aSpaceship
		applyTo: aSpot
		with: aRedoCard
]
