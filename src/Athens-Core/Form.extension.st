Extension { #name : 'Form' }

{ #category : '*Athens-Core' }
Form >> asAthensPaintOn2: canvas [

	^ canvas surface createFormPaint2: self
]

{ #category : '*Athens-Core' }
Form >> asAthensPaintOn: canvas [

	^ canvas surface createFormPaint: self
]
