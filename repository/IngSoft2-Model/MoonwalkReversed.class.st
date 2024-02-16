"
i represent the reversed state of a moonwalk effect
"
Class {
	#name : #MoonwalkReversed,
	#superclass : #Moonwalk,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
MoonwalkReversed >> applyTo: aBoard by: aSpaceship [
	aBoard executeAMoonwalkTo: aSpaceship of: number
]

{ #category : #initialization }
MoonwalkReversed >> initializeWith: aMoonwalkNumber [

	number := (aMoonwalkNumber * -1)
]

{ #category : #'instance creation' }
MoonwalkReversed >> revert [
        "Cambia el estado del objeto Moonwalk a 'reversed'"
        self setMoonwalkState: (MoonwalkNormal new initializeWith: number)
]
