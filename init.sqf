/*
	Exile PvE Zones
	Pb_Magnet
	March, 2017
*/

if (isServer) exitWith {
	Diag_log "Initializing PvE Zones!";
};

if (hasInterface) then {
	waitUntil { uiSleep 0.5; !isNull(findDisplay 46); };
	sleep 10;
	systemChat "Loading: PvE Zones";

	ExilePvEzoneMarkerPositions = [];
	ExilePvEzoneMarkerPositionsAndSize = [];
	{
		switch (getMarkerType _x) do 
		{
				case "ExilePvEzone": 
			{
				ExileTraderZoneMarkerPositions pushBack (getMarkerPos _x);
				ExileTraderZoneMarkerPositionsAndSize pushBack 
				[
					getMarkerPos _x, 
					(getMarkerSize _x) select 0
				];
			};
		};
	} forEach allMapMarkers;

	ExileClientPvEzoneUpdateThreadHandle = [1, ExileClient_object_player_thread_PvEzone, [], true] call ExileClient_system_thread_addtask;
};