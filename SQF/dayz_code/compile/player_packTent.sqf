/*
	[_obj] call player_packTent;
*/

if (dayz_actionInProgress) exitWith {localize "str_player_actionslimit" call dayz_rollingMessages;};
dayz_actionInProgress = true;

private ["_alreadyPacking","_backpacks","_bag","_campItems","_dir","_holder","_magazines","_obj","_objectID","_objectUID","_ownerID","_packobj","_playerNear","_pos","_weapons","_finished","_posPlayer","_text","_typeOf"];

_obj = _this;
_typeOf = typeOf _obj;
_ownerID = _obj getVariable["CharacterID","0"];
_objectID = _obj getVariable["ObjectID","0"];
_objectUID = _obj getVariable["ObjectUID","0"];

if (DZE_permanentPlot) then {
	_ownerID = _obj getVariable["ownerPUID","0"];
};

_playerNear = {isPlayer _x} count (([_obj] call FNC_GetPos) nearEntities ["CAManBase", 12]) > 1;
if (_playerNear) exitWith {dayz_actionInProgress = false; localize "str_pickup_limit_5" call dayz_rollingMessages;};

_packobj = getText (configFile >> "CfgVehicles" >> _typeOf >> "pack");

player removeAction s_player_packtent;
s_player_packtent = -1;
player removeAction s_player_packtentinfected;
s_player_packtentinfected = -1;

_campItems = ["IC_DomeTent","IC_Tent"];

if (_ownerID in [dayz_characterID,dayz_playerUID] || {_typeOf in _campItems}) then {
	_alreadyPacking = _obj getVariable["packing",0];
	if (_alreadyPacking == 1) exitWith {localize "str_player_beingpacked" call dayz_rollingMessages;};

	_obj setVariable["packing",1,true];
	_dir = direction _obj;
	_pos = getPosATL _obj;

	[player,"tentpack",0,false,20] call dayz_zombieSpeak;
	[player,20,true,getPosATL player] call player_alertZombies;

	_text = getText (configFile >> "CfgVehicles" >> _typeOf >> "displayName");
	format[localize "str_epoch_player_121",_text] call dayz_rollingMessages;

	_finished = ["Medic",1] call fn_loopAction;
	if (isNull _obj) exitWith {};
	if (!_finished) exitWith {_obj setVariable["packing",0,true];};

	_posPlayer = getPosATL player;
	_pos set [2,_posPlayer select 2];

	if (_pos select 2 < 0) then {_pos set [2,0];};

	_bag = _packobj createVehicle [0,0,0];
	_bag setDir _dir;
	_bag setPosATL _pos;

	_holder = "WeaponHolder" createVehicle [0,0,0];
	_holder setPosATL _pos;

	_weapons = getWeaponCargo _obj;
	_magazines = getMagazineCargo _obj;
	_backpacks = getBackpackCargo _obj;

	PVDZ_obj_Destroy = [_objectID,_objectUID,player,_pos,dayz_authKey,false];
	publicVariableServer "PVDZ_obj_Destroy";
	deleteVehicle _obj;

	[_weapons,_magazines,_backpacks,_holder] call fn_addCargo;

	player reveal _holder;

	localize "str_success_tent_pack" call dayz_rollingMessages;
} else {
	localize "str_fail_tent_pack" call dayz_rollingMessages;
};

dayz_actionInProgress = false;
