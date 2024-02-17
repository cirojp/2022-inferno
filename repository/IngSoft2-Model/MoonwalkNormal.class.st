"
i represent the normal state of a Moonwalk effect
"
Class {
	#name : #MoonwalkNormal,
	#superclass : #Moonwalk,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
MoonwalkNormal >> applyTo: aBoard by: aSpaceship [
	aBoard executeAMoonwalkTo: aSpaceship of: number
]

{ #category : #initialization }
MoonwalkNormal >> initializeWith: aMoonwalkNumber [

	number := aMoonwalkNumber
]

{ #category : #applying }
MoonwalkNormal >> revert [

		| reversedInstance |
        reversedInstance := MoonwalkReversed new initializeWith: number.
        reversedInstance setMoonwalkState: reversedInstance.
        ^ reversedInstance.
]
