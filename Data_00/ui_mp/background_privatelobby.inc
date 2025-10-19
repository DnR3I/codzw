/********************************************
*          dumped by: DvR3I PaFF            *
*********************************************/

#include "ui/menudef.h"
		itemDef
		{
			name "background_map"
			rect -425.667 -240 893.333 520 2 2
			style 3
			decoration
			forecolor 1 1 1 0.2
			textscale 0.55
			visible when(localvarstring( "ui_info_icon") != "")
			exp material ( localvarstring( "ui_info_icon" )  )
			visible		when (!dvarBool("cl_ingame") && !dvarBool("sv_running"))
	exp rect x ( -440 + ( sin ( milliseconds( ) / 1750 ) * 10) ) 
		}
		itemDef
		{
			rect	-425.667 -240 893.333 520 2 2
			decoration
			visible 1
			style	 3
			forecolor				1 1 1 0.85
			background		"mw2_main_background"
			textscale				0.55
			visible		when (!dvarBool("cl_ingame") && !dvarBool("sv_running"))
	exp rect x ( -440 + ( sin ( milliseconds( ) / 1750 ) * 10) ) 
		}
		itemDef
		{
			rect -426.667 -240 893.333 520 2 2
			decoration
			visible 1
			style 3
			forecolor 0 0 0 1
			background "black"
			textscale 0.55	
			exp forecolor a ( ( cos ( milliseconds( ) / 2500 ) * 3) - 2.5  )
		}
		itemDef
		{
			rect 0 0 1708 480
			style 3
			border 0
			ownerdraw 0
			ownerdrawFlag 0
			borderSize 0
			foreColor 255 0 0 0.5
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
			exp rect x ( ( 0 - 107 ) - ( ( float( milliseconds( ) % 40000 ) / 40000 ) * ( 854 ) )  )
			visible 1
		}