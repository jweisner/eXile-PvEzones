//Diag_log "DEBUG: ExileClient_object_player_PvEzone_checkPvEzone";
if !(ExilePlayerInPvEzone) then 
{
	if ((getPosATL (vehicle player)) call ExileClient_util_world_isInPvEzone) then 
	{
		[] call ExileClient_object_player_event_onEnterPvEzone; 
	};
}
else 
{
	if !((vehicle player) call ExileClient_util_world_isInPvEzone) then 
	{
		[] call ExileClient_object_player_event_onLeavePvEzone; 
	};
};