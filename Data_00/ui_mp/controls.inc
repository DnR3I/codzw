




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
		rect 20 10 440 15 2 2
		decoration
		style 1
		visible 1
		forecolor 0 1 1 1
		backcolor 0 0 0 0.6
	}
	itemDef
	{
		rect 20 10 78 15 2 2
		style 1
		group "mw2_button"
		type 1
		visible 1
		forecolor 1 1 1 0.65
		disablecolor 0.6 0.55 0.55 1
		background "menu_rules_selection_bar"
		textfont 9
		textalign 4
		textalignx 5
		textscale 0.3
		text "@MENU_LOOK"
		onFocus
		{
			play "mouse_over";
			setItemColor self backcolor 255 0 0 1;
		}
		action
		{
			play "mouse_click";
			open	"pc_options_look";
		}
		leaveFocus
		{
			setItemColor self backcolor 0 0 0 0.7;
		}
	}
	itemDef
	{
		rect 99 13 1 10 2 2 
		style 3 
		decoration
		visible 1
		forecolor 0.7 0.7 0.7 1
		background "gradient_fadein"
	}
	itemDef
	{
		rect 101 10 77 15 2 2
		style 1
		group "mw2_button"
		type 1
		visible 1
		forecolor 1 1 1 0.65
		disablecolor 0.6 0.55 0.55 1
		background "menu_rules_selection_bar"
		textfont 9
		textalign 4
		textalignx 5
		textscale 0.3
		text "@MENU_MOVEMENT"
		onFocus
		{
			play "mouse_over";
			setItemColor self backcolor 255 0 0 1;
		}
		action
		{
			play "mouse_click";
			open	"pc_options_movement";
		}
		leaveFocus
		{
			setItemColor self backcolor 0 0 0 0.7;
		}
	}
	itemDef
	{
		rect 179 13 1 10 2 2 
		style 3 
		decoration
		visible 1
		forecolor 0.7 0.7 0.7 1
		background "gradient_fadein"
	}
	itemDef
	{
		rect 181 10 77 15 2 2
		style 1
		group "mw2_button"
		type 1
		visible 1
		forecolor 1 1 1 0.65
		disablecolor 0.6 0.55 0.55 1
		background "menu_rules_selection_bar"
		textfont 9
		textalign 4
		textalignx 5
		textscale 0.3
		text "@MENU_ACTIONS"
		onFocus
		{
			play "mouse_over";
			setItemColor self backcolor 255 0 0 1;
		}
		action
		{
			play "mouse_click";
			open	"pc_options_actions";
		}
		leaveFocus
		{
			setItemColor self backcolor 0 0 0 0.7;
		}
	}
	itemDef
	{
		rect 259 13 1 10 2 2 
		style 3 
		decoration
		visible 1
		forecolor 0.7 0.7 0.7 1
		background "gradient_fadein"
	}
	itemDef
	{
		rect 261 10 77 15 2 2
		style 1
		group "mw2_button"
		type 1
		visible 1
		forecolor 1 1 1 0.65
		disablecolor 0.6 0.55 0.55 1
		background "menu_rules_selection_bar"
		textfont 9
		textalign 4
		textalignx 5
		textscale 0.3
		text "@MENU_CHAT"
		onFocus
		{
			play "mouse_over";
			setItemColor self backcolor 255 0 0 1;
		}
		action
		{
			play "mouse_click";
			open	"controls_multi";
		}
		leaveFocus
		{
			setItemColor self backcolor 0 0 0 0.7;
		}
	}
	itemDef
	{
		rect 339 13 1 10 2 2 
		style 3 
		decoration
		visible 1
		forecolor 0.7 0.7 0.7 1
		background "gradient_fadein"
	}
	itemDef
	{
		rect 341 10 77 15 2 2
		style 1
		group "mw2_button"
		type 1
		visible 1
		forecolor 1 1 1 0.65
		disablecolor 0.6 0.55 0.55 1
		background "menu_rules_selection_bar"
		textfont 9
		textalign 4
		textalignx 5
		textscale 0.3
		text "@MENU_GAMEPAD"
		onFocus
		{
			play "mouse_over";
			setItemColor self backcolor 255 0 0 1;
		}
		action
		{
			play "mouse_click";
			open	"pc_options_gamepad";
		}
		leaveFocus
		{
			setItemColor self backcolor 0 0 0 0.7;
		}
	}
	itemDef
	{
		rect 339 13 1 10 2 2 
		style 3 
		decoration
		visible 1
		forecolor 0.7 0.7 0.7 1
		background "gradient_fadein"
	}
	itemDef
	{
		name "keyBindStatus"
		rect 20 250 200 18 2 2
		decoration
		autowrapped
		style 1
		ownerdraw 250
		forecolor 1 1 1 1
		type 8
		textfont 9
		textscale 0.375
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
		visible when ( "@BUTTON_BACK" == "@BUTTON_BACK" )
		action
		{
			play "mouse_click";
			"escape" self;
		}
		onFocus
		{
			play "mouse_over";
			setItemColor self backcolor 0.98 0.5 0.02 1;
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
		visible when ( "@BUTTON_BACK" == "@PLATFORM_GAME_SUMMARY_CAPS" )
		action
		{
			play "mouse_click";
			open "popup_summary";
		}
		onFocus
		{
			play "mouse_over";

			setItemColor self backcolor 0.98 0.5 0.02 1;
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
		rect 180 70 195 25 2 3
		visible 1
		style 1
		forecolor 1 1 1 1
		backColor 1 1 1 0.3
		type 1
		textfont 9
		textalign 9
		textscale 0.375
		text "@BUTTON_RESET_COMMANDS"
		action
		{
			play "mouse_click";
			open "options_control_defaults";
		}
		onFocus
		{
			play "mouse_over";
			setItemColor self backcolor 1 1 1 0.8;
			setLocalVarString		ui_hint_text("@NULL_EMPTY");
			setLocalVarFloat		ui_popupYPos (getFocusedItemY());
		}
		leaveFocus
		{
			setItemColor self backcolor 1 1 1 0.3;
			setLocalVarString	ui_hint_text("@NULL_EMPTY");
		}
	}