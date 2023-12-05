"
i represent a type of card: reversal
"
Class {
	#name : #ReversalCard,
	#superclass : #Object,
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
	^ true
]

{ #category : #assertions }
ReversalCard >> effectOnPlay [
	
	^ 0
]
