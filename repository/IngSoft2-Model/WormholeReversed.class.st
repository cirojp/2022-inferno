"
i represent the reversed state of a wormhole effect 
"
Class {
	#name : #WormholeReversed,
	#superclass : #Wormhole,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
WormholeReversed >> applyTo: aBoard by: aSpaceship [

	| wormholeNumber |
	wormholeNumber := 4.
	aBoard executeAWormholeTo: aSpaceship of: wormholeNumber
]

{ #category : #applying }
WormholeReversed >> revert [
        
		| reversedInstance |
        reversedInstance := WormholeNormal new.
        reversedInstance setWormholeState: reversedInstance. 
        ^ reversedInstance.
]
