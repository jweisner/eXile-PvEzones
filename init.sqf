/*
	Exile PvE Zones
	Pb_Magnet
	March, 2017
*/

if (!hasInterface || isServer) exitWith {
	Diag_log "Initializing PvE Zones!";
};

private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
}
forEach
[
    ["ExileClient_object_player_thread_PvEzone",       "Custom\PvEzones\ExileClient_object_player_thread_PvEzone.sqf"],
    ["ExileClient_object_player_event_onEnterPvEzone", "Custom\PvEzones\ExileClient_object_player_event_onEnterPvEzone.sqf"],
    ["ExileClient_object_player_event_onLeavePvEzone", "Custom\PvEzones\ExileClient_object_player_event_onLeavePvEzone.sqf"],
    ["ExileClient_object_player_PvEzone_checkPvEzone", "Custom\PvEzones\ExileClient_object_player_PvEzone_checkPvEzone.sqf"],
    ["ExileClient_util_world_isInPvEzone",             "Custom\PvEzones\ExileClient_util_world_isInPvEzone.sqf"]
];

waitUntil { uiSleep 0.5; !isNull(findDisplay 46); };
sleep 10;
systemChat "Loading: PvE Zones";

ExilePlayerInPvEzone = false;

ExilePvEzoneMarkerPositions = [];
ExilePvEzoneMarkerPositionsAndSize = [];
{
    switch (getMarkerType _x) do 
    {
            case "ExilePvEzone": 
        {
            ExilePvEzoneMarkerPositions pushBack (getMarkerPos _x);
            ExilePvEzoneMarkerPositionsAndSize pushBack 
            [
                getMarkerPos _x, 
                (getMarkerSize _x) select 0
            ];
        };
    };
} forEach allMapMarkers;

ExileClientPvEzoneUpdateThreadHandle = [1, ExileClient_object_player_thread_PvEzone, [], true] call ExileClient_system_thread_addtask;