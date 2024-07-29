"
i used to represent gradient paints (both radial and linear)  in cairo backend
"
Class {
	#name : 'AthensCairoGradientPaint',
	#superclass : 'AthensCairoPatternPaint',
	#pools : [
		'AthensCairoDefinitions'
	],
	#category : 'Athens-Cairo-Paints',
	#package : 'Athens-Cairo',
	#tag : 'Paints'
}

{ #category : 'paints' }
AthensCairoGradientPaint class >> createLinearGradient2: aColorRamp start: aStartPoint stop: aStopPoint [
	| paint |
	paint := self
		primCreateLinearX02: aStartPoint x asFloat
		y0: aStartPoint y asFloat
		x1: aStopPoint x asFloat
		y1: aStopPoint y asFloat.

	"note, we do #initialize here because instance was created by primitive"
	paint initialize; populateRamp2: aColorRamp.
	^ paint
]

{ #category : 'paints' }
AthensCairoGradientPaint class >> createLinearGradient: aColorRamp start: aStartPoint stop: aStopPoint [
	| paint |
	paint := self
		primCreateLinearX0: aStartPoint x asFloat
		y0: aStartPoint y asFloat
		x1: aStopPoint x asFloat
		y1: aStopPoint y asFloat.

	"note, we do #initialize here because instance was created by primitive"
	paint initialize; populateRamp: aColorRamp.
	^ paint
]

{ #category : 'primitives' }
AthensCairoGradientPaint class >> primCreateLinearX02: x0 y0: y0 x1: x1 y1: y1 [
	^ self ffiCall2: #(AthensCairoGradientPaint cairo_pattern_create_linear (
		double x0,
		double y0,
		double x1,
		double y1 ) )
]

{ #category : 'primitives' }
AthensCairoGradientPaint class >> primCreateLinearX0: x0 y0: y0 x1: x1 y1: y1 [
	^ self ffiCall: #(AthensCairoGradientPaint cairo_pattern_create_linear (
		double x0,
		double y0,
		double x1,
		double y1 ) )
]

{ #category : 'primitives' }
AthensCairoGradientPaint class >> primCreateRadialXo2: xo yo: yo radiuso: radiuso x1: x1 y1: y1 radius1: radius1 [
	^ self ffiCall2: #(AthensCairoGradientPaint cairo_pattern_create_radial (
		double xo,
		double yo,
		double radiuso,
		double x1,
		double y1,
		double radius1 ) )
]

{ #category : 'primitives' }
AthensCairoGradientPaint class >> primCreateRadialXo: xo yo: yo radiuso: radiuso x1: x1 y1: y1 radius1: radius1 [
	^ self ffiCall: #(AthensCairoGradientPaint cairo_pattern_create_radial (
		double xo,
		double yo,
		double radiuso,
		double x1,
		double y1,
		double radius1 ) )
]

{ #category : 'private' }
AthensCairoGradientPaint class >> radialBetween2: origin
	extending: innerRadius
	and: outerOrigin
	extending: outerRadius
	withColorRamp: colorRamp [
	| paint |

	paint := self
		primCreateRadialXo2: origin x
		yo: origin y
		radiuso: innerRadius
		x1: outerOrigin x
		y1: outerOrigin y
		radius1: outerRadius.
	paint
		initializeRadialBetween2: origin
			extending: innerRadius
			and: outerOrigin
			extending: outerRadius
			withColorRamp: colorRamp.
	^ paint
]

{ #category : 'private' }
AthensCairoGradientPaint class >> radialBetween: origin
	extending: innerRadius
	and: outerOrigin
	extending: outerRadius
	withColorRamp: colorRamp [
	| paint |

	paint := self
		primCreateRadialXo: origin x
		yo: origin y
		radiuso: innerRadius
		x1: outerOrigin x
		y1: outerOrigin y
		radius1: outerRadius.
	paint
		initializeRadialBetween: origin
			extending: innerRadius
			and: outerOrigin
			extending: outerRadius
			withColorRamp: colorRamp.
	^ paint
]

{ #category : 'private' }
AthensCairoGradientPaint >> addColorStopAt2: anOffset colored: aColor [

	self
		primAddColorStopOffset2: anOffset asFloat
		R: aColor red asFloat
		G: aColor green asFloat
		B: aColor blue asFloat
		A: aColor alpha asFloat
]

{ #category : 'private' }
AthensCairoGradientPaint >> addColorStopAt: anOffset colored: aColor [

	self
		primAddColorStopOffset: anOffset asFloat
		R: aColor red asFloat
		G: aColor green asFloat
		B: aColor blue asFloat
		A: aColor alpha asFloat
]

{ #category : 'initialization' }
AthensCairoGradientPaint >> defaultExtend [
"The default extend mode is CAIRO_EXTEND_NONE for surface patterns and CAIRO_EXTEND_PAD for gradient patterns.
"
	^  CAIRO_EXTEND_PAD
]

{ #category : 'initialization' }
AthensCairoGradientPaint >> initializeRadialBetween2: origin
			extending: innerRadius
			and: outerOrigin
			extending: outerRadius
			withColorRamp: aRamp [

	self initialize.
	aRamp do:[:each|
		self
			addColorStopAt2: each key
			colored: each value ]
]

{ #category : 'initialization' }
AthensCairoGradientPaint >> initializeRadialBetween: origin
			extending: innerRadius
			and: outerOrigin
			extending: outerRadius
			withColorRamp: aRamp [

	self initialize.
	aRamp do:[:each|
		self
			addColorStopAt: each key
			colored: each value ]
]

{ #category : 'private' }
AthensCairoGradientPaint >> populateRamp2: aRamp [
	aRamp do: [ :each |
		self
			addColorStopAt2: each key
			colored: each value ]
]

{ #category : 'private' }
AthensCairoGradientPaint >> populateRamp: aRamp [
	aRamp do: [ :each |
		self
			addColorStopAt: each key
			colored: each value ]
]

{ #category : 'primitives' }
AthensCairoGradientPaint >> primAddColorStopOffset2: offset R: red G: green B: blue A: alpha [
	^ self ffiCall2:#( void cairo_pattern_add_color_stop_rgba ( cairo_pattern_t  self,
					double offset,
					double red,
					double green,
					double blue,
					double alpha ))
]

{ #category : 'primitives' }
AthensCairoGradientPaint >> primAddColorStopOffset: offset R: red G: green B: blue A: alpha [
	^ self ffiCall:#( void cairo_pattern_add_color_stop_rgba ( cairo_pattern_t  self,
					double offset,
					double red,
					double green,
					double blue,
					double alpha ))
]
