"
I represent an action or play made by an aredo card when the last card played was a cancelattion card.
"
Class {
	#name : #RedoCancellationAction,
	#superclass : #Action,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
RedoCancellationAction >> on: aZathuraGame by: applyingSpaceship to: aTarget with: aRedoCard [

	aZathuraGame
		redoCancelationCard: aTarget targuetCard
		from: aTarget targuetSpaceship  
		PlayedBy: applyingSpaceship
		with: aRedoCard
]
