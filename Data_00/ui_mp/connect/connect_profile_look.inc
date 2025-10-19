/********************************************
*          dumped by: DvR3I PaFF            *
*********************************************/

#include "ui/menudef.h"
		itemDef
		{
			name						"playercard_foreground"
			rect						-100 -50 200 40 2 3
			decoration					
			visible						1
			style						1
			foreColor					1 1 1 1
			backColor					0 0 0 0.35
			background					"white"
			visible						1
		}
		itemDef
		{
			rect						-100 -50 200 40 2 3
			visible						1
			style						1
			decoration					
			type						1
			foreColor					1 1 1 1
			backColor					1 1 1 1
			textFont					4
			textStyle					8
			textAlignX 10
			textAlignY 18
			textScale					0.35
			exp							foreColor r (tablelookupbyrow("mp/cardTitleTable.csv", getplayercardinfo(1 ,1 ,0 ), 3))
			exp							foreColor g (tablelookupbyrow("mp/cardTitleTable.csv", getplayercardinfo(1 ,1 ,0 ), 4))
			exp							foreColor b (tablelookupbyrow("mp/cardTitleTable.csv", getplayercardinfo(1 ,1 ,0 ), 5))
			visible						1
			exp							material (tablelookupbyrow("mp/cardTitleTable.csv", getplayercardinfo(1, 1, 0), 2))
		}
		itemDef
		{			
			rect -100 -50 200 40 2 3 
			border 1
			bordersize 0.5
			decoration
			visible 1
			forecolor 1 1 1 1
			bordercolor 255 0 0 1
		}
		itemDef
		{
			rect						-45 -40 80 15 2 3 
			visible						1 
			decoration					
			type						1 
			foreColor					1 1 1 1
			textstyle 					7
			textScale					0.35 
			textaligny 					15
			visible						1
			exp						text (("[" + getplayercardinfo(9, 1, 0) + "]") + (getplayercardinfo(8, 1, 0))) 
		}
		
		itemDef
		{
			rect						-45 -40 40 40 3 1
			visible 1
			style 3
			decoration					
			forecolor 1 1 1 1
			textscale 0.55
			exp rect x ( ( - 612.6 ) + 160 )
			exp rect y ( ( 358 ) )
			visible when ( 1 && ( getplayercardinfo( 0 , 1 , 0 ) != 0 ) )
			exp material ( tablelookupbyrow( "mp/cardIconTable.csv" , getplayercardinfo( 2 , 1 , 0 ) , 1 ) )
		}
		itemDef
		{
			rect 62 -48 36 36 2 3 
			style 1
			decoration
			visible 1
			forecolor 1 1 1 1
			textstyle 7
			textscale 0.7
			textaligny 	35
			exp text ("" + tablelookup("mp/rankTable.csv", 0, getplayercardinfo(4, 1, 0), 14)) 
		}
		itemDef 
		{ 
			rect						-45 -25 60 15 2 3
			decoration							
			visible						1
			style						1
			textstyle 					7
			foreColor					1 1 1 0.9	
			textAlignY					10
			textScale					0.25
			exp							text ("@" + tablelookup("mp/ranktable.csv", 0, levelforexperience(getplayerdata("experience")), 5))
		}