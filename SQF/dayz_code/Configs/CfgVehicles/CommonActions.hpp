#define ACTION_REPAIR displayName = $STR_ACTIONS_REPAIRVEH;\
	displayNameDefault = $STR_ACTIONS_REPAIRVEH;\
	priority = 0;\
	position = "";\
	showWindow = 0;\
	onlyForPlayer = 1;\
	shortcut = "";\
	condition = "(['Repair',this] call userActionConditions)";\
	statement = "this call player_repairVehicle;";\
	hideOnUse = 0
		
#define ACTION_SALVAGE displayName = $STR_ACTIONS_SALVAGEVEH;\
	displayNameDefault = $STR_ACTIONS_SALVAGEVEH;\
	priority = 0;\
	position = "";\
	showWindow = 0;\
	onlyForPlayer = 1;\
	shortcut = "";\
	condition = "(['Salvage',this] call userActionConditions)";\
	statement = "this call player_salvageVehicle;";\
	hideOnUse = 0
	
#define ACTION_PUSH displayName = $STR_ACTIONS_PUSH;\
	displayNameDefault = $STR_ACTIONS_PUSH;\
	priority = 0;\
	radius = 8;\
	position = "";\
	showWindow = 0;\
	onlyForPlayer = 1;\
	shortcut = "";\
	condition = "(['PushPlane',this] call userActionConditions)";\
	statement = "this call player_pushPlane;"
	
#define ACTION_REARM priority = 3;\
	radius = 3;\
	position = "camera";\
	showWindow = 0;\
	onlyForPlayer = 1;\
	shortcut = "reloadMagazine";\
	condition = "(['AddAmmo',this] call userActionConditions)";\
	hideOnUse = 1
