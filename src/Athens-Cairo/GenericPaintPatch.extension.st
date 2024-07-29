Extension { #name : 'GenericPaintPatch' }

{ #category : '*Athens-Cairo' }
GenericPaintPatch >> addToCairoMeshGradientPaint2: meshGradientPaint [
	meshGradientPaint beginPatch2.
	[
		buildBlock value: meshGradientPaint
	] ensure: [ meshGradientPaint endPatch2 ]
]

{ #category : '*Athens-Cairo' }
GenericPaintPatch >> addToCairoMeshGradientPaint: meshGradientPaint [
	meshGradientPaint beginPatch.
	[
		buildBlock value: meshGradientPaint
	] ensure: [ meshGradientPaint endPatch ]
]
