"
I represent a redo action made by a redo card when the last card played was a reversal card
"
Class {
	#name : #RedoReversalAction,
	#superclass : #Action,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
RedoReversalAction >> on: aZathuraGame by: applyingSpaceship to: aTarget with: aRedoCard [

	aZathuraGame redoReversalCardPlayedBy: applyingSpaceship applyTo: 2 with: aRedoCard
]
