private["_position","_result"];
_position = _this;
_result = false;
{
	if (((_x select 0) distance2D _position) < (_x select 1)) exitWith
	{
		_result = true;
	};
}
forEach ExilePvEzoneMarkerPositionsAndSize;
_result