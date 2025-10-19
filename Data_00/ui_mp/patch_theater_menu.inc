/********************************************
*          dumped by: DvR3I PaFF            *
*********************************************/

#include "ui/menudef.h"
	itemDef
	{
		name						nameArg
		rect						(0 - MENU_BACKGROUND_PANEL_RIGHT_WIDTH) yPos MENU_BACKGROUND_PANEL_RIGHT_WIDTH 20 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_BOTTOM
		style						WINDOW_STYLE_FILLED
		forecolor 					1 1 1 0.65
		backColor 					0 0 0 0.7
		textFont					CHOICE_TEXTFONT
		textAlign					ITEM_ALIGN_TOP_RIGHT
		textAlignX					-30
		textScale					CHOICE_TEXTSIZE
		background					"menu_setting_selection_bar"
		group						"mw2_button"
		type						ITEM_TYPE_BUTTON
		text						textArg
		visible						visArg
		onFocus
		{
			play					CHOICE_FOCUS_SOUND;
			setItemColor 				self backcolor 255 0 0 1;
		}
		leaveFocus
		{
			setItemColor				self backColor 0 0 0 0.7;
		}
		action
		{
			play					CHOICE_CLICK_SOUND;
			actionArg
		}
	}
	#undef MENU_BACKGROUND_PANEL_RIGHT
	#define MENU_BACKGROUND_PANEL_RIGHT
	itemDef
	{
		rect						(0 - MENU_BACKGROUND_PANEL_RIGHT_WIDTH) 28 MENU_BACKGROUND_PANEL_RIGHT_WIDTH MENU_BACKGROUND_PANEL_RIGHT_HEIGHT HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
		style						WINDOW_STYLE_SHADER
		foreColor					0 0 0 0.7
		background					"black"
		decoration
		textScale					0.55
		visible						1
	}
	itemDef
	{
		name						"image"
		rect						(0 - (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 10)) 50 (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 20) 127 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
		style						WINDOW_STYLE_SHADER
		foreColor					1 1 1 1
		decoration
		textScale					0.55
		visible						when(dvarString("ui_demo_mapname") != "")
		exp						material ("preview_" + dvarString("ui_demo_mapname"))
	}
	itemDef
	{
		name						"image"
		rect						(0 - (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 10)) 50 (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 20) 127 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
		style						WINDOW_STYLE_SHADER
		foreColor					1 1 1 1
		decoration
		textScale					0.55
		visible						when(dvarString("ui_demo_mapname") == "")
		exp						material ("loadscreen_mp_bonusmaps")
	}
	itemDef
	{
		name						"mapname"
		rect						(0 - (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 10)) 28 (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 20) 22 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
		foreColor					CHOICE_TEXTCOLOR
		decoration
		textAlign					ITEM_ALIGN_TOP_LEFT
		textScale					CHOICE_TEXTSIZE
		textFont					9
		visible						1
		exp							text ( "@" + dvarstring( "ui_demo_mapname" ) )
	}
	itemDef
	{
		name						"gametype"
		rect						(0 - (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 10)) 180 (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 20) 20 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
		foreColor					1 1 1 1
		decoration
		autoWrapped
		textAlign					ITEM_ALIGN_TOP_LEFT
		textScale					CHOICE_TEXTSIZE
		textFont					UI_FONT_SMALL
		visible						1
		exp						text (dvarString("ui_demo_gametype"))
	}
	itemDef
	{
		name						"author_label"
		rect						(0 - (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 10)) 200 (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 20) 20 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
		foreColor					1 1 1 1
		decoration
		autoWrapped
		textAlign					ITEM_ALIGN_TOP_LEFT
		textScale					CHOICE_TEXTSIZE
		textFont					UI_FONT_SMALL
		text						"@MSS_AUTHOR"
		visible						1
	}
	itemDef
	{
		name						"author"
		rect						(0 - (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 10)) 200 (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 20) 20 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
		foreColor					1 1 1 1
		decoration
		autoWrapped
		textAlign					ITEM_ALIGN_TOP_RIGHT
		textScale					CHOICE_TEXTSIZE
		textFont					UI_FONT_SMALL
		visible						1
		exp						text (" " + dvarString("ui_demo_author"))
	}
	itemDef
	{
		name						"length_label"
		rect						(0 - (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 10)) 220 (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 20) 20 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
		foreColor					1 1 1 1
		decoration
		autoWrapped
		textAlign					ITEM_ALIGN_TOP_LEFT
		textScale					CHOICE_TEXTSIZE
		textFont					UI_FONT_SMALL
		text						"@MSS_LENGTH"
		visible						1
	}
	itemDef
	{
		name						"length"
		rect						(0 - (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 10)) 220 (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 20) 20 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
		foreColor					1 1 1 1
		decoration
		autoWrapped
		textAlign					ITEM_ALIGN_TOP_RIGHT
		textScale					CHOICE_TEXTSIZE
		textFont					UI_FONT_SMALL
		visible						1
		exp						text (" " + dvarString("ui_demo_length"))
	}
	itemDef
	{
		name						"date_label"
		rect						(0 - (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 10)) 240 (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 20) 20 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
		foreColor					1 1 1 1
		decoration
		autoWrapped
		textAlign					ITEM_ALIGN_TOP_LEFT
		textScale					CHOICE_TEXTSIZE
		textFont					UI_FONT_SMALL
		text						"@MSS_DATE"
		visible						1
	}
	itemDef
	{
		name						"date"
		rect						(0 - (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 10)) 240 (MENU_BACKGROUND_PANEL_RIGHT_WIDTH - 20) 20 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
		foreColor					1 1 1 1
		decoration
		autoWrapped
		textAlign					ITEM_ALIGN_TOP_RIGHT
		textScale					CHOICE_TEXTSIZE
		textFont					UI_FONT_SMALL
		visible						1
		exp						text (" " + dvarString("ui_demo_date"))
	}

	itemDef
	{
		name										"demoList"
		rect										0 28 260 356 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_TOP
		style										WINDOW_STYLE_FILLED
		foreColor									CHOICE_TEXTCOLOR
		backColor									0 0 0 0.5
		outLineColor								0 0 0 0.6
		type										ITEM_TYPE_LISTBOX
		textFont									UI_FONT_NORMAL
		textAlignX									6
		textScale									0.3
		visible										1
		feeder										FEEDER_DEMOS
		elementWidth								260
		elementHeight								16
//		numcols			xpos		xwidth		textlen		alignment
		columns 1		8			260			80			0
		doubleClick
		{
			uiScript								"launchDemo";
		}
		execKeyInt 13
		{
			uiScript								"launchDemo";
		}
	}
	itemDef
	{
		rect						200 -442 200 30 2 3 
		visible						1
		style						WINDOW_STYLE_FILLED
		type						ITEM_TYPE_BUTTON
		foreColor					CHOICE_TEXTCOLOR
		backColor					1 1 1 1
		textFont					UI_FONT_SMALL
		textStyle					8
		textAlign					ITEM_ALIGN_MIDDLE_CENTER
		textScale					CHOICE_TEXTSIZE
		exp							foreColor r (tablelookupbyrow("mp/cardTitleTable.csv", getplayercardinfo(1 ,1 ,0 ), 3))
		exp							foreColor g (tablelookupbyrow("mp/cardTitleTable.csv", getplayercardinfo(1 ,1 ,0 ), 4))
		exp							foreColor b (tablelookupbyrow("mp/cardTitleTable.csv", getplayercardinfo(1 ,1 ,0 ), 5))
		visible						when (getplayercardinfo(0, 1, 0) != 0)
		exp							material (tablelookupbyrow("mp/cardTitleTable.csv", getplayercardinfo(1, 1, 0), 2))
		onFocus
		{
			play					CHOICE_FOCUS_SOUND;
		}
		action
		{
			play				CHOICE_CLICK_SOUND;
			open				"menu_playercard_title_popup";
		}
	}
	itemDef
	{			
		rect 200 -442 200 30 2 3 
		border 1
		bordersize 0.5
		decoration
		visible 1
		forecolor 1 1 1 1
		bordercolor 255 0 0 1
	}
	itemDef
	{
		rect						250 -432 80 15 2 3 
		visible						1 
		type						ITEM_TYPE_BUTTON 
		foreColor					CHOICE_TEXTCOLOR 
		textstyle 					7
		textScale					0.35 
		textaligny 					15
		visible						when (getplayercardinfo(0, 1, 0) != 0)  
		exp							text (("[" + getplayercardinfo(9, 1, 0) + "]") + (getplayercardinfo(8, 1, 0))) 
		onFocus
		{
			play					CHOICE_FOCUS_SOUND;
		}
		action
		{
			play				CHOICE_CLICK_SOUND;
			open				"popup_playername";
		}
	}
	itemDef
	{
		rect						0 0 25 25 2 3
		visible						1
		style						WINDOW_STYLE_SHADER
		type						ITEM_TYPE_BUTTON
		exp							rect x ((203))
		exp							rect y ((PLAYERCARD_POS_Y - 439))
		visible						when (getplayercardinfo(0, 1, 0) != 0)
		exp							material (tablelookupbyrow("mp/cardIconTable.csv", getplayercardinfo(2, 1, 0), 1))
		onFocus
		{
			play					CHOICE_FOCUS_SOUND;
		}
		action
		{
			play				CHOICE_CLICK_SOUND;
			open				"menu_playercard_icon_popup";
		}
	}
	itemDef
	{
		rect 0 0 25 25 2 3
		style 3
		decoration
		visible 1
		forecolor 1 1 1 1
		textscale 0.55
		exp rect x ((340))
		exp rect y ((- 439))
		exp material ( tablelookup( "mp/rankIconTable.csv" , 0 , getplayercardinfo( 4 , 1 , 0 ) , ( getplayercardinfo( 5 , 1 , 0 ) + 1 ) )  )
		visible when ( 1 && ( getplayercardinfo( 0 , 1 , 0 ) != 0 ) && ( getplayercardinfo( 4 , 1 , 0 ) >= 0 )  )
	}
	itemDef
	{
		rect 370 -445 36 36 2 3 
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
		style						WINDOW_STYLE_FILLED
		textstyle 					7
		foreColor					1 1 1 0.9	
		textAlignY					10
		textScale					0.25
		exp							text ("@" + tablelookup("mp/ranktable.csv", 0, levelforexperience(getplayerdata("experience")), 5))

	}
	itemDef
	{
		rect						-22 -410 18 15 3 3
		foreColor					CHOICE_TEXTCOLOR
		style						WINDOW_STYLE_FILLED 
		backColor					1 1 1 1 
		background					"cardicon_noseart1" 
		type						ITEM_TYPE_BUTTON
		visible						1
		onFocus
		{
			play					CHOICE_FOCUS_SOUND;
			setItemColor			self backColor 0 0 0 1;
		}
		leaveFocus
		{
			setItemColor			self backColor 1 1 1 1;
		}
		action
		{
			play				CHOICE_CLICK_SOUND;
			open				"pc_options_video";
		}
	}
	itemDef
	{
		rect						-54 -410 18 15 3 3
		foreColor					CHOICE_TEXTCOLOR
		style						WINDOW_STYLE_FILLED 
		backColor					1 1 1 1 
		background					"cardicon_paratrooper" 
		type						ITEM_TYPE_BUTTON
		visible						1
		onFocus
		{
			play					CHOICE_FOCUS_SOUND;
			setItemColor			self backColor 0 0 0 1;
		}
		leaveFocus
		{
			setItemColor			self backColor 1 1 1 1;
		}
		action
		{
			play				CHOICE_CLICK_SOUND;
			open				"menu_online_barracks";

		}
	}	
	itemDef
	{
		rect						-76 -410 20 16 3 3
		foreColor					CHOICE_TEXTCOLOR
		style						WINDOW_STYLE_FILLED 
		backColor					1 1 1 1 
		background					"cardicon_patch" 
		type						ITEM_TYPE_BUTTON
		visible						1
		onFocus
		{
			play					CHOICE_FOCUS_SOUND;
			setItemColor			self backColor 0 0 0 1;
		}
		leaveFocus
		{
			setItemColor			self backColor 1 1 1 1;
		}
		action
		{
			play				CHOICE_CLICK_SOUND;
			open				"popup_friends";
		}
	}
	itemDef
	{
		rect						-98 -410 20 16 3 3
		foreColor					CHOICE_TEXTCOLOR
		style						WINDOW_STYLE_FILLED 
		backColor					1 1 1 1 
		background					"cardicon_pavelow" 
		type						ITEM_TYPE_BUTTON
		visible						1
		onFocus
		{
			play					CHOICE_FOCUS_SOUND;
			setItemColor			self backColor 0 0 0 1;
		}
		leaveFocus
		{
			setItemColor			self backColor 1 1 1 1;
		}
		action
		{
			play				CHOICE_CLICK_SOUND;
			open				"stats_unlock";
		} 
	}
	itemDef
	{
		rect						-120 -410 20 16 3 3
		foreColor					CHOICE_TEXTCOLOR
		style						WINDOW_STYLE_FILLED 
		backColor					1 1 1 1 
		background					"cardicon_pavelow" 
		type						ITEM_TYPE_BUTTON
		visible						1
		onFocus
		{
			play					CHOICE_FOCUS_SOUND;
			setItemColor			self backColor 0 0 0 1;
		}
		leaveFocus
		{
			setItemColor			self backColor 1 1 1 1;
		}
		action
		{
			play				CHOICE_CLICK_SOUND;
			open				"stats_reset";
		}
	}