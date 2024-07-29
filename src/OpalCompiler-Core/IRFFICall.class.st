Class {
	#name : 'IRFFICall',
	#superclass : 'IRInstruction',
	#instVars : [
		'externalFunction',
		'runner'
	],
	#category : 'OpalCompiler-Core-IR-Nodes',
	#package : 'OpalCompiler-Core',
	#tag : 'IR-Nodes'
}

{ #category : 'visiting' }
IRFFICall >> accept: aVisitor [
	^ aVisitor visitFFICall: self
]

{ #category : 'accessing' }
IRFFICall >> externalFunction [

	^ externalFunction
]

{ #category : 'accessing' }
IRFFICall >> externalFunction: anObject [

	externalFunction := anObject
]

{ #category : 'accessing' }
IRFFICall >> runner [

	^ runner
]

{ #category : 'accessing' }
IRFFICall >> runner: anObject [

	runner := anObject
]
