
	itemDef
	{
		rect -918 -480 1708 960 2 2
		style 1
		decoration
		forecolor 1 1 1 1
		backcolor 0 0 0 0.8
		background "white"
		visible 1
	}
	itemDef
	{
		rect 0 0 500 270 2 2
		style 1
		decoration
		visible 1
		forecolor 1 1 1 1
		backcolor 0.22 0.31 0.36 0.5
	}
	itemDef
	{
		name "windows"
		rect -30 -40 560 365 2 2
		style 1
		border 0
		ownerdraw 0
		ownerdrawFlag 0
		borderSize 1
		foreColor 1 1 1 1
		backColor 1 1 1 1
		background "black"
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
	}
	itemDef
	{
		name "windows"
		rect -30 -40 560 365 2 2
		style 1
		border 0
		ownerdraw 0
		ownerdrawFlag 0
		borderSize 1
		foreColor 1 1 1 1
		backColor 1 1 1 1
		background "cardicon_cod4"
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
	}
	itemDef
	{
		rect 0 -16 80 15 2 2
		visible 1
		forecolor 1 1 1 1
		backcolor 1 1 1 0.3	
		style 1
		type 1
		textfont 9
		textstyle 7
		textalign 4
		textalignx 5
		textscale 0.3
		text "@MENU_VIDEO"
		onFocus
		{
			play 	"mouse_over";
			setItemColor self backcolor 255 0 0 1;
		}
		action
		{
			play 	"mouse_click";
			open	"pc_options_video";
		}
		leaveFocus
		{
			setItemColor self backcolor 1 1 1 0.3;
		}
	}
	itemDef
	{
		rect 80 -16 80 15 2 2
		visible 1
		forecolor 1 1 1 1
		backcolor 1 1 1 0.3
		style 1
		type 1
		textfont 9
		textstyle 7
		textalign 4
		textalignx 5
		textscale 0.3
		text "@MENU_AUDIO"
		onFocus
		{
			play 	"mouse_over";
			setItemColor self backcolor 255 0 0 1;
		}
		action
		{
			play 	"mouse_click";
			open	"pc_options_audio";
		}
		leaveFocus
		{
			setItemColor self backcolor 1 1 1 0.3;
		}
	}
	itemDef
	{
		rect 160 -16 80 15 2 2
		visible 1
		forecolor 1 1 1 1
		backcolor 1 1 1 0.3
		style 1
		type 1
		textfont 9
		textstyle 7
		textalign 4
		textalignx 5
		textscale 0.3
		text "@MENU_CONTROLS"
		onFocus
		{
			play 	"mouse_over";
			setItemColor self backcolor 255 0 0 1;
		}
		action
		{
			play 	"mouse_click";
			open	"pc_options_look";
		}
		leaveFocus
		{
			setItemColor self backcolor 1 1 1 0.3;
		}
	}
	itemDef
	{
		rect 240 -16 120 15 2 2
		visible 1
		forecolor 1 1 1 1
		backcolor 1 1 1 0.3
		style 1
		type 1
		textfont 9
		textstyle 7
		textalign 4
		textalignx 5
		textscale 0.3
		text "@SF_UI_OPTION_TAB_OTHER"
		onFocus
		{
			play 	"mouse_over";
			setItemColor self backcolor 255 0 0 1;
		}
		action
		{
			play 	"mouse_click";
			open	"pc_options_game";
		}
		leaveFocus
		{
			setItemColor self backcolor 1 1 1 0.3;
		}
	}
	itemDef
	{
		rect 395 70 105 25 2 3
		visible 1
		style 1
		forecolor 1 1 1 1
		backColor 0.98 0.5 0.02 0.8
		type 1
		textfont 9
		textalign 9
		textscale 0.375
		text "@BUTTON_BACK"
		action
		{
			play "mouse_click";
			"escape" self;
			if ( !menuisopen( "pc_options_advanced_video" ) && !menuisopen( "pc_options_video" ) && !menuisopen( "pc_options_Audio" ) && !menuisopen( "pc_options_controls" ) && !menuisopen( "pc_options_voice" ) )
			{
				if ( localvarbool( "ui_showApply" ) || localvarbool( "ui_showAudioApply" ) )
				{
					open "all_restart_popmenu";
				}
			}
		}
		onFocus
		{
			play "mouse_over";
			if ( dvarstring( "gameMode" ) != "mp" )
			{
				setItemColor "mw2_button" backcolor 0.98 0.5 0.02 1;
			}
			setItemColor self backcolor 0 0 0 1;
			setLocalVarBool "ui_menuAButton" ( 1 );
		}
		leaveFocus
		{
			setItemColor self backcolor 0.98 0.5 0.02 0.8;
			setLocalVarString "ui_hint_text" ( "@NULL_EMPTY" );
			setLocalVarBool "ui_menuAButton" ( 0 );
		}
	}	
	itemDef
	{
		rect 110 -100 280 25 2 2
		decoration
		visible 1
		style 3
		forecolor 1 1 1 1
		background		"cardicon_radiation"
		textfont 9
		textalign 9
		textscale 0.3
		textalignx 10
		text "@SF_UI_NOTE_VIDEO_LOCKED"
		visible when ( ( ( dvarstring( "gameMode" ) == "so" && ( dvarbool( "cl_ingame" ) || dvarbool( "sv_running" ) || inlobby( ) ) ) || ( dvarstring( "gameMode" ) == "mp" && ( dvarbool( "cl_ingame" ) || dvarbool( "sv_running" ) || inlobby( ) ) ) ) )
	}		
	itemDef
	{
		rect 168 70 207 25 2 3
		visible 1
		style 1
		forecolor 1 1 1 1
		backColor 1 1 1 0.3
		type 1
		textfont 9
		textalign 9
		textscale 0.375
		text "@BUTTON_DEFAULT_GRAPHICS_AND_SOUNDS"
		disabled when ( ( ( dvarstring( "gameMode" ) == "so" && ( dvarbool( "cl_ingame" ) || dvarbool( "sv_running" ) || inlobby( ) ) ) || ( dvarstring( "gameMode" ) == "mp" && ( dvarbool( "cl_ingame" ) || dvarbool( "sv_running" ) || inlobby( ) ) ) ) )
		action
		{
			play "mouse_click";
			open "options_graphics_defaults";
		}
		onFocus
		{
			play "mouse_over";
			if ( dvarstring( "gameMode" ) != "mp" )
			{
				setItemColor "mw2_button" backcolor 1 1 1 0.8;
			}
			setItemColor self backcolor 0 0 0 1;
			setLocalVarBool "ui_menuAButton" ( 1 );
			setLocalVarFloat "ui_popupYPos" ( getfocuseditemy( ) );
		}
		leaveFocus
		{
			setItemColor self backcolor 1 1 1 0.3;
			setLocalVarString "ui_hint_text" ( "@NULL_EMPTY" );
			setLocalVarBool "ui_menuAButton" ( 0 );
		}
	}