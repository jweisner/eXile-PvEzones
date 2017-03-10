if !(ExilePlayerInPvEzone) then 
{
	if ((getPosATL (vehicle player)) call ExileClient_util_world_isInPvEzone) then 
	{
		[] call ExileClient_object_player_event_onEnterPvEzone; 
	};
	ExileClientPlayerLastPvEzoneCheckAt = diag_tickTime;
}
else 
{
	if (diag_tickTime - ExileClientPlayerLastPvEzoneCheckAt >= 30) then
	{
		if !((vehicle player) call ExileClient_util_world_isInPvEzone) then 
		{
			[] call ExileClient_object_player_event_onLeavePvEzone; 
		};
		ExileClientPlayerLastPvEzoneCheckAt = diag_tickTime;
	};
};