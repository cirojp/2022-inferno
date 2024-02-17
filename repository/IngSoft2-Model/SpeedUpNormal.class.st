"
i represent the normal state of a speedup effect
"
Class {
	#name : #SpeedUpNormal,
	#superclass : #SpeedUp,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
SpeedUpNormal >> applyTo: aBoard by: aSpaceship [

	| speedUpNumber |
	speedUpNumber := 4.
	aBoard executeASpeedUpTo: aSpaceship of: speedUpNumber
]

{ #category : #'instance creation' }
SpeedUpNormal >> revert [
        
		| reversedInstance |
        reversedInstance := SpeedUpReversed new.
        reversedInstance setSpeedUpState: reversedInstance. 
        ^ reversedInstance.
       
]
