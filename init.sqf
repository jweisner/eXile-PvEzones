/*
	Exile PvE Zones
	Pb_Magnet
	March, 2017
*/

if (!hasInterface || isServer) exitWith {
	Diag_log "Initializing PvE Zones!";
};

// Globals
ExilePvEzoneAreas = [];
ExilePlayerInPvEzone = false;

if (hasInterface) then {
    [] execVM "Custom\PvEzones\compiles.sqf";

    waitUntil { uiSleep 0.5; !isNull(findDisplay 46); };
    systemChat "Loading: PvE Zones";

    {
        switch (getMarkerType _x) do 
        {
                case "ExilePvEzone": 
            {
                ExilePvEzoneAreas pushBack (_x);
            };
        };
    } forEach allMapMarkers;

    //diag_log format ["DEBUG PvEzones: found %1 ExilePvEzone markers", (count ExilePvEzoneAreas)];

    ExileClientPvEzoneUpdateThreadHandle = [1, ExileClient_object_player_thread_PvEzone, [], true] call ExileClient_system_thread_addtask;
    [5, ExileClient_object_player_PvEzone_checkPvEzone, [], true] call ExileClient_system_thread_addtask;
};
