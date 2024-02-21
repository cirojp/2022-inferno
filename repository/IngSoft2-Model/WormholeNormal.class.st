"
i represent the normal state of a wormhole effect
"
Class {
	#name : #WormholeNormal,
	#superclass : #Wormhole,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
WormholeNormal >> applyTo: aBoard by: aSpaceship [

	| wormholeNumber |
	wormholeNumber := -4.
	aBoard executeAWormholeTo: aSpaceship of: wormholeNumber
]

{ #category : #'instance creation' }
WormholeNormal >> revert [
        
		| reversedInstance |
        reversedInstance := WormholeReversed new.
        reversedInstance setWormholeState: reversedInstance. 
        ^ reversedInstance.
       
]
