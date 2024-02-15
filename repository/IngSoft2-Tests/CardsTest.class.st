Class {
	#name : #CardsTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardsTest >> test01SpeedCardCanRespondToAssertionMessage [

	| aTestCard |
	aTestCard := SpeedCard new.
	self assert: aTestCard assertThatIsACard
]

{ #category : #tests }
CardsTest >> test02SpeedCardCanAssertThatAnotherInstanceOfSameCardIsOfSameType [

	| aTestCard aCard |
	aTestCard := SpeedCard new.
	aCard := SpeedCard new.
	self assert: (aTestCard isSameTypeAs: aCard)
]

{ #category : #tests }
CardsTest >> test03SpeedCardEffectOnRollIsPlusOne [

	| aTestCard |
	aTestCard := SpeedCard new.
	self assert: aTestCard effectOnPlay equals: 1.
]

{ #category : #tests }
CardsTest >> test04OverloadCardCanRespondToAssertionMessage [

	| aTestCard |
	aTestCard := OverloadCard new.
	self assert: aTestCard assertThatIsACard
]

{ #category : #tests }
CardsTest >> test05OverloadCardCanAssertThatAnotherInstanceOfSameCardIsOfSameType [

	| aTestCard aCard |
	aTestCard := OverloadCard new.
	aCard := OverloadCard new.
	self assert: (aTestCard isSameTypeAs: aCard)
]

{ #category : #tests }
CardsTest >> test06OverloadEffectOnRollIsMinusTwo [

	| aTestCard |
	aTestCard := OverloadCard  new.
	self assert: aTestCard effectOnPlay equals: -2.
]

{ #category : #tests }
CardsTest >> test07CancellationCardCanRespondToAssertionMessage [

	| aTestCard |
	aTestCard := CancellationCard new.
	self assert: aTestCard assertThatIsACard
]

{ #category : #tests }
CardsTest >> test08CancellationCardCanAssertThatAnotherInstanceOfSameCardIsOfSameType [

	| aTestCard aCard |
	aTestCard := CancellationCard new.
	aCard := CancellationCard new.
	self assert: (aTestCard isSameTypeAs: aCard)
]

{ #category : #tests }
CardsTest >> test09AccelerationCardCanRespondToAssertionMessage [

	| aTestCard |
	aTestCard := AccelerationCard new.
	self assert: aTestCard assertThatIsACard
]

{ #category : #tests }
CardsTest >> test10AnAccelerationCardCanAssertThatAnotherCardIsOfSameType [

	| aTestCard aCard |
	aTestCard := AccelerationCard new.
	aCard := AccelerationCard new.
	self assert: (aTestCard isSameTypeAs: aCard)
]

{ #category : #tests }
CardsTest >> test11AccelerationCardEffectOnRollIsPlusOne [

	| aTestCard |
	aTestCard := AccelerationCard new.
	self assert: aTestCard effectOnPlay equals: 1.
]

{ #category : #tests }
CardsTest >> test12RepeatCardCanRespondToAssertionMessage [

	| aTestCard |
	aTestCard := RepeatCard new.
	self assert: aTestCard assertThatIsACard
]

{ #category : #tests }
CardsTest >> test13RepeatCardCanAssertThatAnotherCardIsOfSameType [

	| aTestCard aCard |
	aTestCard := RepeatCard new.
	aCard := RepeatCard new.
	self assert: (aTestCard isSameTypeAs: aCard)
]

{ #category : #tests }
CardsTest >> test14RedoCardCanAssertAnotherCardIsOfSameType [

	| aTestCard aCard |
	aTestCard := RedoCard new.
	aCard := RedoCard new.
	self assert: (aTestCard isSameTypeAs: aCard).
]

{ #category : #tests }
CardsTest >> test15RedoCardCanRespondToAssertionMessage [

	| aTestCard |
	aTestCard := RedoCard new.
	self assert: aTestCard assertThatIsACard
]

{ #category : #tests }
CardsTest >> test16SpeedCardIsCreatedWithADefaultEffectValue [

	| aTestCard |
	aTestCard := SpeedCard new.
	self assert: aTestCard effectOnPlay equals: 1.
]

{ #category : #tests }
CardsTest >> test17OverloadCardIsCreatedWithADefaultEffectValue [

	| aTestCard |
	aTestCard := OverloadCard new.
	self assert: aTestCard effectOnPlay equals: -2.
]

{ #category : #tests }
CardsTest >> test18AccelerationCardCanBeCreatedWithADefaultValue [

	| aTestCard |
	aTestCard := AccelerationCard new.
	self assert: aTestCard effectOnPlay equals: 1.
]

{ #category : #tests }
CardsTest >> test19ReversalCardCanRespondToAssertionMessage [

	| aTestCard |
	aTestCard := ReversalCard new.
	self assert: aTestCard assertThatIsACard
]

{ #category : #tests }
CardsTest >> test20ReversalCardCanAssertThatAnotherInstanceOfSameCardIsOfSameType [

	| aTestCard aCard |
	aTestCard := ReversalCard new.
	aCard := ReversalCard new.
	self assert: (aTestCard isSameTypeAs: aCard)
]
