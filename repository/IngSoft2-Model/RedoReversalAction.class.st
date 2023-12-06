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
