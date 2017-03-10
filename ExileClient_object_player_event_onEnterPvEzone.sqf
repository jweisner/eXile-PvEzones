if (ExilePlayerInPvEzone) exitWith { false };
if !(alive player) exitWith { false };
ExilePlayerInPvEzone = true;
["InfoTitleAndText", ["PvE Zone!", "You have entered a PvE-only zone. Attacks on players will be punished."]] call ExileClient_gui_toaster_addTemplateToast; 
ExileClientPvEzoneUpdateThreadHandle = [1, ExileClient_object_player_thread_PvEzone, [], true] call ExileClient_system_thread_addtask;
true