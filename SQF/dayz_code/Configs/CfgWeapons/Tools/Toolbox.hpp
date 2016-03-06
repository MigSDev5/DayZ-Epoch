class ItemToolbox : ItemCore
{
	scope = public;
	model = "\dayz_equip\models\toolbox.p3d";
	picture = "\dayz_equip\textures\equip_toolbox_ca.paa";
	displayName = $STR_EQUIP_NAME_2;
	descriptionShort = $STR_EQUIP_DESC_2;
	class ItemActions
	{
		class RemoveNet
		{
			text="Remove Camo Net";
			script="spawn player_removeNet;";
		};
		class RemoveTankTrap
		{
			text="Remove Tank Trap";
			script="spawn player_removeTankTrap;";
		};
	};

};