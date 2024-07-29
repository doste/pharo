Extension { #name : 'Color' }

{ #category : '*Athens-Cairo' }
Color >> loadOnCairoCanvas2: aCairoCanvas [
	aCairoCanvas
		setSourceR2: self red g: self green b: self blue a: self alpha
]

{ #category : '*Athens-Cairo' }
Color >> loadOnCairoCanvas: aCairoCanvas [
	aCairoCanvas
		setSourceR: self red g: self green b: self blue a: self alpha
]
