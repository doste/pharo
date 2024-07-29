"
i implement AthensTransform protocol using cairo-specific functions.
"
Class {
	#name : 'AthensCairoTransform',
	#superclass : 'AthensTransform',
	#traits : 'TCairoLibrary',
	#classTraits : 'TCairoLibrary classTrait',
	#instVars : [
		'canvas'
	],
	#category : 'Athens-Cairo-Transforms',
	#package : 'Athens-Cairo',
	#tag : 'Transforms'
}

{ #category : 'instance creation' }
AthensCairoTransform class >> for: cairoCanvas [
	^ self new canvas: cairoCanvas
]

{ #category : 'initializing' }
AthensCairoTransform >> canvas: aCairoCanvas [
	canvas := aCairoCanvas
]

{ #category : 'primitives' }
AthensCairoTransform >> loadIdentity [
	^ self ffiCall: #(
		void cairo_identity_matrix (AthensCairoCanvas canvas) )
]

{ #category : 'primitives' }
AthensCairoTransform >> loadIdentity2 [
	^ self ffiCall2: #(
		void cairo_identity_matrix (AthensCairoCanvas canvas) )
]

{ #category : 'transformations' }
AthensCairoTransform >> moveTo2: aPoint [
	self moveToX2: aPoint x asFloat Y: aPoint y asFloat
]

{ #category : 'transformations' }
AthensCairoTransform >> moveTo: aPoint [
	self moveToX: aPoint x asFloat Y: aPoint y asFloat
]

{ #category : 'primitives' }
AthensCairoTransform >> moveToX2: px Y: py [
	^ self ffiCall2: #(
		void cairo_move_to (AthensCairoCanvas canvas,
                                                         double px,
                                                         double py))
]

{ #category : 'primitives' }
AthensCairoTransform >> moveToX: px Y: py [
	^ self ffiCall: #(
		void cairo_move_to (AthensCairoCanvas canvas,
                                                         double px,
                                                         double py))
]

{ #category : 'primitives' }
AthensCairoTransform >> primRotateByRadians: angle [
	^ self ffiCall: #(
		void cairo_rotate (AthensCairoCanvas canvas,
                                                         double angle))
]

{ #category : 'primitives' }
AthensCairoTransform >> primScaleX2: fx Y: fy [
	^ self ffiCall2: #(
		void cairo_scale (AthensCairoCanvas canvas,
                                                         double fx,
                                                         double fy))
]

{ #category : 'primitives' }
AthensCairoTransform >> primScaleX: fx Y: fy [
	^ self ffiCall: #(
		void cairo_scale (AthensCairoCanvas canvas,
                                                         double fx,
                                                         double fy))
]

{ #category : 'primitives' }
AthensCairoTransform >> primTransformX: x Y: y [
	^ self ffiCall: #(
		void cairo_user_to_device (AthensCairoCanvas canvas,
                                                         NBFloatPtr x,
                                                         NBFloatPtr y) )
]

{ #category : 'primitives' }
AthensCairoTransform >> primTranslateX2: px Y: py [

	^ self ffiCall2: #(
		void cairo_translate (AthensCairoCanvas canvas,
                                                         double px,
                                                         double py))
]

{ #category : 'primitives' }
AthensCairoTransform >> primTranslateX: px Y: py [

	^ self ffiCall: #(
		void cairo_translate (AthensCairoCanvas canvas,
                                                         double px,
                                                         double py))
]

{ #category : 'primitives' }
AthensCairoTransform >> restore [
	^ self ffiCall: #(void cairo_restore(AthensCairoCanvas canvas))
]

{ #category : 'primitives' }
AthensCairoTransform >> restore2 [
	^ self ffiCall2: #(void cairo_restore(AthensCairoCanvas canvas))
]

{ #category : 'transformations' }
AthensCairoTransform >> restoreAfter2: aBlock [
	self save2.
	aBlock ensure:  [ self restore2 ]
]

{ #category : 'transformations' }
AthensCairoTransform >> restoreAfter: aBlock [
	self save.
	aBlock ensure:  [ self restore ]
]

{ #category : 'transformations' }
AthensCairoTransform >> rotateByDegrees: angle [

	^ self rotateByRadians: angle degreesToRadians
]

{ #category : 'primitives' }
AthensCairoTransform >> rotateByRadians: angle [

	^ self primRotateByRadians: angle asFloat
]

{ #category : 'primitives' }
AthensCairoTransform >> save [
	^ self ffiCall: #(void cairo_save (AthensCairoCanvas canvas))
]

{ #category : 'primitives' }
AthensCairoTransform >> save2 [
	^ self ffiCall2: #(void cairo_save (AthensCairoCanvas canvas))
]

{ #category : 'transformations' }
AthensCairoTransform >> scaleBy2: aScalarOrPoint [
	| double |
	aScalarOrPoint isPoint
		ifTrue:[
			self
				scaleX2: aScalarOrPoint x asFloat
				Y: aScalarOrPoint y asFloat ]
		ifFalse:[
			double := aScalarOrPoint asFloat.
			self scaleX2: double Y: double ]
]

{ #category : 'transformations' }
AthensCairoTransform >> scaleBy: aScalarOrPoint [
	| double |
	aScalarOrPoint isPoint
		ifTrue:[
			self
				scaleX: aScalarOrPoint x asFloat
				Y: aScalarOrPoint y asFloat ]
		ifFalse:[
			double := aScalarOrPoint asFloat.
			self scaleX: double Y: double ]
]

{ #category : 'transformation' }
AthensCairoTransform >> scaleX2: fx Y: fy [

	^ self primScaleX2: fx asFloat Y: fy asFloat
]

{ #category : 'transformation' }
AthensCairoTransform >> scaleX: fx Y: fy [

	^ self primScaleX: fx asFloat Y: fy asFloat
]

{ #category : 'vector - transform' }
AthensCairoTransform >> transform: aPoint [
	| x y |
	x := ByteArray new: 8.
	y := ByteArray new: 8.
	x doubleAt: 1 put: aPoint x.
	y doubleAt: 1 put: aPoint y.
	self primTransformX: x Y: y.
	^ (x doubleAt: 1) @ (y doubleAt: 1)
]

{ #category : 'transformations' }
AthensCairoTransform >> translateBy: aPoint [
	self translateX: aPoint x Y: aPoint y
]

{ #category : 'primitives' }
AthensCairoTransform >> translateX2: px Y: py [

	^ self primTranslateX2: px asFloat Y: py asFloat
]

{ #category : 'primitives' }
AthensCairoTransform >> translateX: px Y: py [

	^ self primTranslateX: px asFloat Y: py asFloat
]
