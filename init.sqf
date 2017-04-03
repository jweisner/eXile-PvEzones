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

if (hasInterface) then {
    [] execVM "Custom\PvEzones\compiles.sqf";

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