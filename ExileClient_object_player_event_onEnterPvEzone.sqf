/**
 * ExileClient_object_player_event_onEnterPvEzone
 *
 * eXile-PvEzones
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *   2017 Pb_Magnet
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

if (ExilePlayerInPvEzone) exitWith { false };
if !(alive player) exitWith { false };
ExilePlayerInPvEzone = true;
//ExileClientPvEzoneESPEventHandler = addMissionEventHandler ["Draw3D", {20 call ExileClient_gui_safezone_safeESP}];
["InfoTitleAndText", ["PvE Zone!", "You have entered a PvE-only zone. Attacks on players will be punished."]] call ExileClient_gui_toaster_addTemplateToast;
ExileClientPvEzoneUpdateThreadHandle = [1, ExileClient_object_player_thread_PvEzone, [], true] call ExileClient_system_thread_addtask;
true