"
I represent an action or play made by an cancellation card.
"
Class {
	#name : #CancellationAction,
	#superclass : #Action,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
CancellationAction >> on: aZathuraGame by: applyingSpaceship to: aTarget with: aCancellationCard [

	aTarget targuetCard
		ifNil: [ 
			aZathuraGame
				cancelFleetCard: aTarget targuetObject
				with: aCancellationCard
				playedBy: applyingSpaceship ]
		ifNotNil: [ 
			aZathuraGame
				cancelCard: (aTarget targuetCard)
				from: (aTarget targuetSpaceship)
				playedBy: applyingSpaceship
				with: aCancellationCard ]
]
