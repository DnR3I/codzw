#define LOCAL_MAP_ACTION( mapname ) \
		setdvar ui_mapname mapname; \

#define LOCAL_MAP_FOCUS( name, desc, icon ) \
		setLocalVarString "ui_info_name" ( name ); \
		setLocalVarString "ui_info_desc" ( desc ); \
		setLocalVarString "ui_info_icon" ( icon );

#define LOCAL_MAP_NAME( name ) \
		"@" + name 

#define LOCAL_XDLC_FOCUS \
		setLocalVarString "ui_info_name" ( "PATCH_DLC_MAPS" ); \
		setLocalVarString "ui_info_desc" ( "PATCH_DLC_MAPS_DESC" ); \
		setLocalVarString "ui_info_icon" ( "loadscreen_mp_bonusmaps" );

#define LOCAL_MAP_SELECTION_RECT(i) 220 ( 30 + ( i * 20 ) ) 148 18 1 1

#define LOCAL_MAP_SELECTION(itemIndex, mapname, name, desc, icon, visArg) \
		itemDef \
		{ \
			rect LOCAL_MAP_SELECTION_RECT(itemIndex) \
			border 0 \
			forecolor 1 1 1 0.65 \
			backColor 0 0 0 0.7 \
			background "menu_rules_selection_bar" \
			style 1 \
			type 1 \
			textfont 9 \
			textstyle 7 \
			textAlignX 30 \
			textAlignY 18 \
			textscale 0.355 \
			exp text ( LOCAL_MAP_NAME( name ) ) \
			visible when (visArg) \
			onFocus \
			{ \
				play "mouse_over"; \
				setLocalVarBool ui_menuAButton 1; \
				setLocalVarFloat ui_popupYPos 0.000000; \
				setItemColor self backcolor 255 0 0 1; \
				LOCAL_MAP_FOCUS( name, desc, icon ) \
				LOCAL_MAP_ACTION( mapname ) \
			} \
			leaveFocus \
			{ \
				setItemColor self backColor 0 0 0 0.7; \
				setLocalVarBool ui_menuAButton 1; \
				setLocalVarString ui_hint_text "@NULL_EMPTY"; \
			} \
			action \
			{ \
				play "mouse_click"; \
				LOCAL_MAP_ACTION( mapname ) \
				open menu_xboxlive_privatelobby; \
				close self; \
			} \
		}