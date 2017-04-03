if (!hasInterface && isServer) exitWith {true};

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

true