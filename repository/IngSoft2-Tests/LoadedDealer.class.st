"
I represent a test class, like dealer, but it gives one of each card not at random so it can be tested. I must be passed the exact amount of cards to be dealed and once dealed to a spaceship, it will be deleted from types.
"
Class {
	#name : #LoadedDealer,
	#superclass : #Object,
	#instVars : [
		'deck'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
LoadedDealer class >> assertValidTypes: aCollectionOfTypes [ 
	aCollectionOfTypes isNotEmpty ifFalse:[ 
					Error signal:
			'Cannot create a card dealer with no types of cards ' ].
			aCollectionOfTypes do: [:eachCard | 
			(eachCard assertThatIsACard) ifFalse: [
				Error signal: 'Array contains an object that is not a Card'
			]].
]

{ #category : #initializing }
LoadedDealer class >> ofTypes: aCollectionOfTypes [ 
	self assertValidTypes: aCollectionOfTypes.
 	^self new initializeWith: aCollectionOfTypes 
]

{ #category : #dealing }
LoadedDealer >> dealInitialCardsTo: arg1 [

	| card1 card2 aSpaceship availableCards |
	availableCards := deck copy.
	card1 := deck at: 1.
	card2 := deck at: 2.
	aSpaceship := Spaceship named: arg1 containing: { 
			              card1.
			              card2 }.
	availableCards := availableCards copyWithoutAll: { 
			                  card1.
			                  card2 }.
	availableCards := availableCards copyWith: card1.
	availableCards := availableCards copyWith: card2.
	deck := availableCards.
	^ aSpaceship
]

{ #category : #dealing }
LoadedDealer >> dealOne [
	^ deck removeLast.
]

{ #category : #initialization }
LoadedDealer >> initializeWith: aCollectionOfTypes [
	deck := aCollectionOfTypes.
]
