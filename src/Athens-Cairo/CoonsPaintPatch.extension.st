Extension { #name : 'CoonsPaintPatch' }

{ #category : '*Athens-Cairo' }
CoonsPaintPatch >> addToCairoMeshGradientPaint2: meshGradientPaint [
	meshGradientPaint
		beginPatch2;
		moveTo2: (controlPoints at: 1);
		curveVia2: (controlPoints at: 2) and: (controlPoints at: 3) to: (controlPoints at: 4);
		curveVia2: (controlPoints at: 5) and: (controlPoints at: 6) to: (controlPoints at: 7);
		curveVia2: (controlPoints at: 8) and: (controlPoints at: 9) to: (controlPoints at: 10);
		curveVia2: (controlPoints at: 11) and: (controlPoints at: 12) to: (controlPoints at: 1);
		setCorner2: 0 color: colors first;
		setCorner2: 1 color: colors second;
		setCorner2: 2 color: colors third;
		setCorner2: 3 color: colors fourth;
		endPatch2
]

{ #category : '*Athens-Cairo' }
CoonsPaintPatch >> addToCairoMeshGradientPaint: meshGradientPaint [
	meshGradientPaint
		beginPatch;
		moveTo: (controlPoints at: 1);
		curveVia: (controlPoints at: 2) and: (controlPoints at: 3) to: (controlPoints at: 4);
		curveVia: (controlPoints at: 5) and: (controlPoints at: 6) to: (controlPoints at: 7);
		curveVia: (controlPoints at: 8) and: (controlPoints at: 9) to: (controlPoints at: 10);
		curveVia: (controlPoints at: 11) and: (controlPoints at: 12) to: (controlPoints at: 1);
		setCorner: 0 color: colors first;
		setCorner: 1 color: colors second;
		setCorner: 2 color: colors third;
		setCorner: 3 color: colors fourth;
		endPatch
]
