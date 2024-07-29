Extension { #name : 'TrianglePaintPatch' }

{ #category : '*Athens-Cairo' }
TrianglePaintPatch >> addToCairoMeshGradientPaint2: meshGradientPaint [
	meshGradientPaint
		beginPatch2;
		moveTo2: controlPoints first;
		lineTo2: controlPoints second;
		lineTo2: controlPoints third;
		setCorner2: 0 color: colors first;
		setCorner2: 1 color: colors second;
		setCorner2: 2 color: colors third;
		endPatch2
]

{ #category : '*Athens-Cairo' }
TrianglePaintPatch >> addToCairoMeshGradientPaint: meshGradientPaint [
	meshGradientPaint
		beginPatch;
		moveTo: controlPoints first;
		lineTo: controlPoints second;
		lineTo: controlPoints third;
		setCorner: 0 color: colors first;
		setCorner: 1 color: colors second;
		setCorner: 2 color: colors third;
		endPatch
]
