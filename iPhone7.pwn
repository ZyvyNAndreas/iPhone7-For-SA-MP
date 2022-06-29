/*******************************************************************************
*	Mapping InGame By Refki																  			            *
*	Version: 2.0																									  	          *
*																																 	         *
*	Credits:																											           	*
*	Script FS: Refki Andreas																					 		*
*	a_samp: SAMP Team																					              *
*	zcmd: ZeeX																									  	   	   *
*	sscanf2: maddinat0r																					 		  	*
*	dini: -																			                           		 				*
*	foreach: karimcambridge																					   	*
*																																    	     *
********************************************************************************/

#include <a_samp>
#include <zcmd>
#include <foreach>
#include <dini>
#include <sscanf2>

enum 
{
    DIALOG_FACEBOOK,
    DIALOG_NICKNAME_FB,
    DIALOG_POST_FB,
    DIALOG_MUSIC,
    DIALOG_MUSIK,
    DIALOG_MUSIK_URL,
    DIALOG_GPS
};

enum iPhoneByRefkiAndreas
{
    Nama_Facebook[128],
    Phone_Use,
    Open_Camera,
}

enum GPS
{
    NAMA_LOKASI[32],
    Float:POS_X,
    Float:POS_Y,
    Float:POS_Z
};
new const GpsByRefki[][GPS] =
{ 
	{"Balai Kota", 1159.6071,-2035.8964,69.0078}, 
	{"SAPD", 1555.4983,-1675.6654,16.1953},  
	{"ASGH", 1186.3344,-1324.5762,13.5593}
};
new IDGps[MAX_PLAYERS];
new Phone[MAX_PLAYERS][iPhoneByRefkiAndreas];
new Text:iPhoneByRefki[36];
new Radio[MAX_PLAYERS];
new Radio1[MAX_PLAYERS];
new Radio2[MAX_PLAYERS];
new Radio3[MAX_PLAYERS];
new Radio4[MAX_PLAYERS];
new Radio5[MAX_PLAYERS];
new Radio6[MAX_PLAYERS];
new Radio7[MAX_PLAYERS];
new Radio8[MAX_PLAYERS];
new Radio9[MAX_PLAYERS];
new Radio10[MAX_PLAYERS];
new Radio11[MAX_PLAYERS];
new Radio12[MAX_PLAYERS];
new Radio13[MAX_PLAYERS];
new Radio14[MAX_PLAYERS];

KirimPesan(playerid, color, const text[], {Float,_}:...)
{
	static args, str[192];
	if((args = numargs()) <= 3)
	{
	    SendClientMessage(playerid, color, text);
	}
	else
	{
		while(--args >= 3)
		{
			#emit LCTRL 	5
			#emit LOAD.alt 	args
			#emit SHL.C.alt 2
			#emit ADD.C 	12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S 	text
		#emit PUSH.C 	192
		#emit PUSH.C 	str
		#emit PUSH.S	8
		#emit SYSREQ.C 	format
		#emit LCTRL 	5
		#emit SCTRL 	4
		SendClientMessage(playerid, color, str);
		#emit RETN
	}
	return 1;
}

forward UpdateTime();
public UpdateTime()
{
	new string[256], hours, minutes;
	gettime(hours, minutes);
	format(string, sizeof string, "%02d:%02d", hours-6, minutes);
	TextDrawSetString(iPhoneByRefki[28], string);
}

stock GetName(playerid)
{
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof( name ));
    return name;
}

stock ShowiPhone(playerid)
{
	TextDrawShowForPlayer(playerid, iPhoneByRefki[0]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[1]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[2]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[3]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[4]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[5]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[6]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[7]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[8]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[9]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[10]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[11]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[12]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[13]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[14]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[15]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[16]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[17]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[18]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[19]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[20]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[21]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[22]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[23]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[24]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[25]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[26]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[27]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[28]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[29]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[30]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[31]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[32]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[33]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[34]);
	TextDrawShowForPlayer(playerid, iPhoneByRefki[35]);
	SelectTextDraw(playerid, 0xFF0000FF);
}

stock HideiPhone(playerid)
{
	TextDrawHideForPlayer(playerid, iPhoneByRefki[0]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[1]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[2]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[3]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[4]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[5]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[6]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[7]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[8]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[9]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[10]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[11]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[12]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[13]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[14]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[15]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[16]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[17]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[18]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[19]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[20]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[21]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[22]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[23]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[24]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[25]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[26]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[27]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[28]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[29]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[30]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[31]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[32]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[33]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[34]);
	TextDrawHideForPlayer(playerid, iPhoneByRefki[35]);
	CancelSelectTextDraw(playerid);
}

public OnFilterScriptInit()
{
	SetTimer("UpdateTime", 1000, true);
	iPhoneByRefki[0] = TextDrawCreate(475.000000, 175.000000, "id_beat:chit");
	TextDrawFont(iPhoneByRefki[0], 4);
	TextDrawLetterSize(iPhoneByRefki[0], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[0], 25.000000, 30.000000);
	TextDrawSetOutline(iPhoneByRefki[0], 1);
	TextDrawSetShadow(iPhoneByRefki[0], 0);
	TextDrawAlignment(iPhoneByRefki[0], 1);
	TextDrawColor(iPhoneByRefki[0], -1);
	TextDrawBackgroundColor(iPhoneByRefki[0], 255);
	TextDrawBoxColor(iPhoneByRefki[0], 50);
	TextDrawUseBox(iPhoneByRefki[0], 1);
	TextDrawSetProportional(iPhoneByRefki[0], 1);
	TextDrawSetSelectable(iPhoneByRefki[0], 0);

	iPhoneByRefki[1] = TextDrawCreate(565.000000, 175.000000, "id_beat:chit");
	TextDrawFont(iPhoneByRefki[1], 4);
	TextDrawLetterSize(iPhoneByRefki[1], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[1], 25.000000, 30.000000);
	TextDrawSetOutline(iPhoneByRefki[1], 1);
	TextDrawSetShadow(iPhoneByRefki[1], 0);
	TextDrawAlignment(iPhoneByRefki[1], 1);
	TextDrawColor(iPhoneByRefki[1], -1);
	TextDrawBackgroundColor(iPhoneByRefki[1], 255);
	TextDrawBoxColor(iPhoneByRefki[1], 50);
	TextDrawUseBox(iPhoneByRefki[1], 1);
	TextDrawSetProportional(iPhoneByRefki[1], 1);
	TextDrawSetSelectable(iPhoneByRefki[1], 0);

	iPhoneByRefki[2] = TextDrawCreate(475.000000, 420.000000, "id_beat:chit");
	TextDrawFont(iPhoneByRefki[2], 4);
	TextDrawLetterSize(iPhoneByRefki[2], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[2], 25.000000, 30.000000);
	TextDrawSetOutline(iPhoneByRefki[2], 1);
	TextDrawSetShadow(iPhoneByRefki[2], 0);
	TextDrawAlignment(iPhoneByRefki[2], 1);
	TextDrawColor(iPhoneByRefki[2], -1);
	TextDrawBackgroundColor(iPhoneByRefki[2], 255);
	TextDrawBoxColor(iPhoneByRefki[2], 50);
	TextDrawUseBox(iPhoneByRefki[2], 1);
	TextDrawSetProportional(iPhoneByRefki[2], 1);
	TextDrawSetSelectable(iPhoneByRefki[2], 0);

	iPhoneByRefki[3] = TextDrawCreate(565.000000, 420.000000, "id_beat:chit");
	TextDrawFont(iPhoneByRefki[3], 4);
	TextDrawLetterSize(iPhoneByRefki[3], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[3], 25.000000, 30.000000);
	TextDrawSetOutline(iPhoneByRefki[3], 1);
	TextDrawSetShadow(iPhoneByRefki[3], 0);
	TextDrawAlignment(iPhoneByRefki[3], 1);
	TextDrawColor(iPhoneByRefki[3], -1);
	TextDrawBackgroundColor(iPhoneByRefki[3], 255);
	TextDrawBoxColor(iPhoneByRefki[3], 50);
	TextDrawUseBox(iPhoneByRefki[3], 1);
	TextDrawSetProportional(iPhoneByRefki[3], 1);
	TextDrawSetSelectable(iPhoneByRefki[3], 0);

	iPhoneByRefki[4] = TextDrawCreate(479.000000, 190.000000, "id_dual:white");
	TextDrawFont(iPhoneByRefki[4], 4);
	TextDrawLetterSize(iPhoneByRefki[4], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[4], 107.000000, 245.250000);
	TextDrawSetOutline(iPhoneByRefki[4], 1);
	TextDrawSetShadow(iPhoneByRefki[4], 0);
	TextDrawAlignment(iPhoneByRefki[4], 1);
	TextDrawColor(iPhoneByRefki[4], -1);
	TextDrawBackgroundColor(iPhoneByRefki[4], 255);
	TextDrawBoxColor(iPhoneByRefki[4], 50);
	TextDrawUseBox(iPhoneByRefki[4], 1);
	TextDrawSetProportional(iPhoneByRefki[4], 1);
	TextDrawSetSelectable(iPhoneByRefki[4], 0);

	iPhoneByRefki[5] = TextDrawCreate(489.000000, 395.000000, "id_dual:white");
	TextDrawFont(iPhoneByRefki[5], 4);
	TextDrawLetterSize(iPhoneByRefki[5], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[5], 90.000000, 50.000000);
	TextDrawSetOutline(iPhoneByRefki[5], 1);
	TextDrawSetShadow(iPhoneByRefki[5], 0);
	TextDrawAlignment(iPhoneByRefki[5], 1);
	TextDrawColor(iPhoneByRefki[5], -1);
	TextDrawBackgroundColor(iPhoneByRefki[5], 255);
	TextDrawBoxColor(iPhoneByRefki[5], 50);
	TextDrawUseBox(iPhoneByRefki[5], 1);
	TextDrawSetProportional(iPhoneByRefki[5], 1);
	TextDrawSetSelectable(iPhoneByRefki[5], 0);

	iPhoneByRefki[6] = TextDrawCreate(489.000000, 180.300003, "id_dual:white");
	TextDrawFont(iPhoneByRefki[6], 4);
	TextDrawLetterSize(iPhoneByRefki[6], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[6], 90.000000, 50.000000);
	TextDrawSetOutline(iPhoneByRefki[6], 1);
	TextDrawSetShadow(iPhoneByRefki[6], 0);
	TextDrawAlignment(iPhoneByRefki[6], 1);
	TextDrawColor(iPhoneByRefki[6], -1);
	TextDrawBackgroundColor(iPhoneByRefki[6], 255);
	TextDrawBoxColor(iPhoneByRefki[6], 50);
	TextDrawUseBox(iPhoneByRefki[6], 1);
	TextDrawSetProportional(iPhoneByRefki[6], 1);
	TextDrawSetSelectable(iPhoneByRefki[6], 0);

	iPhoneByRefki[7] = TextDrawCreate(517.500000, 410.000000, "id_beat:chit");
	TextDrawFont(iPhoneByRefki[7], 4);
	TextDrawLetterSize(iPhoneByRefki[7], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[7], 30.000000, 35.000000);
	TextDrawSetOutline(iPhoneByRefki[7], 1);
	TextDrawSetShadow(iPhoneByRefki[7], 0);
	TextDrawAlignment(iPhoneByRefki[7], 1);
	TextDrawColor(iPhoneByRefki[7], 255);
	TextDrawBackgroundColor(iPhoneByRefki[7], 255);
	TextDrawBoxColor(iPhoneByRefki[7], 50);
	TextDrawUseBox(iPhoneByRefki[7], 1);
	TextDrawSetProportional(iPhoneByRefki[7], 1);
	TextDrawSetSelectable(iPhoneByRefki[7], 0);

	iPhoneByRefki[8] = TextDrawCreate(520.000000, 412.500000, "id_beat:chit");
	TextDrawFont(iPhoneByRefki[8], 4);
	TextDrawLetterSize(iPhoneByRefki[8], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[8], 25.000000, 30.000000);
	TextDrawSetOutline(iPhoneByRefki[8], 1);
	TextDrawSetShadow(iPhoneByRefki[8], 0);
	TextDrawAlignment(iPhoneByRefki[8], 1);
	TextDrawColor(iPhoneByRefki[8], -1);
	TextDrawBackgroundColor(iPhoneByRefki[8], 255);
	TextDrawBoxColor(iPhoneByRefki[8], 50);
	TextDrawUseBox(iPhoneByRefki[8], 1);
	TextDrawSetProportional(iPhoneByRefki[8], 1);
	TextDrawSetSelectable(iPhoneByRefki[8], 0);

	iPhoneByRefki[9] = TextDrawCreate(482.500000, 212.500000, "id_dual:white");
	TextDrawFont(iPhoneByRefki[9], 4);
	TextDrawLetterSize(iPhoneByRefki[9], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[9], 100.000000, 197.000000);
	TextDrawSetOutline(iPhoneByRefki[9], 1);
	TextDrawSetShadow(iPhoneByRefki[9], 0);
	TextDrawAlignment(iPhoneByRefki[9], 1);
	TextDrawColor(iPhoneByRefki[9], 255);
	TextDrawBackgroundColor(iPhoneByRefki[9], 255);
	TextDrawBoxColor(iPhoneByRefki[9], 50);
	TextDrawUseBox(iPhoneByRefki[9], 1);
	TextDrawSetProportional(iPhoneByRefki[9], 1);
	TextDrawSetSelectable(iPhoneByRefki[9], 0);

	iPhoneByRefki[10] = TextDrawCreate(483.799987, 213.800003, "hud:bum2"); //WALLPAPER
	TextDrawFont(iPhoneByRefki[10], 4);
	TextDrawLetterSize(iPhoneByRefki[10], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[10], 97.000000, 194.000000);
	TextDrawSetOutline(iPhoneByRefki[10], 1);
	TextDrawSetShadow(iPhoneByRefki[10], 0);
	TextDrawAlignment(iPhoneByRefki[10], 1);
	TextDrawColor(iPhoneByRefki[10], -1);
	TextDrawBackgroundColor(iPhoneByRefki[10], 255);
	TextDrawBoxColor(iPhoneByRefki[10], 50);
	TextDrawUseBox(iPhoneByRefki[10], 0);
	TextDrawSetProportional(iPhoneByRefki[10], 1);
	TextDrawSetSelectable(iPhoneByRefki[10], 0);

	iPhoneByRefki[11] = TextDrawCreate(510.000000, 195.000000, "id_beat:chit");
	TextDrawFont(iPhoneByRefki[11], 4);
	TextDrawLetterSize(iPhoneByRefki[11], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[11], 5.000000, 10.000000);
	TextDrawSetOutline(iPhoneByRefki[11], 1);
	TextDrawSetShadow(iPhoneByRefki[11], 0);
	TextDrawAlignment(iPhoneByRefki[11], 1);
	TextDrawColor(iPhoneByRefki[11], 255);
	TextDrawBackgroundColor(iPhoneByRefki[11], 255);
	TextDrawBoxColor(iPhoneByRefki[11], 50);
	TextDrawUseBox(iPhoneByRefki[11], 1);
	TextDrawSetProportional(iPhoneByRefki[11], 1);
	TextDrawSetSelectable(iPhoneByRefki[11], 0);

	iPhoneByRefki[12] = TextDrawCreate(531.500000, 187.500000, "id_beat:chit");
	TextDrawFont(iPhoneByRefki[12], 4);
	TextDrawLetterSize(iPhoneByRefki[12], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[12], 2.500000, 5.000000);
	TextDrawSetOutline(iPhoneByRefki[12], 1);
	TextDrawSetShadow(iPhoneByRefki[12], 0);
	TextDrawAlignment(iPhoneByRefki[12], 1);
	TextDrawColor(iPhoneByRefki[12], 255);
	TextDrawBackgroundColor(iPhoneByRefki[12], 255);
	TextDrawBoxColor(iPhoneByRefki[12], 50);
	TextDrawUseBox(iPhoneByRefki[12], 1);
	TextDrawSetProportional(iPhoneByRefki[12], 1);
	TextDrawSetSelectable(iPhoneByRefki[12], 0);

	iPhoneByRefki[13] = TextDrawCreate(514.000000, 190.000000, "-");
	TextDrawFont(iPhoneByRefki[13], 2);
	TextDrawLetterSize(iPhoneByRefki[13], 3.250000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[13], 400.000000, 17.000000);
	TextDrawSetOutline(iPhoneByRefki[13], 1);
	TextDrawSetShadow(iPhoneByRefki[13], 1);
	TextDrawAlignment(iPhoneByRefki[13], 1);
	TextDrawColor(iPhoneByRefki[13], 255);
	TextDrawBackgroundColor(iPhoneByRefki[13], 255);
	TextDrawBoxColor(iPhoneByRefki[13], 50);
	TextDrawUseBox(iPhoneByRefki[13], 0);
	TextDrawSetProportional(iPhoneByRefki[13], 1);
	TextDrawSetSelectable(iPhoneByRefki[13], 0);

	iPhoneByRefki[14] = TextDrawCreate(532.500000, 380.000000, "_");
	TextDrawFont(iPhoneByRefki[14], 1);
	TextDrawLetterSize(iPhoneByRefki[14], 0.600000, 2.750000);
	TextDrawTextSize(iPhoneByRefki[14], 298.500000, 92.500000);
	TextDrawSetOutline(iPhoneByRefki[14], 1);
	TextDrawSetShadow(iPhoneByRefki[14], 0);
	TextDrawAlignment(iPhoneByRefki[14], 2);
	TextDrawColor(iPhoneByRefki[14], -1);
	TextDrawBackgroundColor(iPhoneByRefki[14], 255);
	TextDrawBoxColor(iPhoneByRefki[14], -741092473);
	TextDrawUseBox(iPhoneByRefki[14], 1);
	TextDrawSetProportional(iPhoneByRefki[14], 1);
	TextDrawSetSelectable(iPhoneByRefki[14], 0);

	iPhoneByRefki[15] = TextDrawCreate(482.500000, 376.000000, "id_beat:chit"); //MAPS
	TextDrawFont(iPhoneByRefki[15], 4);
	TextDrawLetterSize(iPhoneByRefki[15], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[15], 30.000000, 35.000000);
	TextDrawSetOutline(iPhoneByRefki[15], 1);
	TextDrawSetShadow(iPhoneByRefki[15], 0);
	TextDrawAlignment(iPhoneByRefki[15], 1);
	TextDrawColor(iPhoneByRefki[15], -1);
	TextDrawBackgroundColor(iPhoneByRefki[15], 255);
	TextDrawBoxColor(iPhoneByRefki[15], 50);
	TextDrawUseBox(iPhoneByRefki[15], 1);
	TextDrawSetProportional(iPhoneByRefki[15], 1);
	TextDrawSetSelectable(iPhoneByRefki[15], 1);

	iPhoneByRefki[16] = TextDrawCreate(505.000000, 376.000000, "id_beat:chit"); //MUSIC
	TextDrawFont(iPhoneByRefki[16], 4);
	TextDrawLetterSize(iPhoneByRefki[16], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[16], 30.000000, 35.000000);
	TextDrawSetOutline(iPhoneByRefki[16], 1);
	TextDrawSetShadow(iPhoneByRefki[16], 0);
	TextDrawAlignment(iPhoneByRefki[16], 1);
	TextDrawColor(iPhoneByRefki[16], -1);
	TextDrawBackgroundColor(iPhoneByRefki[16], 255);
	TextDrawBoxColor(iPhoneByRefki[16], 50);
	TextDrawUseBox(iPhoneByRefki[16], 1);
	TextDrawSetProportional(iPhoneByRefki[16], 1);
	TextDrawSetSelectable(iPhoneByRefki[16], 1);

	iPhoneByRefki[17] = TextDrawCreate(527.500000, 376.000000, "id_beat:chit"); //FACEBOOK
	TextDrawFont(iPhoneByRefki[17], 4);
	TextDrawLetterSize(iPhoneByRefki[17], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[17], 30.000000, 35.000000);
	TextDrawSetOutline(iPhoneByRefki[17], 1);
	TextDrawSetShadow(iPhoneByRefki[17], 0);
	TextDrawAlignment(iPhoneByRefki[17], 1);
	TextDrawColor(iPhoneByRefki[17], -1);
	TextDrawBackgroundColor(iPhoneByRefki[17], 255);
	TextDrawBoxColor(iPhoneByRefki[17], 50);
	TextDrawUseBox(iPhoneByRefki[17], 1);
	TextDrawSetProportional(iPhoneByRefki[17], 1);
	TextDrawSetSelectable(iPhoneByRefki[17], 1);

	iPhoneByRefki[18] = TextDrawCreate(550.000000, 376.000000, "id_beat:chit"); //KAMERA
	TextDrawFont(iPhoneByRefki[18], 4);
	TextDrawLetterSize(iPhoneByRefki[18], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[18], 30.000000, 35.000000);
	TextDrawSetOutline(iPhoneByRefki[18], 1);
	TextDrawSetShadow(iPhoneByRefki[18], 0);
	TextDrawAlignment(iPhoneByRefki[18], 1);
	TextDrawColor(iPhoneByRefki[18], -1);
	TextDrawBackgroundColor(iPhoneByRefki[18], 255);
	TextDrawBoxColor(iPhoneByRefki[18], 50);
	TextDrawUseBox(iPhoneByRefki[18], 1);
	TextDrawSetProportional(iPhoneByRefki[18], 1);
	TextDrawSetSelectable(iPhoneByRefki[18], 1);

	iPhoneByRefki[19] = TextDrawCreate(491.250000, 385.000000, "hud:map");
	TextDrawFont(iPhoneByRefki[19], 4);
	TextDrawLetterSize(iPhoneByRefki[19], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[19], 12.500000, 15.000000);
	TextDrawSetOutline(iPhoneByRefki[19], 1);
	TextDrawSetShadow(iPhoneByRefki[19], 0);
	TextDrawAlignment(iPhoneByRefki[19], 1);
	TextDrawColor(iPhoneByRefki[19], -1);
	TextDrawBackgroundColor(iPhoneByRefki[19], 255);
	TextDrawBoxColor(iPhoneByRefki[19], 50);
	TextDrawUseBox(iPhoneByRefki[19], 1);
	TextDrawSetProportional(iPhoneByRefki[19], 1);
	TextDrawSetSelectable(iPhoneByRefki[19], 1);

	iPhoneByRefki[20] = TextDrawCreate(513.500000, 386.000000, "hud:radar_dateDisco");
	TextDrawFont(iPhoneByRefki[20], 4);
	TextDrawLetterSize(iPhoneByRefki[20], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[20], 12.500000, 15.000000);
	TextDrawSetOutline(iPhoneByRefki[20], 1);
	TextDrawSetShadow(iPhoneByRefki[20], 0);
	TextDrawAlignment(iPhoneByRefki[20], 1);
	TextDrawColor(iPhoneByRefki[20], -1);
	TextDrawBackgroundColor(iPhoneByRefki[20], 255);
	TextDrawBoxColor(iPhoneByRefki[20], 50);
	TextDrawUseBox(iPhoneByRefki[20], 1);
	TextDrawSetProportional(iPhoneByRefki[20], 1);
	TextDrawSetSelectable(iPhoneByRefki[20], 1);

	iPhoneByRefki[21] = TextDrawCreate(541.500000, 385.000000, "f");
	TextDrawFont(iPhoneByRefki[21], 1);
	TextDrawLetterSize(iPhoneByRefki[21], 0.600000, 2.500000);
	TextDrawTextSize(iPhoneByRefki[21], 400.000000, 17.000000);
	TextDrawSetOutline(iPhoneByRefki[21], 0);
	TextDrawSetShadow(iPhoneByRefki[21], 0);
	TextDrawAlignment(iPhoneByRefki[21], 1);
	TextDrawColor(iPhoneByRefki[21], 65535);
	TextDrawBackgroundColor(iPhoneByRefki[21], 255);
	TextDrawBoxColor(iPhoneByRefki[21], 50);
	TextDrawUseBox(iPhoneByRefki[21], 0);
	TextDrawSetProportional(iPhoneByRefki[21], 1);
	TextDrawSetSelectable(iPhoneByRefki[21], 0);

	iPhoneByRefki[22] = TextDrawCreate(556.500000, 382.000000, "id_beat:chit");
	TextDrawFont(iPhoneByRefki[22], 4);
	TextDrawLetterSize(iPhoneByRefki[22], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[22], 17.500000, 22.500000);
	TextDrawSetOutline(iPhoneByRefki[22], 1);
	TextDrawSetShadow(iPhoneByRefki[22], 0);
	TextDrawAlignment(iPhoneByRefki[22], 1);
	TextDrawColor(iPhoneByRefki[22], 255);
	TextDrawBackgroundColor(iPhoneByRefki[22], 255);
	TextDrawBoxColor(iPhoneByRefki[22], 50);
	TextDrawUseBox(iPhoneByRefki[22], 1);
	TextDrawSetProportional(iPhoneByRefki[22], 1);
	TextDrawSetSelectable(iPhoneByRefki[22], 0);

	iPhoneByRefki[23] = TextDrawCreate(562.500000, 389.000000, "id_beat:chit");
	TextDrawFont(iPhoneByRefki[23], 4);
	TextDrawLetterSize(iPhoneByRefki[23], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[23], 5.000000, 7.500000);
	TextDrawSetOutline(iPhoneByRefki[23], 1);
	TextDrawSetShadow(iPhoneByRefki[23], 0);
	TextDrawAlignment(iPhoneByRefki[23], 1);
	TextDrawColor(iPhoneByRefki[23], 16777215);
	TextDrawBackgroundColor(iPhoneByRefki[23], 255);
	TextDrawBoxColor(iPhoneByRefki[23], 50);
	TextDrawUseBox(iPhoneByRefki[23], 1);
	TextDrawSetProportional(iPhoneByRefki[23], 1);
	TextDrawSetSelectable(iPhoneByRefki[23], 0);

	iPhoneByRefki[24] = TextDrawCreate(476.799987, 160.000000, "-");
	TextDrawFont(iPhoneByRefki[24], 1);
	TextDrawLetterSize(iPhoneByRefki[24], 0.200000, 15.000000);
	TextDrawTextSize(iPhoneByRefki[24], 400.000000, 17.000000);
	TextDrawSetOutline(iPhoneByRefki[24], 0);
	TextDrawSetShadow(iPhoneByRefki[24], 0);
	TextDrawAlignment(iPhoneByRefki[24], 1);
	TextDrawColor(iPhoneByRefki[24], -1);
	TextDrawBackgroundColor(iPhoneByRefki[24], 255);
	TextDrawBoxColor(iPhoneByRefki[24], 50);
	TextDrawUseBox(iPhoneByRefki[24], 0);
	TextDrawSetProportional(iPhoneByRefki[24], 1);
	TextDrawSetSelectable(iPhoneByRefki[24], 0);

	iPhoneByRefki[25] = TextDrawCreate(476.799987, 178.500000, "-");
	TextDrawFont(iPhoneByRefki[25], 1);
	TextDrawLetterSize(iPhoneByRefki[25], 0.200000, 15.000000);
	TextDrawTextSize(iPhoneByRefki[25], 400.000000, 17.000000);
	TextDrawSetOutline(iPhoneByRefki[25], 0);
	TextDrawSetShadow(iPhoneByRefki[25], 0);
	TextDrawAlignment(iPhoneByRefki[25], 1);
	TextDrawColor(iPhoneByRefki[25], -1);
	TextDrawBackgroundColor(iPhoneByRefki[25], 255);
	TextDrawBoxColor(iPhoneByRefki[25], 50);
	TextDrawUseBox(iPhoneByRefki[25], 0);
	TextDrawSetProportional(iPhoneByRefki[25], 1);
	TextDrawSetSelectable(iPhoneByRefki[25], 0);

	iPhoneByRefki[26] = TextDrawCreate(585.500000, 140.000000, "-");
	TextDrawFont(iPhoneByRefki[26], 1);
	TextDrawLetterSize(iPhoneByRefki[26], 0.200000, 20.000000);
	TextDrawTextSize(iPhoneByRefki[26], 400.000000, 17.000000);
	TextDrawSetOutline(iPhoneByRefki[26], 0);
	TextDrawSetShadow(iPhoneByRefki[26], 0);
	TextDrawAlignment(iPhoneByRefki[26], 1);
	TextDrawColor(iPhoneByRefki[26], -1);
	TextDrawBackgroundColor(iPhoneByRefki[26], 255);
	TextDrawBoxColor(iPhoneByRefki[26], 50);
	TextDrawUseBox(iPhoneByRefki[26], 0);
	TextDrawSetProportional(iPhoneByRefki[26], 1);
	TextDrawSetSelectable(iPhoneByRefki[26], 0);

	iPhoneByRefki[27] = TextDrawCreate(482.500000, 212.500000, "id_dual:white");
	TextDrawFont(iPhoneByRefki[27], 4);
	TextDrawLetterSize(iPhoneByRefki[27], 0.600000, 2.000000);
	TextDrawTextSize(iPhoneByRefki[27], 100.000000, 10.500000);
	TextDrawSetOutline(iPhoneByRefki[27], 1);
	TextDrawSetShadow(iPhoneByRefki[27], 0);
	TextDrawAlignment(iPhoneByRefki[27], 1);
	TextDrawColor(iPhoneByRefki[27], 255);
	TextDrawBackgroundColor(iPhoneByRefki[27], 255);
	TextDrawBoxColor(iPhoneByRefki[27], 50);
	TextDrawUseBox(iPhoneByRefki[27], 1);
	TextDrawSetProportional(iPhoneByRefki[27], 1);
	TextDrawSetSelectable(iPhoneByRefki[27], 0);

	iPhoneByRefki[28] = TextDrawCreate(525.000000, 212.750000, "00:00");
	TextDrawFont(iPhoneByRefki[28], 1);
	TextDrawLetterSize(iPhoneByRefki[28], 0.200000, 1.000000);
	TextDrawTextSize(iPhoneByRefki[28], 400.000000, 17.000000);
	TextDrawSetOutline(iPhoneByRefki[28], 1);
	TextDrawSetShadow(iPhoneByRefki[28], 0);
	TextDrawAlignment(iPhoneByRefki[28], 1);
	TextDrawColor(iPhoneByRefki[28], -1);
	TextDrawBackgroundColor(iPhoneByRefki[28], 255);
	TextDrawBoxColor(iPhoneByRefki[28], 50);
	TextDrawUseBox(iPhoneByRefki[28], 0);
	TextDrawSetProportional(iPhoneByRefki[28], 1);
	TextDrawSetSelectable(iPhoneByRefki[28], 0);

	iPhoneByRefki[29] = TextDrawCreate(489.000000, 212.750000, "l");
	TextDrawFont(iPhoneByRefki[29], 1);
	TextDrawLetterSize(iPhoneByRefki[29], 0.200000, 1.000000);
	TextDrawTextSize(iPhoneByRefki[29], 400.000000, 17.000000);
	TextDrawSetOutline(iPhoneByRefki[29], 0);
	TextDrawSetShadow(iPhoneByRefki[29], 0);
	TextDrawAlignment(iPhoneByRefki[29], 1);
	TextDrawColor(iPhoneByRefki[29], -1);
	TextDrawBackgroundColor(iPhoneByRefki[29], 255);
	TextDrawBoxColor(iPhoneByRefki[29], 50);
	TextDrawUseBox(iPhoneByRefki[29], 0);
	TextDrawSetProportional(iPhoneByRefki[29], 1);
	TextDrawSetSelectable(iPhoneByRefki[29], 0);

	iPhoneByRefki[30] = TextDrawCreate(487.000000, 215.500000, "l");
	TextDrawFont(iPhoneByRefki[30], 1);
	TextDrawLetterSize(iPhoneByRefki[30], 0.200000, 0.600000);
	TextDrawTextSize(iPhoneByRefki[30], 400.000000, 17.000000);
	TextDrawSetOutline(iPhoneByRefki[30], 0);
	TextDrawSetShadow(iPhoneByRefki[30], 0);
	TextDrawAlignment(iPhoneByRefki[30], 1);
	TextDrawColor(iPhoneByRefki[30], -1);
	TextDrawBackgroundColor(iPhoneByRefki[30], 255);
	TextDrawBoxColor(iPhoneByRefki[30], 50);
	TextDrawUseBox(iPhoneByRefki[30], 0);
	TextDrawSetProportional(iPhoneByRefki[30], 1);
	TextDrawSetSelectable(iPhoneByRefki[30], 0);

	iPhoneByRefki[31] = TextDrawCreate(485.000000, 218.000000, "l");
	TextDrawFont(iPhoneByRefki[31], 1);
	TextDrawLetterSize(iPhoneByRefki[31], 0.200000, 0.300000);
	TextDrawTextSize(iPhoneByRefki[31], 400.000000, 17.000000);
	TextDrawSetOutline(iPhoneByRefki[31], 0);
	TextDrawSetShadow(iPhoneByRefki[31], 0);
	TextDrawAlignment(iPhoneByRefki[31], 1);
	TextDrawColor(iPhoneByRefki[31], -1);
	TextDrawBackgroundColor(iPhoneByRefki[31], 255);
	TextDrawBoxColor(iPhoneByRefki[31], 50);
	TextDrawUseBox(iPhoneByRefki[31], 0);
	TextDrawSetProportional(iPhoneByRefki[31], 1);
	TextDrawSetSelectable(iPhoneByRefki[31], 0);

	iPhoneByRefki[32] = TextDrawCreate(491.000000, 211.000000, "l");
	TextDrawFont(iPhoneByRefki[32], 1);
	TextDrawLetterSize(iPhoneByRefki[32], 0.200000, 1.200000);
	TextDrawTextSize(iPhoneByRefki[32], 400.000000, 17.000000);
	TextDrawSetOutline(iPhoneByRefki[32], 0);
	TextDrawSetShadow(iPhoneByRefki[32], 0);
	TextDrawAlignment(iPhoneByRefki[32], 1);
	TextDrawColor(iPhoneByRefki[32], -1);
	TextDrawBackgroundColor(iPhoneByRefki[32], 255);
	TextDrawBoxColor(iPhoneByRefki[32], 50);
	TextDrawUseBox(iPhoneByRefki[32], 0);
	TextDrawSetProportional(iPhoneByRefki[32], 1);
	TextDrawSetSelectable(iPhoneByRefki[32], 0);

	iPhoneByRefki[33] = TextDrawCreate(565.000000, 215.000000, "id_dual:white");
	TextDrawFont(iPhoneByRefki[33], 4);
	TextDrawLetterSize(iPhoneByRefki[33], 0.200000, 1.000000);
	TextDrawTextSize(iPhoneByRefki[33], 10.000000, 5.000000);
	TextDrawSetOutline(iPhoneByRefki[33], 1);
	TextDrawSetShadow(iPhoneByRefki[33], 0);
	TextDrawAlignment(iPhoneByRefki[33], 1);
	TextDrawColor(iPhoneByRefki[33], -1);
	TextDrawBackgroundColor(iPhoneByRefki[33], 255);
	TextDrawBoxColor(iPhoneByRefki[33], 50);
	TextDrawUseBox(iPhoneByRefki[33], 0);
	TextDrawSetProportional(iPhoneByRefki[33], 1);
	TextDrawSetSelectable(iPhoneByRefki[33], 0);

	iPhoneByRefki[34] = TextDrawCreate(568.500000, 215.250000, "id_beat:chit");
	TextDrawFont(iPhoneByRefki[34], 4);
	TextDrawLetterSize(iPhoneByRefki[34], 0.200000, 1.000000);
	TextDrawTextSize(iPhoneByRefki[34], 10.000000, 5.000000);
	TextDrawSetOutline(iPhoneByRefki[34], 1);
	TextDrawSetShadow(iPhoneByRefki[34], 0);
	TextDrawAlignment(iPhoneByRefki[34], 1);
	TextDrawColor(iPhoneByRefki[34], -1);
	TextDrawBackgroundColor(iPhoneByRefki[34], 255);
	TextDrawBoxColor(iPhoneByRefki[34], 50);
	TextDrawUseBox(iPhoneByRefki[34], 0);
	TextDrawSetProportional(iPhoneByRefki[34], 1);
	TextDrawSetSelectable(iPhoneByRefki[34], 0);

	iPhoneByRefki[35] = TextDrawCreate(494.000000, 212.750000, "Telkomsel");
	TextDrawFont(iPhoneByRefki[35], 1);
	TextDrawLetterSize(iPhoneByRefki[35], 0.144998, 1.000000);
	TextDrawTextSize(iPhoneByRefki[35], 400.000000, 17.000000);
	TextDrawSetOutline(iPhoneByRefki[35], 1);
	TextDrawSetShadow(iPhoneByRefki[35], 0);
	TextDrawAlignment(iPhoneByRefki[35], 1);
	TextDrawColor(iPhoneByRefki[35], -1);
	TextDrawBackgroundColor(iPhoneByRefki[35], 255);
	TextDrawBoxColor(iPhoneByRefki[35], 50);
	TextDrawUseBox(iPhoneByRefki[35], 0);
	TextDrawSetProportional(iPhoneByRefki[35], 1);
	TextDrawSetSelectable(iPhoneByRefki[35], 0);

	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	new file[64], string[128];
	format(file, sizeof file,"iPhone/%s.txt", GetName(playerid));
	if(dini_Exists(file))
	{
	    format(string, sizeof(string), "%s", dini_Get(file, "Nick-Facebook"));
        Phone[playerid][Nama_Facebook] = string;
	}
	else
	{
		dini_Create(file);
		dini_Set(file, "Nick-Facebook", "NULL");
		format(string, sizeof(string), "%s", dini_Get(file, "Nick-Facebook"));
		Phone[playerid][Nama_Facebook] = string;
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == iPhoneByRefki[15])
    {
        static string[sizeof(GpsByRefki) * 64];
		if(string[0] == EOS) 
		{
			for (new i; i < sizeof(GpsByRefki); i++) 
			{
				format(string, sizeof string, "%s{f4a442}» {00ff00}%s\n", string, GpsByRefki[i][NAMA_LOKASI]);
			}
		} 
		ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "Google Maps", string, "Select", "Close");
        return 1;
    }
    if(clickedid == iPhoneByRefki[16])
    {
         ShowPlayerDialog(playerid, DIALOG_MUSIC, DIALOG_STYLE_LIST, "Musik", "List Musik\nMasukan URL\nMatikan Musik", "Pilih", "Tidak");
         return 1;
    }
    if(clickedid == iPhoneByRefki[17])
    {
         ShowPlayerDialog(playerid, DIALOG_FACEBOOK, DIALOG_STYLE_LIST, "Facebook Lite", "Change Facebook Name\nPost Status", "Pilih", "Tidak");
         return 1;
    }
    if(clickedid == iPhoneByRefki[18])
    {
		if(Phone[playerid][Open_Camera] == 0)
		{
			 new Float:fPos[4], Float:fCam[2]; 
	         GetPlayerPos(playerid, fPos[0], fPos[1], fPos[2]);
		     GetPlayerFacingAngle(playerid, fPos[3]);
		     fPos[3] += 1.25;
		     fCam[0] = fPos[0] + 1.4 * floatcos(fPos[3], degrees);
		     fCam[1] = fPos[1] + 1.4 * floatsin(fPos[3], degrees);
		     SetPlayerCameraPos(playerid, fCam[0], fCam[1], fPos[2] + 0.9);
		     SetPlayerCameraLookAt(playerid, fPos[0], fPos[1], fPos[2] + 0.9);
		     SetPlayerFacingAngle(playerid, fPos[3] - 90.0);
		     TogglePlayerControllable(playerid, 0);
		     ApplyAnimation(playerid, "PED", "gang_gunstand", 4.1, 1, 1, 1, 1, 1, 1);
			 Phone[playerid][Open_Camera] = 1;
		}
		else
		{
		    ClearAnimations(playerid);
			TogglePlayerControllable(playerid, true);
			SetCameraBehindPlayer(playerid);
		    Phone[playerid][Open_Camera] = 0;
		}
        return 1;
    }
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid ==  DIALOG_NICKNAME_FB)
	{
    	if(!response)
        {
             return 1;
        }
		new string[128], file[248];
	    format(file, sizeof file,"iPhone/%s.txt", GetName(playerid));
		if(dini_Exists(file))
		{
		    dini_Set(file, "Nick-Facebook", inputtext);
		}
		format(string, sizeof(string), "%s", dini_Get(file, "Nick-Facebook"));
		Phone[playerid][Nama_Facebook] = string;
        KirimPesan(playerid, -1, "{00ff00}INFO: {ffffff}Anda Berhasil Mengganti Nama Facebook Menjadi: [{00ff00}%s{ffffff}]", inputtext);
	}
	if(dialogid == DIALOG_FACEBOOK) 
	{
		if(response)
		{
   	    	switch(listitem)
		    {
	         	case 0:
		        {
                    ShowPlayerDialog(playerid, DIALOG_NICKNAME_FB, DIALOG_STYLE_INPUT, "Facebook Settings", "Silahkan Masukan Nama Baru Untuk Akun Anda!", "Enter","Cancel");
		        }
		        case 1:
			    {
	                ShowPlayerDialog(playerid, DIALOG_POST_FB, DIALOG_STYLE_INPUT, "Buat Postingan", "Apa yang anda pikirkan?", "Post", "Cancel");
                }
	    	}
	    	return 1;
        }
    }
    if(dialogid == DIALOG_POST_FB)
	{
		if(response)
	    {
			foreach(new ii : Player) 
			{
					KirimPesan(ii, -1, "{0080ff}[FACEBOOK]{333333}%s: {ffffff}%s", Phone[playerid][Nama_Facebook], inputtext);
			}
			return 1;
	    }
	}
	if(dialogid == DIALOG_MUSIC) 
	{
    	if(response)
		{
		    switch(listitem)
			{
	        	case 0:
				{
	                ShowPlayerDialog(playerid, DIALOG_MUSIK, DIALOG_STYLE_LIST, "Musik", "{FF1400}0-Never By Alone\n{FFB400}1-Kina Can Wiss\n{DCDCDC}2-Hareudang\n{19FF00}3-Temola\n{FF00D7}4-Milos\n{CD0000}5-Rasa Tertinggal\n{2800FF}6-Kimino\n{F5FF00}7-Asade\n{C800FF}8-Imut\n{FF6400}9-Lingsir\n{FFD200}10-Tokyo Drift\n{FF3C00}11-Alone Unity\n{EBFF00}12-Raps Your\n{007DFF}13-Neffex Fight\n{00FFF0}14-NCS Tobu", "Play", "Tidak");
	                return 1;
				}
				case 1:
				{
	                ShowPlayerDialog(playerid, DIALOG_MUSIK_URL, DIALOG_STYLE_INPUT, "Musik","Silahkan Masukan Link Musik Untuk Menyetelnya", "Okay", "Exit");
	                return 1;
				}
				case 2:
				{
	                StopAudioStreamForPlayer(playerid);
	                GameTextForPlayer(playerid, "Radio Stopped.",2500,1);
	                return 1;
				}
			}
			return 1;
        }
    }
    if(dialogid == DIALOG_MUSIK) 
	{
		if(response)
		{
			switch(listitem)
			{
	        	case 0:
				{
	           Radio[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/kqrf.jpg");
	           GameTextForPlayer(playerid, "Playing Never...",2500,1);
				}
				case 1:
				{
	           Radio1[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/kPJY.jpg");
	           GameTextForPlayer(playerid, "Playing Can Wiss...",2500,1);
				}
				case 2:
				{
	           Radio2[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/kNR7.jpg");
	           GameTextForPlayer(playerid, "Playing Hareudang...",2500,1);
				}
				case 3:
				{
	           Radio3[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/kHqr.ttf");
	           GameTextForPlayer(playerid, "Playing Temola...",2500,1);
				}
				case 4:
				{
	           Radio4[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/kNL4.jpg");
	           GameTextForPlayer(playerid, "Playing Milos...",2500,1);
				}
				case 5:
				{
	           Radio5[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/kPJg.jpg");
	           GameTextForPlayer(playerid, "Playing Rasa...",2500,1);
				}
				case 6:
				{
	           Radio6[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/mhr7.png");
	           GameTextForPlayer(playerid, "Playing Kimino...",2500,1);
				}
				case 7:
				{
	           Radio7[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/kunZ.mp3");
	           GameTextForPlayer(playerid, "Playing Asade...",2500,1);
				}
				case 8:
				{
	           Radio8[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/kDiA.png");
	           GameTextForPlayer(playerid, "Playing Imut...",2500,1);
				}
				case 9:
				{
	           Radio9[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/mjEL.jpg");
	           GameTextForPlayer(playerid, "Playing Lingsir...",2500,1);
				}
				case 10:
				{
	           Radio10[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/mqbQ.jpg");
	           GameTextForPlayer(playerid, "Playing Tokyo Drift...",2500,1);
				}
				case 11:
	           {
	           Radio11[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/momM.png");
	           GameTextForPlayer(playerid, "Playing Alone...",2500,1);
				}
				case 12:
				{
	           Radio12[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/mn2M.jpg");
	           GameTextForPlayer(playerid, "Playing Raps...",2500,1);
				}
				case 13:
				{
	           Radio13[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/jwo3.mp3");
	           GameTextForPlayer(playerid, "Playing Neffex...",2500,1);
				}
				case 14:
				{
	           Radio14[playerid] = PlayAudioStreamForPlayer(playerid, "http://d.zaix.ru/mmX3.jpg");
	           GameTextForPlayer(playerid, "Playing NCS...",2500,1);
	           }
			}
			return 1;
        }
    }
    if(dialogid == DIALOG_MUSIK_URL)
	{
	    if(response)
		{
	           PlayAudioStreamForPlayer(playerid, inputtext);
	     }
    }
    if(dialogid == DIALOG_GPS)
	{
		if(response)
		{
			IDGps[playerid] = listitem;
			new str[128];
			SetPlayerRaceCheckpoint(playerid, 1, GpsByRefki[IDGps[playerid]][POS_X], GpsByRefki[IDGps[playerid]][POS_Y], GpsByRefki[IDGps[playerid]][POS_Z], 0, 0, 0, 3.5);
			format(str, 128, "{00ff00}INFO: {ffffff}Tujuan Anda Diatur Ke [{00ff00}%s{ffffff}]", GpsByRefki[IDGps[playerid]][NAMA_LOKASI]);
			SendClientMessage(playerid, -1, str);
			HideiPhone(playerid);
			Phone[playerid][Phone_Use] = 0;
		}
	}
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 5.0, GpsByRefki[IDGps[playerid]][POS_X], GpsByRefki[IDGps[playerid]][POS_Y], GpsByRefki[IDGps[playerid]][POS_Z]))
    {
        SendClientMessage(playerid, 0xFFFFFFFF,"{00ff00}INFO: {ffffff}Anda Telah Sampai Di Tujuan Anda");
        DisablePlayerRaceCheckpoint(playerid);
    }
	return 1;
}

CMD:phone(playerid, params[])
{
	if(Phone[playerid][Phone_Use] == 0)
	{
		ShowiPhone(playerid);
		Phone[playerid][Phone_Use] = 1;
	}
	else
	{
		HideiPhone(playerid);
		Phone[playerid][Phone_Use] = 0;
		ClearAnimations(playerid);
		TogglePlayerControllable(playerid, 1);
		SetCameraBehindPlayer(playerid);
	}
	return 1;
}