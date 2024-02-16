"
i represent a type of effect: hyperjump
"
Class {
	#name : #Hyperjump,
	#superclass : #Effect,
	#instVars : [
		'jumpsArray',
		'state'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #assertions }
Hyperjump class >> assertValid: aJumpsArray [

	aJumpsArray do: [ :distance |
		distance distance >= 0 ifFalse: [
			Error signal:
				'Values of the collection cannot be a negative number' ] ]
]

{ #category : #'class initialization' }
Hyperjump class >> createWith: aJumpsArray [

	self assertValid: aJumpsArray.
	^self newNormalWith: aJumpsArray
]

{ #category : #'class initialization' }
Hyperjump class >> newNormalWith: aJumpsArray [
	"Crea una nueva instancia de Hyperjump en su estado inicial 'normal'"
        ^HyperjumpNormal new initializeWith: aJumpsArray
]

{ #category : #getters }
Hyperjump >> applyHyperJumpIn: aBoard to: aSpaceship [

	| hyperJumpValues parsecsForThisJump |
	hyperJumpValues := jumpsArray.
	parsecsForThisJump := hyperJumpValues removeFirst.
	hyperJumpValues addLast: parsecsForThisJump.
	aBoard executeAnHyperJumpTo: aSpaceship of: parsecsForThisJump.
]

{ #category : #applying }
Hyperjump >> applyTo: aBoard by: aSpaceship [

	self subclassResponsibility.
]

{ #category : #initialization }
Hyperjump >> initializeWith: aJumpsArray [

	jumpsArray := aJumpsArray sorted reversed
]

{ #category : #getters }
Hyperjump >> jumpValues [

	^ jumpsArray
]

{ #category : #initialization }
Hyperjump >> revert [
	"Cambia el estado del objeto Hyperjump"
        self subclassResponsibility.
]

{ #category : #initialization }
Hyperjump >> setHyperjumpState: aState [
        "Establece el estado del objeto SpeedUp"
        state := aState
]
