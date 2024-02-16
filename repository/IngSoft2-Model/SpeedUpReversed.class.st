"
i represent the reversed state of a speedup effect
"
Class {
	#name : #SpeedUpReversed,
	#superclass : #SpeedUp,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
SpeedUpReversed >> applyTo: aBoard by: aSpaceship [

	| speedUpNumber |
	speedUpNumber := -4.
	aBoard executeASpeedUpTo: aSpaceship of: speedUpNumber
]

{ #category : #'instance creation' }
SpeedUpReversed >> revert [
        "Cambia el estado del objeto SpeedUp a 'normal'"
        self setSpeedUpState: SpeedUpNormal new
]
