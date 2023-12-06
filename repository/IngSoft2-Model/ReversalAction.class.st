"
I represent a reversal action made by a reversal card.
"
Class {
	#name : #ReversalAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
ReversalAction >> on: aGameInstance by: aSpaceship to: aSpot with: aReversalCard [ 

	aGameInstance
		reversalCardPlayedBy: aSpaceship
		applyTo: aSpot
		with: aReversalCard
]
