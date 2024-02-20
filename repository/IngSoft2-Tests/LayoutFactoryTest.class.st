Class {
	#name : #LayoutFactoryTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
LayoutFactoryTest >> should: errorBlock raise: errorClass withMessage: expectedErrorMessage [

	| errorWasRaised errorMessage |
	errorBlock
		on: errorClass
		do: [ :error | 
			errorWasRaised := true.
			errorMessage := error messageText ]
]

{ #category : #tests }
LayoutFactoryTest >> test01GTFCreatesACollectionOfSpotsOfGivenSize [

	| boardLayout amountOfSpots aDictionaryWithModificatorsAndItsProbabilities layoutCreator |
	amountOfSpots := 100.
	layoutCreator := LayoutFactory new.
	aDictionaryWithModificatorsAndItsProbabilities := Dictionary new.
	aDictionaryWithModificatorsAndItsProbabilities at: SpeedUp put: 20.
	aDictionaryWithModificatorsAndItsProbabilities at: Wormhole put: 20.
	aDictionaryWithModificatorsAndItsProbabilities at: AtomicBomb put: 2.
	aDictionaryWithModificatorsAndItsProbabilities at: Moonwalk put: 10.
	aDictionaryWithModificatorsAndItsProbabilities at: Hyperjump  put: 8.
	aDictionaryWithModificatorsAndItsProbabilities at: CardPicker put: 10.
	boardLayout := layoutCreator createLayoutOf: amountOfSpots with: aDictionaryWithModificatorsAndItsProbabilities .
	self assert: boardLayout size equals: amountOfSpots
]

{ #category : #tests }
LayoutFactoryTest >> test02GTFCreatesACollectionOfSpotsFilledWithSpeedUps [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := LayoutFactory new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.
	aDictionaryWithEffectProbabilities at: SpeedUp put: 100.

	boardLayout := anEffectCreator
		               createLayoutOf: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: SpeedUp ) .
]

{ #category : #tests }
LayoutFactoryTest >> test03GTFCreatesACollectionOfSpotsFilledWithAtomicBombs [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := LayoutFactory new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.
	aDictionaryWithEffectProbabilities at: AtomicBomb put: 100.

	boardLayout := anEffectCreator
		               createLayoutOf: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: AtomicBomb ) .
]

{ #category : #tests }
LayoutFactoryTest >> test04GTFCreatesACollectionOfSpotsFilledWithCardPickers [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := LayoutFactory new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.
	aDictionaryWithEffectProbabilities at: CardPicker  put: 100.

	boardLayout := anEffectCreator
		               createLayoutOf: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: CardPicker  ) .
]

{ #category : #tests }
LayoutFactoryTest >> test05GTFCreatesACollectionOfSpotsFilledWithWormHoles [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := LayoutFactory new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.
	aDictionaryWithEffectProbabilities at: Wormhole  put: 100.

	boardLayout := anEffectCreator
		               createLayoutOf: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: Wormhole  ) .
]

{ #category : #tests }
LayoutFactoryTest >> test06GTFCreatesACollectionOfSpotsFilledWithNoEffectsIfNotGivenElse [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := LayoutFactory new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.

	boardLayout := anEffectCreator
		               createLayoutOf: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: NoEffect  ) .
]

{ #category : #tests }
LayoutFactoryTest >> test07GTFCreatesACollectionOfSpotsFilledWithMoonwalk [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := LayoutFactory new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.
	aDictionaryWithEffectProbabilities at: Moonwalk   put: 100.

	boardLayout := anEffectCreator
		               createLayoutOf: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: Moonwalk  ) .
]

{ #category : #tests }
LayoutFactoryTest >> test9GTFCannotCreateLayoutIfProbabilitiesAreMoreThanOneHundred [

	| factory aDictionaryWithEffectsAndItsProbabilities  amountOfEffects error errorMessage errorBlock layout|
	error := Error.
	errorMessage := 'Sum of probabilities is not 100 percent.'.
	factory := LayoutFactory new.
	amountOfEffects := 1.
	aDictionaryWithEffectsAndItsProbabilities := Dictionary new.
	aDictionaryWithEffectsAndItsProbabilities at: SpeedUp put: 101.
	errorBlock := [layout := factory createLayoutOf: amountOfEffects with: aDictionaryWithEffectsAndItsProbabilities. ].
	self should: errorBlock raise: error  withMessage: errorMessage 
]
