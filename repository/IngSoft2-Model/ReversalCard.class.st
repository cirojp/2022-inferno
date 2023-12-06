"
i represent a type of card: reversal
"
Class {
	#name : #ReversalCard,
	#superclass : #Object,
	#instVars : [
		'reversedSpot'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
ReversalCard >> = aCard [

	^ self class = aCard class
]

{ #category : #playing }
ReversalCard >> affecting: aSpot [
	reversedSpot := aSpot.
]

{ #category : #assertions }
ReversalCard >> assertThatIsACard [
	^ self checkIfItIsAValidCard
]

{ #category : #assertions }
ReversalCard >> checkIfItIsAValidCard [
	^ true
]

{ #category : #creating }
ReversalCard >> createOwnAction [
	^ ReversalAction new.
]

{ #category : #redoer }
ReversalCard >> createOwnRedoAction [
	^ RedoReversalAction new.
]

{ #category : #assertions }
ReversalCard >> effectOnPlay [
	
	^ 0
]

{ #category : #getters }
ReversalCard >> spotReversed [
	^reversedSpot.
]
