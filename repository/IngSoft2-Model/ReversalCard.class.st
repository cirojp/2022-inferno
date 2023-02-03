"
i represent a type of card: reversal
"
Class {
	#name : #ReversalCard,
	#superclass : #Object,
	#instVars : [
		'affectedSpot'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
ReversalCard >> = aCard [

	^ self class = aCard class
]

{ #category : #assertions }
ReversalCard >> assertThatIsACard [
	^ self checkIfItIsAValidCard
]

{ #category : #assertions }
ReversalCard >> checkIfItIsAValidCard [
	^true.
]

{ #category : #playing }
ReversalCard >> effectOnPlay [
	^0
]

{ #category : #setters }
ReversalCard >> setAffectedSpot: number [ 
	affectedSpot := number .
]

{ #category : #getters }
ReversalCard >> spotAffected [
	^ affectedSpot .
]
