"
i represent a taguet for a card
"
Class {
	#name : #Targuet,
	#superclass : #Object,
	#instVars : [
		'targuetSpot',
		'targuetSpaceship',
		'targuetCard',
		'targuetObject'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Targuet class >> createAimingAt: aTarget [ 
	^ self new initializeWith: aTarget.
]

{ #category : #initialization }
Targuet class >> createAimingAt: aSpaceship and: aCard [ 
	^ self new initializeWith: aSpaceship and: aCard.
]

{ #category : #initialization }
Targuet >> initializeWith: aTargetObject [ 
	targuetObject := aTargetObject
]

{ #category : #initialization }
Targuet >> initializeWith: aSpaceship and: aCard [ 
	targuetSpaceship := aSpaceship.
	targuetCard := aCard.
]

{ #category : #getters }
Targuet >> targuetCard [
	^ targuetCard
]

{ #category : #getters }
Targuet >> targuetObject [
	^ targuetObject
]

{ #category : #getters }
Targuet >> targuetSpaceship [
	^ targuetSpaceship
]
