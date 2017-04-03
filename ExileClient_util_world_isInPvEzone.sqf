
//diag_log format ["DEBUG isInPvEzone: ExilePvEzoneAreas=%1", count(ExilePvEzoneAreas)];
private["_position","_result"];
_position = _this;
_result = false;
{
    //Diag_log format ["DEBUG isInPvEzone: %1", _x];
	if (player inArea _x) exitWith
	{
		_result = true;
	};
}
forEach ExilePvEzoneAreas;
_result