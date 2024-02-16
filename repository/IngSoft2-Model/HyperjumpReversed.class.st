"
i represent the reversed state of a Hyperjump effect
"
Class {
	#name : #HyperjumpReversed,
	#superclass : #Hyperjump,
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
HyperjumpReversed >> applyHyperJumpIn: aBoard to: aSpaceship [

	| hyperJumpValues parsecsForThisJump |
	hyperJumpValues := jumpsArray.
	parsecsForThisJump := hyperJumpValues removeFirst.
	hyperJumpValues addLast: parsecsForThisJump.
	aBoard executeAnHyperJumpTo: aSpaceship of: (parsecsForThisJump * -1).
]

{ #category : #initialization }
HyperjumpReversed >> applyTo: aBoard by: aSpaceship [

	self applyHyperJumpIn: aBoard to: aSpaceship
]

{ #category : #initialization }
HyperjumpReversed >> initializeWith: aJumpsArray [

	jumpsArray := aJumpsArray sorted reversed
]

{ #category : #initialization }
HyperjumpReversed >> revert [
        "Cambia el estado del objeto Moonwalk a 'reversed'"
        self setHyperjumpState: (HyperjumpNormal new initializeWith: jumpsArray)
]
