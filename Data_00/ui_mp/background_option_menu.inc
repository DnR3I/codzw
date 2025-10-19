#include "ui/menudef.h"
	focusColor 1 1 1 1
	itemDef
	{
		rect 0 0 1708 480
		style 3
		border 0
		ownerdraw 0
		ownerdrawFlag 0
		borderSize 0
		foreColor 1 1 1 0.5
		backColor 0 0 0 0
		borderColor 0 0 0 0
		outlineColor 0 0 0 0
		origin 0 0
		background mw2_main_cloud_overlay
		decoration 
		type 0
		align 0
		textAlign 0
		textAlignX 0
		textAlignY 0
		textScale 0.55
		textStyle 0
		textFont 0
		feeder 0
		exp rect x ( ( 0 - 107 ) - ( ( float( milliseconds( ) % 60000 ) / 60000 ) * ( 854 ) )  )
		visible 1
	}
	itemDef
	{
		rect 0 0 -1708 -480
		style 3
		border 0
		ownerdraw 0
		ownerdrawFlag 0
		borderSize 0
		foreColor 1 1 1 0.5
		backColor 0 0 0 0
		borderColor 0 0 0 0
		outlineColor 0 0 0 0
		origin 0 0
		background mw2_main_cloud_overlay
		decoration 
		type 0
		align 0
		textAlign 0
		textAlignX 0
		textAlignY 0
		textScale 0.55
		textStyle 0
		textFont 0
		feeder 0
		exp rect x ( ( - 107 + 854 ) + ( ( float( milliseconds( ) % 50000 ) / 50000 ) * ( 854 ) )  )
		visible 1
	}
	itemDef
	{
		rect	-425.667 -240 893.333 520 2 2
		decoration
		visible 0
		style	 3
		forecolor				1 1 1 1
		background		"mw2_main_background"
		textscale				0.55
		visible	1
	}
	itemDef
	{
		rect 0 0 640 480 4 4
		style 3
		border 0
		ownerdraw 0
		ownerdrawFlag 0
		borderSize 0
		foreColor 0 150 250 0
		backColor 0 0 0 0
		borderColor 0 0 0 0
		outlineColor 0 0 0 0
		origin 0 0
		background mockup_bg_glow
		decoration 
		type 0
		align 0
		textAlign 0
		textAlignX 0
		textAlignY 0
		textScale 0.55
		textStyle 0
		textFont 0
		feeder 0
		exp forecolor a ( ( ( sin ( milliseconds( ) / 1500 ) + 1 ) * 0.250000 ) + 0.250000  )
		visible 1
	}
	itemDef
	{
		rect 0 0 640 480 4 4
		style 3
		border 0
		ownerdraw 0
		ownerdrawFlag 0
		borderSize 0
		foreColor 0 150 250 0
		backColor 0 0 0 0
		borderColor 0 0 0 0
		outlineColor 0 0 0 0
		origin 0 0
		background mockup_bg_glow
		decoration 
		type 0
		align 0
		textAlign 0
		textAlignX 0
		textAlignY 0
		textScale 0.55
		textStyle 0
		textFont 0
		feeder 0
		text "(null)"
		visible 1
		exp forecolor a ( ( ( sin ( milliseconds( ) / 480 ) + 1 ) * 0.250000 ) + 0.250000  )
	}
	itemDef
	{
		rect 0 0 898 82 3 1
		style 1
		border 1
		ownerdraw 0
		ownerdrawFlag 0
		borderSize 0.8
		foreColor 1 1 1 1
		backColor 0 0 0 0.9
		borderColor 0.85 0.55 0 1
		outlineColor 0 0 0 0
		background black
		decoration 
		type 0
		align 0
		textAlign 4
		textAlignX 0
		textAlignY 0
		textScale 0.375
		textStyle 7
		textFont 6
		feeder 0
		visible 1
		visible when ( 1 && ( getplayercardinfo( 0 , 1 , 0 ) != 0 )  )
		exp rect x ( ( - 808 )  )
		exp rect y ( ( -65 )  )
	}		
	itemDef
	{
		rect 50 -35 95 20 1 1
		style 0
		border 0
		ownerdraw 0
		ownerdrawFlag 0
		borderSize 0
		foreColor 1 1 1 1
		backColor 0 0 0 0
		borderColor 0 0 0 0
		outlineColor 0 0 0 0
		decoration 
		type 0
		align 0
		textstyle 6
		textfont 4
		textalign 6
		textalignx -60
		textscale 0.5
		feeder 0
		text "MENU"
		visible 1
	}
	itemDef
	{
		name border_windows
		rect -80 52 800 390 0 0
		style 1
		border 1
		ownerdraw 0
		ownerdrawFlag 0
		borderSize 1
		foreColor 1 1 1 1
		backColor 0 0 0 0
		borderColor 0.85 0.55 0 1
		outlineColor 0 0 0 0.5
		decoration 
		autoWrapped 
		type 0
		align 0
		textAlign 0
		textScale 0.5
		textStyle 3
		textFont 9
		feeder 0
		visible 1
		text ""
	}
