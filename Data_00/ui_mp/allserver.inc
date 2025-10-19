#define ITEM_MENU_TITLE_VIS(textArg, visArg) \
	itemDef \
	{ \
		rect														-50 -35 146 28 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_TOP \
		foreColor													CHOICE_TEXTCOLOR \
		textFont													9 \
		textScale													0.45 \
		decoration													\
		textAlign													ITEM_ALIGN_MIDDLE_LEFT \
		text														textArg \
		textAlignX													5 \
		visible														visArg \
	}

#define BUTTON_FOOTER(xPos, width, buttonName, textArg, actionArg) \
		BUTTON_FOOTER_VIS(xPos, width, buttonName, textArg, actionArg, 1)

#define BUTTON_FOOTER_VIS(xPos, width, buttonName, textArg, actionArg, visArg) \
		itemDef \
		{ \
			name													buttonName \
			rect													xPos -10 width 20 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_BOTTOM \
			foreColor												CHOICE_TEXTCOLOR \
			style													WINDOW_STYLE_FILLED \
			type													ITEM_TYPE_BUTTON \
			textAlign												ITEM_ALIGN_MIDDLE_CENTER \
			textScale												MENU_BUTTON_TEXTSIZE \
			textFont												9 \
			text													textArg \
			visible													visArg \
			onFocus \
			{ \
				play												CHOICE_FOCUS_SOUND; \
				setItemColor										self backColor 0 0 0 1; \
			} \
			leaveFocus \
			{ \
				setItemColor										self backColor 0 0 0 0; \
			} \
			action \
			{ \
				play												CHOICE_CLICK_SOUND; \
				actionArg											\
			} \
		}

itemDef
{
	name															"sourcefield"
	rect															150 -33 100 13 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_TOP
	style															WINDOW_STYLE_FILLED
	forecolor 														1 1 1 0.65
	backColor 														0 0 0 0.7
	background 														"menu_rules_selection_bar"
	textFont														UI_FONT_SMALL
	textAlignX														15
	textAlignY														11
	textScale														0.2
	ownerDraw														UI_NETSOURCE
	visible															1
	onFocus
	{
		play														CHOICE_FOCUS_SOUND;
		setItemColor 												self backcolor 255 0 0 1;
	}
	leaveFocus
	{
		setItemColor 												self backColor 0 0 0 0.7;
	}
	action
	{
		play														CHOICE_CLICK_SOUND;
	}
}

itemDef
{
	name															"gametype"
	rect															150 -15 100 13 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_TOP
	style															WINDOW_STYLE_FILLED
	forecolor 														1 1 1 0.65
	backColor 														0 0 0 0.7
	background 														"menu_rules_selection_bar"
	textFont														UI_FONT_SMALL
	textAlignX														15
	textAlignY														11
	textScale														0.2
	text															"@MENU_GAME_TYPE"
	ownerDraw														UI_JOINGAMETYPE
	visible															1
	onFocus
	{
		play														CHOICE_FOCUS_SOUND;
		setItemColor 												self backcolor 255 0 0 1;
	}
	leaveFocus
	{
		setItemColor 												self backColor 0 0 0 0.7;
	}
	action
	{
		play														CHOICE_CLICK_SOUND;
	}
}

itemDef
{
	name															"filterServers"
	rect															150 3 100 13 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_TOP
	style															WINDOW_STYLE_FILLED
	type															ITEM_TYPE_BUTTON
	forecolor 														1 1 1 0.65
	backColor 														0 0 0 0.7
	background 														"menu_rules_selection_bar"
	textFont														UI_FONT_SMALL
	textAlignX														15
	textAlignY														11
	textScale														0.2
	text															"@MENU_FILTER_SERVERS"
	visible															1
	onFocus
	{
		play														CHOICE_FOCUS_SOUND;
		setItemColor 												self backcolor 255 0 0 1;
	}
	leaveFocus
	{
		setItemColor 												self backColor 0 0 0 0.7;
	}
	action
	{
		play														CHOICE_CLICK_SOUND;
		open														"filter_popmenu";
	}
}

itemDef
{
	name															"refreshSource"
	rect															454 -33 100 13 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_TOP
	style															WINDOW_STYLE_FILLED
	type															ITEM_TYPE_BUTTON
	forecolor 														1 1 1 0.65
	backColor 														0 0 0 0.7
	background 														"menu_rules_selection_bar"
	textFont														UI_FONT_SMALL
	textAlignX														15
	textAlignY														11
	textScale														0.2
	text															"@PLATFORM_REFRESH_LIST"
	visible															1
	onFocus
	{
		play														CHOICE_FOCUS_SOUND;
		setItemColor 												self backcolor 255 0 0 1;
	}
	leaveFocus
	{
		setItemColor 												self backColor 0 0 0 0.7;
	}
	action
	{
		play														CHOICE_CLICK_SOUND;
		uiScript													"RefreshServers";
	}
}

itemDef
{
	name															"refreshFilter"
	rect															454 -15 100 13 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_TOP
	style															WINDOW_STYLE_FILLED
	type															ITEM_TYPE_BUTTON
	forecolor 														1 1 1 0.65
	backColor 														0 0 0 0.7
	background 														"menu_rules_selection_bar"
	textFont														UI_FONT_SMALL
	textAlignX														15
	textAlignY														11
	textScale														0.2
	text															"@MENU_QUICK_REFRESH"
	visible															1
	onFocus
	{
		play														CHOICE_FOCUS_SOUND;
		setItemColor 												self backcolor 255 0 0 1;
	}
	leaveFocus
	{
		setItemColor 												self backColor 0 0 0 0.7;
	}
	action
	{
		play														CHOICE_CLICK_SOUND;
		uiScript													"RefreshFilter";
	}
}

itemDef
{
	name															"createFavorite2"
	rect															454 3 100 13 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_TOP
	style															WINDOW_STYLE_FILLED
	type															ITEM_TYPE_BUTTON
	forecolor 														1 1 1 0.65
	backColor 														0 0 0 0.7
	background 														"menu_rules_selection_bar"
	textFont														UI_FONT_SMALL
	textAlignX														15
	textAlignY														11
	textScale														0.2
	text															"@MENU_NEW_FAVORITE"
	disabled														when(dvarInt(ui_netSource) != 2)
	visible															when(dvarInt("ui_netSource") != 1)
	onFocus
	{
		play														CHOICE_FOCUS_SOUND;
		setItemColor 												self backcolor 255 0 0 1;
	}
	leaveFocus
	{
		setItemColor 												self backColor 0 0 0 0.7;
	}
	action
	{
		play														CHOICE_CLICK_SOUND;
		open														"createfavorite_popmenu";
	}
}
itemDef
{
	name															"refreshDate"
	rect															-44 397 100 18 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_TOP
	foreColor														CHOICE_TEXTCOLOR
	textScale														0.25
	textFont														UI_FONT_SMALL
	textAlign														ITEM_ALIGN_MIDDLE_LEFT
	decoration
	visible															1
	exp																text("@MPUI_SERVERQUERIED")
}

#define PASSWORD_WIDTH												30
#define MATCHTYPE_WIDTH												20
#define AIMASSIST_WIDTH												20
#define VOICECHAT_WIDTH												20
#define SERVER_WIDTH												208
#define MAP_WIDTH													70
#define PLAYERS_WIDTH												50
#define TYPE_WIDTH													102
#define MOD_WIDTH													100
#define PING_WIDTH													40

#define TAB_LABEL_OFFSET	\
	textAlignX 2			\
	textAlignY TAB_HEIGHT

#define TAB_HEIGHT													16

#define TABLE_POS_X													0
#define TABLE_POS_Y													42

#define PASSWORD_POS_X												(TABLE_POS_X + 5)
#define MATCHTYPE_POS_X												(TABLE_POS_X + PASSWORD_WIDTH + 2)
#define AIMASSIST_POS_X												(MATCHTYPE_POS_X + MATCHTYPE_WIDTH + 2)
#define VOICECHAT_POS_X												(AIMASSIST_POS_X + AIMASSIST_WIDTH + 2)
#define SERVER_POS_X												(VOICECHAT_POS_X + VOICECHAT_WIDTH + 2)
#define MAP_POS_X													(SERVER_POS_X + SERVER_WIDTH + 2)
#define PLAYERS_POS_X												(MAP_POS_X + MAP_WIDTH + 2)
#define TYPE_POS_X													(PLAYERS_POS_X + PLAYERS_WIDTH + 2)
#define MOD_POS_X													(TYPE_POS_X + TYPE_WIDTH + 2)
#define PING_POS_X													(MOD_POS_X + MOD_WIDTH + 2)

#define TABLE_HEIGHT												338
#define TABLE_WIDTH													(PING_POS_X + PING_WIDTH + 20)

#define MAPIMAGE_WIDTH												91
#define MAPIMAGE_HEIGHT												60

#define MAPIMAGE_FRAME_SIZE											1

#define MAPIMAGE_POS_X												(MOD_POS_X + 4)
#define MAPIMAGE_POS_Y												(TABLE_POS_Y - (TAB_HEIGHT * 2))

#define MAPIMAGE_RECT												MAPIMAGE_POS_X MAPIMAGE_POS_Y MAPIMAGE_WIDTH MAPIMAGE_HEIGHT HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_SUBTOP
#define MAPIMAGE_FRAME_RECT											(MAPIMAGE_POS_X - MAPIMAGE_FRAME_SIZE) (MAPIMAGE_POS_Y - MAPIMAGE_FRAME_SIZE) (MAPIMAGE_WIDTH + (MAPIMAGE_FRAME_SIZE * 2)) (MAPIMAGE_HEIGHT + (MAPIMAGE_FRAME_SIZE * 2))

#define PASSWORD_ORIGIN												PASSWORD_POS_X			(TABLE_POS_Y + 2)
#define MATCHTYPE_ORIGIN											MATCHTYPE_POS_X			(TABLE_POS_Y + 2)
#define AIMASSIST_ORIGIN											AIMASSIST_POS_X			(TABLE_POS_Y + 2)
#define VOICECHAT_ORIGIN											VOICECHAT_POS_X			(TABLE_POS_Y + 2)
#define SERVER_ORIGIN												10						(TABLE_POS_Y + 2)
#define MAP_ORIGIN													MAP_POS_X				(TABLE_POS_Y + 2)
#define PLAYERS_ORIGIN												PLAYERS_POS_X			(TABLE_POS_Y + 2)
#define TYPE_ORIGIN													TYPE_POS_X				(TABLE_POS_Y + 2)
#define MOD_ORIGIN													MOD_POS_X				(TABLE_POS_Y + 2)
#define PING_ORIGIN													PING_POS_X				(TABLE_POS_Y + 2)

#define PASSWORD_RECT												PASSWORD_ORIGIN			PASSWORD_WIDTH		TABLE_HEIGHT		HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_TOP
#define MATCHTYPE_RECT												MATCHTYPE_ORIGIN		MATCHTYPE_WIDTH		TABLE_HEIGHT		HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_TOP
#define AIMASSIST_RECT												AIMASSIST_ORIGIN		AIMASSIST_WIDTH		TABLE_HEIGHT		HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_TOP
#define VOICECHAT_RECT												VOICECHAT_ORIGIN		VOICECHAT_WIDTH		TABLE_HEIGHT		HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_TOP
#define SERVER_RECT													SERVER_ORIGIN			SERVER_WIDTH		TABLE_HEIGHT		HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_TOP
#define MAP_RECT													MAP_ORIGIN				MAP_WIDTH			TABLE_HEIGHT		HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_TOP
#define PLAYERS_RECT												PLAYERS_ORIGIN			PLAYERS_WIDTH		TABLE_HEIGHT		HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_TOP
#define TYPE_RECT													TYPE_ORIGIN				TYPE_WIDTH			TABLE_HEIGHT		HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_TOP
#define MOD_RECT													MOD_ORIGIN				MOD_WIDTH			TABLE_HEIGHT		HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_TOP
#define PING_RECT													PING_ORIGIN				PING_WIDTH			TABLE_HEIGHT		HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_TOP

// Server list text
itemDef
{
	name															"serverlist"
	rect															TABLE_POS_X (TABLE_POS_Y + TAB_HEIGHT) (TABLE_WIDTH - 8) (TABLE_HEIGHT - 17) HORIZONTAL_ALIGN_SUBLEFT VERTICAL_ALIGN_TOP
	style															WINDOW_STYLE_FILLED
	foreColor														CHOICE_TEXTCOLOR
	outlineColor													0 0 0 0.6
	type															ITEM_TYPE_LISTBOX
	textFont														UI_FONT_NORMAL
	textScale														0.25
	visible															1
	feeder															FEEDER_SERVERS
	elementWidth													120
	elementHeight													16
//	numcols			xpos							xwidth					textlen			alignment
	columns 10		(PASSWORD_POS_X + - 150)			16						10				1
					(MATCHTYPE_POS_X - 500)			16						10				1
					(AIMASSIST_POS_X - 500)			16						10				1
					(VOICECHAT_POS_X - 500)			16						10				1
					(SERVER_POS_X + - 150)				SERVER_WIDTH			38				0
					(MAP_POS_X + - 160)					MAP_WIDTH				25				0
					(PLAYERS_POS_X + - 30)				PLAYERS_WIDTH			10				0
					(TYPE_POS_X + 100000)				TYPE_WIDTH				22				0
					(MOD_POS_X + 11)					MOD_WIDTH				20				0
					(PING_POS_X + 10)				PING_WIDTH				20				0
	doubleClick
	{
		open serverinfo_popmenu;
	}
}


// Server list tabs
#undef	TABLE_HEIGHT
#define TABLE_HEIGHT												TAB_HEIGHT