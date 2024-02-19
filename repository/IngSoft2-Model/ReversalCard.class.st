"
i represent a type of card: reversal
"
Class {
	#name : #ReversalCard,
	#superclass : #Card,
	#instVars : [
		'affectedSpot'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #assertions }
ReversalCard >> assertThatIsACard [
	^ true
]

{ #category : #creating }
ReversalCard >> createOwnAction [
    
	^ ReversalAction new
]

{ #category : #effect }
ReversalCard >> effectOnPlay [
	
	^0
]

{ #category : #effect }
ReversalCard >> handleCancelation: aBoard [ 
	aBoard revertEffectOnSpot: affectedSpot.
]

{ #category : #setter }
ReversalCard >> isAffectingSpotNumber: aSpot [ 
	affectedSpot := aSpot
]

{ #category : #testing }
ReversalCard >> isSameTypeAs: aCard [

	^ self class = aCard class
]
