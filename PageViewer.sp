#pragma semicolon 1
#include <sourcemod>

public Plugin:myinfo =
{
	name = "HTML Page Viewer",
	author = "ElitePowered",
	description = "Displays HTML pages within Source games.",
	version = "1.0",
	url = "http://ElitePowered.com"
};

public OnPluginStart()
{
	LoadTranslations("common.phrases");
	RegConsoleCmd("sm_example_command", Command_stats, "Example text to be displayed.");
	//Add more commands in this format
}

public Action:Command_stats(client, args)
{
	if (args != 0)
	{
		ReplyToCommand(client, "[SM] Usage: sm_example_command");
		return Plugin_Handled;
	}
	
	ShowMOTDPanelBIG(client, "Command Title", "http://ElitePowered.com/example.php", MOTDPANEL_TYPE_URL);
	//Replace the URL with the page you would like to display to the user.
	return Plugin_Handled;
}

stock ShowMOTDPanelBIG(client, const String:title[], const String:msg[], type=MOTDPANEL_TYPE_INDEX)
{
	decl String:num[3];
	new Handle:Kv = CreateKeyValues("data");
	IntToString(type, num, sizeof(num));
	KvSetString(Kv, "title", title);
	KvSetString(Kv, "type", num);
	KvSetString(Kv, "msg", msg);
	KvSetNum(Kv, "customsvr", 1);
	ShowVGUIPanel(client, "info", Kv);
	CloseHandle(Kv);
}
