if !(ExilePlayerInPvEzone) exitWith { false };
ExilePlayerInPvEzone = false;
if !(isNil "ExileClientPvEzoneUpdateThreadHandle") then 
{
	[ExileClientPvEzoneUpdateThreadHandle] call ExileClient_system_thread_removeTask;
	ExileClientPvEzoneUpdateThreadHandle = nil;
};
if (alive player) then 
{
	["InfoTitleAndText", ["PvP Zone!", "You have left the PvE zone. Anything goes!"]] call ExileClient_gui_toaster_addTemplateToast; 
};
true