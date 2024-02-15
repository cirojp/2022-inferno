"
I represent a reversal action made by a reversal card.
"
Class {
	#name : #ReversalAction,
	#superclass : #Action,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
ReversalAction >> on: aZathuraInstance by: aSpaceshipName to: aSpot with: aReversalCard [

	aZathuraInstance
		currentSpaceshipPlaysReversalCard: aReversalCard
		ToEffectOnSpot: aSpot
		playedBy: aSpaceshipName
]
