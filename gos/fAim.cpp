#define _CRT_SECURE_NO_WARNINGS

#include <windows.h>
#include <iostream>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <conio.h> 
#include <atlbase.h> 
#include <atlstr.h> 
#include <math.h> 
#include <time.h> 
#include <psapi.h> 

using namespace std;

#pragma comment(lib, "psapi.lib")

#include <d3d9.h>
#pragma comment(lib, "d3d9.lib")


#pragma comment(lib, "d3dx9.lib")

//================================================== ===================================

const BYTE bMaroon[60] =
{
	0x42, 0x4D, 0x3C, 0x00,0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x36, 0x00,
	0x00, 0x00, 0x28, 0x00, 0x00, 0x00,
	0x01, 0x00, 0x00, 0x00, 0x01,0x00,
	0x00, 0x00, 0x01, 0x00, 0x20, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x12, 0x0B, 0x00, 0x00,
	0x12, 0x0B, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x15, 0x00, 0x88, 0x00, 0x00, 0x00
};

const BYTE bOrange[60] =
{
	0x42, 0x4D, 0x3C, 0x00,0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x36, 0x00,
	0x00, 0x00, 0x28, 0x00, 0x00, 0x00,
	0x01, 0x00, 0x00, 0x00, 0x01,0x00,
	0x00, 0x00, 0x01, 0x00, 0x20, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x12, 0x0B, 0x00, 0x00,
	0x12, 0x0B, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x71, 0xFF, 0x00, 0x00, 0x00
};

const BYTE bBlue[60] =
{
	0x42, 0x4D, 0x3C, 0x00,0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x36, 0x00,
	0x00, 0x00, 0x28, 0x00, 0x00, 0x00,
	0x01, 0x00, 0x00, 0x00, 0x01,0x00,
	0x00, 0x00, 0x01, 0x00, 0x20, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x12, 0x0B, 0x00, 0x00,
	0x12, 0x0B, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x80, 0x00, 0x00, 0x00, 0x00, 0x00
};

const BYTE bLBlue[60] =
{
	0x42, 0x4D, 0x3C, 0x00,0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x36, 0x00,
	0x00, 0x00, 0x28, 0x00, 0x00, 0x00,
	0x01, 0x00, 0x00, 0x00, 0x01,0x00,
	0x00, 0x00, 0x01, 0x00, 0x20, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x12, 0x0B, 0x00, 0x00,
	0x12, 0x0B, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0xFF, 0x80, 0x00, 0x00, 0x00, 0x00
};

typedef HRESULT(WINAPI* CreateDevice_Prototype) (LPDIRECT3D9, UINT, D3DDEVTYPE, HWND, DWORD, D3DPRESENT_PARAMETERS*, LPDIRECT3DDEVICE9*);
typedef HRESULT(WINAPI* Reset_Prototype) (LPDIRECT3DDEVICE9, D3DPRESENT_PARAMETERS*);
typedef HRESULT(WINAPI* BeginScene_Prototype) (LPDIRECT3DDEVICE9);
typedef HRESULT(WINAPI* EndScene_Prototype) (LPDIRECT3DDEVICE9);
typedef HRESULT(WINAPI* DrawIndexedPrimitive_Prototype)(LPDIRECT3DDEVICE9, D3DPRIMITIVETYPE, INT, UINT, UINT, UINT, UINT);

CreateDevice_Prototype CreateDevice_Pointer = NULL;
Reset_Prototype Reset_Pointer = NULL;
BeginScene_Prototype BeginScene_Pointer = NULL;
EndScene_Prototype EndScene_Pointer = NULL;
DrawIndexedPrimitive_Prototype DrawIndexedPrimitive_Pointer = NULL;

HRESULT WINAPI Direct3DCreate9_VMTable(VOID);
HRESULT WINAPI CreateDevice_Detour(LPDIRECT3D9, UINT, D3DDEVTYPE, HWND, DWORD, D3DPRESENT_PARAMETERS*, LPDIRECT3DDEVICE9*);
HRESULT WINAPI Reset_Detour(LPDIRECT3DDEVICE9, D3DPRESENT_PARAMETERS*);
HRESULT WINAPI EndScene_Detour(LPDIRECT3DDEVICE9);
HRESULT WINAPI DrawIndexedPrimitive_Detour(LPDIRECT3DDEVICE9, D3DPRIMITIVETYPE, INT, UINT, UINT, UINT, UINT);

D3DCOLOR

FontColor = D3DCOLOR_ARGB(150, 20, 20, 20),
ESPColor = D3DCOLOR_ARGB(150, 20, 255, 20),
XHairColor = D3DCOLOR_ARGB(150, 255, 255, 20),
ConsoleColor = D3DCOLOR_ARGB(150, 255, 255, 255),
ConsoleLineColor = D3DCOLOR_ARGB(150, 20, 20, 20),
ConsoleTitleColor = D3DCOLOR_ARGB(150, 255, 255, 255),
WhiteColor = D3DCOLOR_ARGB(255, 255, 255, 255),

*pColor;

LPDIRECT3DSURFACE9

originalSurface = NULL,
originalDStencilSurface = NULL,
NewLSurface = NULL,
NewSurface = NULL;

D3DSURFACE_DESC

originalSurfaceDesc,
originalDepthSurfaceDesc;

LPDIRECT3DTEXTURE9

texMaroon = NULL,
texOrange = NULL,
texBlue = NULL,
texLBlue = NULL;

DWORD

TempX[220] = { NULL },
TempY[220] = { NULL },
color[220] = { NULL },

ColorArray[400000] = { 0 };

BOOL

TeamUSA = FALSE,
TeamMEC = FALSE,
NotInc = FALSE,
SRGBE = FALSE,
FGE = FALSE,

btKeyProc = FALSE;

UINT

Scale = 0,
XStride = 0,
Radius = 0;

BYTE

InitResources = 0x00,
bIngameDetector = 0x00,
btIngame = 0x00,
Aim_US_MEC = 0x01,

bKeyBstate[256] = { 0x00 },

btConsole = 0x00,
ConKey = 0x00,
wall = 0x00,
NoFog = 0x00,
AimThru = 0x00,
ColorDetector = 0x00,
AIM = 0x00,
XHair = 0x00,
ESP = 0x00,
bLoad = 0x00,
bInitDX = 0x00;

D3DRECT

rConsole,
rConsoleLine,
rConsoleTitle;

D3DVIEWPORT9
Viewport;

ID3DXBuffer
*MyBuffer = NULL;

ID3DXFont
* pFont = NULL;

ID3DXLine
* pLine = NULL;

HHOOK
KeyHook;

D3DXVECTOR2

LineX[1024],
Line[2],
LineA[2],
LineB[2];

RECT
rFont;

HANDLE
hProc;

D3DLOCKED_RECT
LOCKEDRECT;

LPBYTE
pBits = NULL;

POINT
AimAt[400000] = { -1 };

LPDIRECT3DPIXELSHADER9

shadecolor[220] = { NULL },
OriginalShaders = NULL;

char

MyShader[MAX_PATH],
ConBuffer[MAX_PATH],
DLL_PATH[MAX_PATH],
chConsole[MAX_PATH],
chCvars[512];

float

Step = 0.0f,
circ1 = 0.0f,
circ2 = 0.0f,
circ3 = 0.0f,
circ4 = 0.0f,

View = 1.0f;

int

FOV = 0,
Count = 0,
FirstPos = 0,
LastPos = 0,
NumberOfObjects = 0,
NumberOfShaders = 0,
BITSPERPIXEL = 32;

BOOL __stdcall Save();
BOOL __stdcall Load();

LRESULT CALLBACK KeyProc
(int code, WPARAM wParam, LPARAM lParam);

int __stdcall GetDistance
(long x1, long x2, long y1, long y2);

DWORD WINAPI VirtualMethodTableRepatchingLoopToCounterExtension Repatching(LPVOID);
PDWORD Direct3D_VMTable = NULL;

//================================================== ===================================

BOOL WINAPI DllMain(HINSTANCE hinstModule, DWORD dwReason, LPVOID lpvReserved)
{
	if (dwReason == DLL_PROCESS_ATTACH)
	{
		DisableThreadLibraryCalls(hinstModule);

		GetModuleFileNameA(hinstModule, DLL_PATH, MAX_PATH);
		DLL_PATH[strlen(DLL_PATH) - 3] = 0;
		strcat(DLL_PATH, "ini");

		ConKey = (BYTE)VkKeyScan('`');

		if (Direct3DCreate9_VMTable() == D3D_OK) {
			return TRUE;
		}
	}

	return FALSE;
}

//================================================== ===================================

HRESULT WINAPI Direct3DCreate9_VMTable(VOID)
{
	LPDIRECT3D9 Direct3D_Object = Direct3DCreate9(D3D_SDK_VERSION);

	if (Direct3D_Object == NULL)
		return D3DERR_INVALIDCALL;

	Direct3D_VMTable = (PDWORD)*(PDWORD)Direct3D_Object;
	Direct3D_Object->Release();

	DWORD dwProtect;

	if (VirtualProtect(&Direct3D_VMTable[16], sizeof(DWORD), PAGE_READWRITE, &dwProtect) != 0)
	{
		*(PDWORD)&CreateDevice_Pointer = Direct3D_VMTable[16];
		*(PDWORD)&Direct3D_VMTable[16] = (DWORD)CreateDevice_Detour;

		if (VirtualProtect(&Direct3D_VMTable[16], sizeof(DWORD), dwProtect, &dwProtect) == 0)
			return D3DERR_INVALIDCALL;
	}
	else
		return D3DERR_INVALIDCALL;

	return D3D_OK;
}

//================================================== ===================================

HRESULT WINAPI CreateDevice_Detour(LPDIRECT3D9 Direct3D_Object, UINT Adapter, D3DDEVTYPE DeviceType, HWND FocusWindow,
	DWORD BehaviorFlags, D3DPRESENT_PARAMETERS* PresentationParameters,
	LPDIRECT3DDEVICE9* Returned_Device_Interface)
{
	HRESULT Returned_Result = CreateDevice_Pointer(Direct3D_Object, Adapter, DeviceType, FocusWindow, BehaviorFlags,
		PresentationParameters, Returned_Device_Interface);

	DWORD dwProtect;

	if (VirtualProtect(&Direct3D_VMTable[16], sizeof(DWORD), PAGE_READWRITE, &dwProtect) != 0)
	{
		*(PDWORD)&Direct3D_VMTable[16] = *(PDWORD)&CreateDevice_Pointer;
		CreateDevice_Pointer = NULL;

		if (VirtualProtect(&Direct3D_VMTable[16], sizeof(DWORD), dwProtect, &dwProtect) == 0)
			return D3DERR_INVALIDCALL;
	}
	else
		return D3DERR_INVALIDCALL;

	if (Returned_Result == D3D_OK)
	{
		Direct3D_VMTable = (PDWORD)*(PDWORD)*Returned_Device_Interface;

		*(PDWORD)&Reset_Pointer = (DWORD)Direct3D_VMTable[16];
		*(PDWORD)&BeginScene_Pointer = (DWORD)Direct3D_VMTable[41];
		*(PDWORD)&EndScene_Pointer = (DWORD)Direct3D_VMTable[42];
		*(PDWORD)&DrawIndexedPrimitive_Pointer = (DWORD)Direct3D_VMTable[82];

		if (CreateThread(NULL, 0, VirtualMethodTableRepatchingLoopToCounterExtension Repatching, NULL, 0, NULL) == NULL)
			return D3DERR_INVALIDCALL;
	}

	return Returned_Result;
}

//================================================== ===================================

HRESULT WINAPI Reset_Detour(LPDIRECT3DDEVICE9 Device_Interface,
	D3DPRESENT_PARAMETERS* PresentationParameters)
{

	if (texOrange)
		if (texOrange->Release() == S_OK)
			texOrange = NULL;

	if (texMaroon)
		if (texMaroon->Release() == S_OK)
			texMaroon = NULL;

	if (texBlue)
		if (texBlue->Release() == S_OK)
			texBlue = NULL;

	if (texLBlue)
		if (texLBlue->Release() == S_OK)
			texLBlue = NULL;

	if (pFont)
		if (pFont->Release() == S_OK)
			pFont = NULL;

	if (pLine)
		if (pLine->Release() == S_OK)
			pLine = NULL;

	if (NewSurface)
		if (NewSurface->Release() == S_OK)
			NewSurface = NULL;

	if (NewLSurface)
		if (NewLSurface->Release() == S_OK)
			NewLSurface = NULL;

	if (originalSurface)
		if (originalSurface->Release() == S_OK)
			originalSurface = NULL;

	if (originalDStencilSurface)
		if (originalDStencilSurface->Release() == S_OK)
			originalDStencilSurface = NULL;

	if (OriginalShaders)
		if (OriginalShaders->Release() == S_OK)
			OriginalShaders = NULL;

	for (int x = 0; x < NumberOfObjects; x++)
		if (shadecolor[x])
			if (shadecolor[x]->Release() == S_OK)
				shadecolor[x] = NULL;

	InitResources = 0x00;

	return Reset_Pointer(Device_Interface, PresentationParameters);
}

//================================================== ===================================

HRESULT WINAPI BeginScene_Detour(LPDIRECT3DDEVICE9 Device_Interface)
{
	Device_Interface->GetViewport(&Viewport);

	if (!bLoad && btIngame) {
		Load();
		bLoad = 0x01;
	}

	if (bIngameDetector)
		btIngame = 0x01;
	else
		btIngame = 0x00;

	if (!InitResources) {

		/* Create Textures */
		D3DXCreateTextureFromFileInMemory(Device_Interface, (LPCVOID)&bOrange, 60, &texOrange);
		D3DXCreateTextureFromFileInMemory(Device_Interface, (LPCVOID)&bMaroon, 60, &texMaroon);
		D3DXCreateTextureFromFileInMemory(Device_Interface, (LPCVOID)&bBlue, 60, &texBlue);
		D3DXCreateTextureFromFileInMemory(Device_Interface, (LPCVOID)&bLBlue, 60, &texLBlue);

		/* Create font */
		D3DXCreateFont(Device_Interface, 14, 0, FW_BOLD, 0, FALSE, DEFAULT_CHARSET, OUT_DEFAULT_PRECIS,
			DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, TEXT("Cambria"), &pFont);

		/* Create a line */
		D3DXCreateLine(Device_Interface, &pLine);
		pLine->SetAntialias(TRUE);
		pLine->SetWidth(2.0f);

		/* Get Original Rendertarget Data */
		Device_Interface->GetRenderTarget(0, &originalSurface);
		originalSurface->GetDesc(&originalSurfaceDesc);

		if (originalSurface)
			if (originalSurface->Release() == S_OK)
				originalSurface = NULL;

		/* Set The Default Radius */
		Radius = Viewport.Width / 8;

		/* Screen size difference */
		Scale = (UINT)(Viewport.Width / 400);

		/* Create Small RenderTarget */
		Device_Interface->CreateRenderTarget((UINT)(Viewport.Width / Scale),
			(UINT)(Viewport.Height / Scale), D3DFMT_A8R8G8B8,
			D3DMULTISAMPLE_NONE, 0, TRUE, &NewSurface, NULL);

		/* Create Large RenderTarget */
		Device_Interface->CreateRenderTarget((UINT)Viewport.Width,
			(UINT)Viewport.Height, D3DFMT_A8R8G8B8, D3DMULTISAMPLE_NONE,
			0, TRUE, &NewLSurface, NULL);

		/* Create Shaders */
		NumberOfShaders = 0;
		for (int x = 1; x < 7; x++)
		{
			for (int y = 1; y < 7; y++)
			{
				for (int z = 1; z < 7; z++)
				{
					MyBuffer = NULL;

					sprintf(MyShader, "ps.1.1\ndef c0, %f, %f, %f, %f\nmov r0,c0",
						(float)((float)x*(float)40) / (float)255, (float)((float)y*(float)40) / (float)255,
						(float)((float)z*(float)40) / (float)255, (float)(float)255 / (float)255);

					D3DXAssembleShader(MyShader, sizeof(MyShader), NULL, NULL, 0, &MyBuffer, NULL);

					Device_Interface->CreatePixelShader((const DWORD*)MyBuffer->GetBufferPointer(), &shadecolor[NumberOfShaders]);

					color[NumberOfShaders] = (DWORD)D3DXCOLOR((float)((float)x*(float)40) / (float)255,
						(float)((float)y*(float)40) / (float)255, (float)((float)z*(float)40) / (float)255,
						(float)((float)255 / (float)255));

					NumberOfShaders++;
				}
			}
		}

		/* Initialize StretchRect */
		Device_Interface->StretchRect(NewLSurface, NULL,
			NewSurface, NULL, D3DTEXF_NONE);

		InitResources = 0x01;
	}

	/* Set The FOV */
	FOV = GetDistance(Radius + Viewport.Width / 2, Viewport.Width / 2, 0, 0);

	/* Circle drawing */
	Step = 3.14159265f * 2.0f / (float)(Radius / 2);

	Count = 0;

	for (float index = 0; index < 3.14159265 *2.0; index += Step)
	{
		circ1 = (float)Radius * cos(index) + (float)(Viewport.Width / 2);
		circ2 = (float)Radius * sin(index) + (float)(Viewport.Height / 2);
		circ3 = (float)Radius * cos(index + Step) + (float)(Viewport.Width / 2);
		circ4 = (float)Radius * sin(index + Step) + (float)(Viewport.Height / 2);
		LineX[Count].x = circ1;
		LineX[Count].y = circ2;
		LineX[Count + 1].x = circ3;
		LineX[Count + 1].y = circ4;
		Count += 2;
	}

	/* SetWindowHookEx */
	if (!btKeyProc) {
		DWORD ThdID = GetCurrentThreadId();
		KeyHook = SetWindowsHookExA(WH_KEYBOARD, &KeyProc, 0, ThdID);
		btKeyProc = 0x01;
	}

	bIngameDetector = 0x00;
	NumberOfObjects = 0;

	return BeginScene_Pointer(Device_Interface);
}

//================================================== ===================================

BOOL __stdcall DrawConsole(LPDIRECT3DDEVICE9 Device_Interface)
{
	if (btConsole && btIngame)
	{
		rConsole.x1 = (Viewport.Width / 2) - (Viewport.Width / 4);
		rConsole.y1 = (Viewport.Height / 2) - (Viewport.Height / 8);
		rConsole.x2 = (Viewport.Width / 2) + (Viewport.Width / 4);
		rConsole.y2 = (Viewport.Height / 2) + (Viewport.Height / 4);

		rFont.left = rConsole.x1 + 10;
		rFont.top = rConsole.y2 - 18;
		rFont.right = rConsole.x2;
		rFont.bottom = rConsole.y2;

		rConsoleLine.x1 = rConsole.x1;
		rConsoleLine.y1 = rFont.top - 6;
		rConsoleLine.x2 = rConsole.x2;
		rConsoleLine.y2 = rFont.top - 5;

		rConsoleTitle.x1 = rConsole.x1;
		rConsoleTitle.y1 = rConsole.y1 - 18;
		rConsoleTitle.x2 = rConsole.x2;
		rConsoleTitle.y2 = rConsole.y1;

		Device_Interface->Clear(1, &rConsole, D3DCLEAR_TARGET,
			ConsoleColor, 0, 0);

		Device_Interface->Clear(1, &rConsoleLine, D3DCLEAR_TARGET,
			ConsoleLineColor, 0, 0);

		Device_Interface->Clear(1, &rConsoleTitle, D3DCLEAR_TARGET,
			ConsoleTitleColor, 0, 0);

		rConsoleLine.x1 = rConsole.x1;
		rConsoleLine.y1 = rConsole.y1;
		rConsoleLine.x2 = rConsole.x2;
		rConsoleLine.y2 = rConsole.y1 + 1;

		Device_Interface->Clear(1, &rConsoleLine, D3DCLEAR_TARGET,
			ConsoleLineColor, 0, 0);

		pFont->DrawTextA(NULL, (LPCSTR)chConsole, -1, &rFont, DT_LEFT, FontColor);

		rFont.top = rConsoleTitle.y1 + 2;
		rFont.bottom = rConsoleTitle.y2;

		char chTitle[] = "CONSOLE";

		pFont->DrawTextA(NULL, (LPCSTR)chTitle, -1, &rFont, DT_LEFT, FontColor);

		char chUCFORUM[] = "UCFORUM D3D PROGRAMMING";

		rFont.top = rConsole.y2 - 38;
		rFont.bottom = rConsole.y2 - 24;

		pFont->DrawTextA(NULL, (LPCSTR)chUCFORUM, -1, &rFont, DT_LEFT, FontColor);

		char chAim_US_MEC[4];

		if (Aim_US_MEC)
			sprintf(chAim_US_MEC, "US");
		else
			sprintf(chAim_US_MEC, "MEC");

		sprintf(chCvars, \
			"CVARS 0/1\n\n" \
			"WALL %i\n" \
			"NOFOG %i\n" \
			"FOV %i\n" \
			"AIM %i\n" \
			"AIMTHRU %i\n" \
			"ESP %i\n" \
			"AIM @ %s\n" \
			"SAVE\n" \
			"LOAD\n" \
			, wall, NoFog, FOV, AIM, AimThru, ESP, chAim_US_MEC);

		rFont.top = rConsole.y1 + 14;
		rFont.bottom = rConsole.y2;

		pFont->DrawTextA(NULL, (LPCSTR)chCvars, -1, &rFont, DT_LEFT, FontColor);

	}

	return TRUE;

}
//================================================== ===================================

int __stdcall GetDistance(long x1, long x2, long y1, long y2)
{
	long ResA = (x1 - x2) * (x1 - x2);

	long ResB = (y1 - y2) * (y1 - y2);

	double ResC = (double)(ResA + ResB);

	return (int)sqrt(ResC);
}

//================================================== ===================================

HRESULT WINAPI EndScene_Detour(LPDIRECT3DDEVICE9 Device_Interface)
{
	DrawConsole(Device_Interface);

	/* // View NewLSuface
	RECT rectx;
	rectx.left = Viewport.Width - (Viewport.Width/4);
	rectx.top = 0;
	rectx.right = Viewport.Width;
	rectx.bottom = (Viewport.Height/4);

	Device_Interface->GetRenderTarget( 0,&originalSurface );

	Device_Interface->StretchRect( NewLSurface, NULL,
	originalSurface, &rectx, D3DTEXF_NONE );

	if( originalSurface ){
	originalSurface->Release();
	originalSurface = NULL;
	}*/

	int PixelCtr = 0;
	POINT ClosestTarget;
	ClosestTarget.x = -1;
	ClosestTarget.y = -1;

	/* Lock the small rendertarget to get 2d coords . auto edge included . */
	if (NumberOfObjects > 0 && btIngame)
	{
		Device_Interface->StretchRect(NewLSurface, NULL,
			NewSurface, NULL, D3DTEXF_NONE);
	}

	/* Draw Crosshair */
	if (!btConsole && XHair && btIngame) {

		int Len = 15;

		Line[0].x = (float)((Viewport.Width / 2));
		Line[0].y = (float)((Viewport.Height / 2) - Len);
		Line[1].x = (float)((Viewport.Width / 2));
		Line[1].y = (float)((Viewport.Height / 2) + Len);
		pLine->Begin();
		pLine->Draw(Line, 2, XHairColor);
		pLine->End();

		Line[0].x = (float)((Viewport.Width / 2) - Len);
		Line[0].y = (float)((Viewport.Height / 2));
		Line[1].x = (float)((Viewport.Width / 2) + Len);
		Line[1].y = (float)((Viewport.Height / 2));
		pLine->Begin();
		pLine->Draw(Line, 2, XHairColor);
		pLine->End();
	}

	/* Draw Circle */
	if (FOV > 0 && !btConsole && btIngame) {
		pLine->Begin();
		pLine->Draw(LineX, Count, D3DXCOLOR(1.0, 0.0, 0.0, 1.0));
		pLine->End();
	}

	if (NumberOfObjects > 0 && btIngame)
	{
		if (NewSurface->LockRect(&LOCKEDRECT, NULL,
			D3DLOCK_READONLY) == S_OK)
		{
			for (long scy = (long)1; scy <= (long)
				(Viewport.Height / (int)+Scale); scy++)
			{
				for (long scx = (long)1; scx <= (long)
					(Viewport.Width / (int)+Scale); scx++)
				{
					AimAt[PixelCtr].x = -1;
					AimAt[PixelCtr].y = -1;
					ColorArray[PixelCtr] = -1;
					pBits = (LPBYTE)LOCKEDRECT.pBits;
					pBits += ((scy * LOCKEDRECT.Pitch)
						+ (scx * (BITSPERPIXEL / 8)));
					pColor = (D3DCOLOR*)pBits;
					if (*pColor != NULL)
					{
						AimAt[PixelCtr].x = scx;
						AimAt[PixelCtr].y = scy;
						ColorArray[PixelCtr] = *pColor;
						if (PixelCtr < 400000)
							PixelCtr++;
					}
				}
			}
			NewSurface->UnlockRect();
		}

		/* loop through the pixel data to get colors */
		int ClosestPosition = 0;

		if (FOV)
			ClosestPosition = +FOV;
		else
			ClosestPosition = (int)+Viewport.Width;

		for (int i = 0; i < NumberOfObjects; i++)
		{
			ColorDetector = 0x00;
			TempX[i] = -1;
			TempY[i] = -1;
			for (int j = 0; j <= PixelCtr; j++)
			{
				if (ColorArray[j] == color[i] && !ColorDetector)
				{
					FirstPos = j;
					ColorDetector = 0x01;
				}
				if (ColorArray[j] == color[i] && ColorDetector)
				{
					LastPos = j;
				}

			}
			if (ColorDetector)
			{
				TempX[i] = (DWORD)(AimAt[FirstPos].x + AimAt[LastPos].x) / 2;
				TempY[i] = (DWORD)(AimAt[FirstPos].y + AimAt[LastPos].y) / 2;

				TempX[i] *= Scale;
				TempY[i] *= Scale;

				if (+GetDistance(TempX[i], Viewport.Width / 2, TempY[i],
					Viewport.Height / 2) < +ClosestPosition) {
					ClosestTarget.x = TempX[i];
					ClosestTarget.y = TempY[i];
				}
			}
		}
	}

	if (btIngame && NumberOfObjects > 0)
	{
		/* Draw esp on all objects */
		for (int i = 0; i < NumberOfObjects; i++)
		{
			if (TempX[i] != -1 && TempY[i] != -1 && !btConsole && ESP)
			{
				int Len = 4;

				LineA[0].x = (float)(TempX[i] - Len);
				LineA[0].y = (float)(TempY[i] - Len);
				LineA[1].x = (float)(TempX[i] + Len);
				LineA[1].y = (float)(TempY[i] + Len);
				pLine->Begin();
				pLine->Draw(LineA, 2, ESPColor);
				pLine->End();

				LineB[0].x = (float)(TempX[i] + Len);
				LineB[0].y = (float)(TempY[i] - Len);
				LineB[1].x = (float)(TempX[i] - Len);
				LineB[1].y = (float)(TempY[i] + Len);
				pLine->Begin();
				pLine->Draw(LineB, 2, ESPColor);
				pLine->End();
			}
		}

		/* Aim at closest position */
		if (ClosestTarget.x != -1 && ClosestTarget.y != -1 && !btConsole && AIM)
		{

			POINT Target;
			if ((DWORD)ClosestTarget.x > (Viewport.Width / 2)) {
				Target.x = ClosestTarget.x - (Viewport.Width / 2);
				Target.x /= 4;
				Target.x = +Target.x;
			}

			if ((DWORD)ClosestTarget.x < (Viewport.Width / 2)) {
				Target.x = (Viewport.Width / 2) - ClosestTarget.x;
				Target.x /= 4;
				Target.x = -Target.x;
			}

			if ((DWORD)ClosestTarget.x == (Viewport.Width / 2)) {
				Target.x = 0;
			}

			if ((DWORD)ClosestTarget.y >(Viewport.Height / 2)) {
				Target.y = ClosestTarget.y - (Viewport.Height / 2);
				Target.y /= 4;
				Target.y = +Target.y;
			}

			if ((DWORD)ClosestTarget.y < (Viewport.Height / 2)) {
				Target.y = (Viewport.Height / 2) - ClosestTarget.y;
				Target.y /= 4;
				Target.y = -Target.y;
			}

			if ((DWORD)ClosestTarget.y == (Viewport.Height / 2)) {
				Target.y = 0;
			}

			// Use with ingame sensitivity below 1.4 in BF2
			if (GetKeyState(VK_XBUTTON1)<0)
				mouse_event(MOUSEEVENTF_MOVE, Target.x,
					Target.y, 0, NULL);
		}


		/* Clear RenderTarget */
		Device_Interface->GetRenderTarget(0, &originalSurface);
		Device_Interface->GetDepthStencilSurface(&originalDStencilSurface);
		Device_Interface->SetRenderTarget(0, NewLSurface);
		Device_Interface->SetDepthStencilSurface(originalDStencilSurface);
		Device_Interface->Clear(0, NULL, D3DCLEAR_TARGET, WhiteColor, 0.0f, 0);
		Device_Interface->SetRenderTarget(0, originalSurface);
		Device_Interface->SetDepthStencilSurface(originalDStencilSurface);

		if (originalSurface)
			if (originalSurface->Release() == S_OK)
				originalSurface = NULL;

		if (originalDStencilSurface)
			if (originalDStencilSurface->Release() == S_OK)
				originalDStencilSurface = NULL;

	}

	return EndScene_Pointer(Device_Interface);
}

//================================================== ===================================

BOOL __stdcall Aimbot(LPDIRECT3DDEVICE9 Device_Interface, D3DPRIMITIVETYPE Type,
	INT Base, UINT Min, UINT Num, UINT start, UINT prim)
{
	/* Filter calls to setrenderstate that distort color (incomplete) */

	Device_Interface->GetRenderState(D3DRS_FOGENABLE, reinterpret_cast<DWORD*>(&FGE));
	Device_Interface->GetRenderState(D3DRS_SRGBWRITEENABLE, reinterpret_cast<DWORD*>(&SRGBE));

	/* Switch Rendertarget */
	Device_Interface->GetPixelShader(&OriginalShaders);
	Device_Interface->GetRenderTarget(0, &originalSurface);
	Device_Interface->GetDepthStencilSurface(&originalDStencilSurface);
	Device_Interface->SetRenderTarget(0, NewLSurface);
	Device_Interface->SetDepthStencilSurface(originalDStencilSurface);

	Device_Interface->SetRenderState(D3DRS_FOGENABLE, FALSE);
	Device_Interface->SetRenderState(D3DRS_SRGBWRITEENABLE, FALSE);

	Device_Interface->SetPixelShader(shadecolor[NumberOfObjects]);

	if (AimThru) {
		Device_Interface->SetRenderState(D3DRS_ZENABLE, D3DZB_FALSE);
		DrawIndexedPrimitive_Pointer(Device_Interface, Type, Base, Min, Num, start, prim);
	}

	Device_Interface->SetRenderState(D3DRS_ZENABLE, D3DZB_TRUE);
	DrawIndexedPrimitive_Pointer(Device_Interface, Type, Base, Min, Num, start, prim);

	Device_Interface->SetRenderTarget(0, originalSurface);
	Device_Interface->SetDepthStencilSurface(originalDStencilSurface);
	Device_Interface->SetPixelShader(OriginalShaders);

	Device_Interface->SetRenderState(D3DRS_FOGENABLE, *reinterpret_cast<DWORD*>(&FGE));
	Device_Interface->SetRenderState(D3DRS_SRGBWRITEENABLE, *reinterpret_cast<DWORD*>(&SRGBE));

	if (originalSurface)
		if (originalSurface->Release() == S_OK)
			originalSurface = NULL;

	if (originalDStencilSurface)
		if (originalDStencilSurface->Release() == S_OK)
			originalDStencilSurface = NULL;

	if (OriginalShaders)
		if (OriginalShaders->Release() == S_OK)
			OriginalShaders = NULL;

	if (NumberOfObjects < 216)
		NumberOfObjects++;

	return TRUE;
}
//================================================== ===================================

HRESULT WINAPI DrawIndexedPrimitive_Detour(LPDIRECT3DDEVICE9 Device_Interface, D3DPRIMITIVETYPE Type,
	INT Base, UINT Min, UINT Num, UINT start, UINT prim)
{
	LPDIRECT3DVERTEXBUFFER9 Stream_Data;
	UINT Offset = 0;
	UINT XStride = 0;

	if (Device_Interface->GetStreamSource(0, &Stream_Data, &Offset, &XStride) == D3D_OK)
		Stream_Data->Release();

	/* Disable ingame fog */
	if (NoFog && btIngame) Device_Interface->SetRenderState(D3DRS_FOGENABLE, FALSE);

	/* Detect when ingame */
	if (XStride == 52) bIngameDetector = 0x01;

	/* Monkey BF2 Model Rec */
	if (XStride == 52 && btIngame)
	{
		if (Num == 68 || Num == 70 || Num == 75 || Num == 341 || Num == 361 || Num == 398 || Num == 456 || Num == 480
			|| Num == 495 || Num == 549 || Num == 662 || Num == 782 || Num == 1073 || Num == 1270 || Num == 1322 || Num == 1518
			|| Num == 2148 || Num == 2240 || Num == 2303 || Num == 2414 || Num == 2675 || Num == 724 || Num == 787 || Num == 842
			|| Num == 1158 || Num == 1176 || Num == 1282)
		{
			NotInc = TRUE;
		}
		else { NotInc = FALSE; }

		if (XStride == 52 && NotInc == FALSE && (Num != 154) && (Num != 1082) && (Num != 1301)
			&& (Num != 1046) && (Num != 1321) && (Num != 2523) && (Num != 120) && (Num != 1279)
			&& (Num != 1407) && (Num != 248) && (Num != 90) && (Num != 251)
			&& (!(XStride == 52 && (Num == 1643 && prim == 861) || (Num == 3313 && prim == 2065) || (Num == 306 && prim == 128)
				|| (Num == 403 && prim == 153) || (Num == 2910 && prim == 1696) || (Num == 1095 && prim == 631)
				|| (Num == 6613 && prim == 4987) || (Num == 953 && prim == 912) || (Num == 2624 && prim == 1682)
				|| (Num == 1402 && prim == 721) || (Num == 422 && prim == 160) || (Num == 3480 && prim == 1810)
				|| (Num == 1880 && prim == 824) || (Num == 563 && prim == 213) || (Num == 6745 && prim == 4595)
				|| (Num == 6602 && prim == 5004))) && (!(XStride == 52 && (Num == 10 && prim == 8)))
			&& (!(XStride == 52 && (Num == 1322 || Num == 1112 || Num == 1045 || Num == 1578 || (Num == 1073 && prim == 1384)
				|| (Num == 1409 && prim == 1581) || (Num == 341 && prim == 200) || (Num == 1321 && prim == 1439)
				|| (Num == 1407 && prim == 1568)))) && (!(XStride == 52 && Num == 68))
			&& (!(XStride == 52 && (Num == 1073 && prim == 1384) || Num == 1112 || Num == 1045 || Num == 1578))
			&& (!(XStride == 52 && Num == 2302)) && (!(XStride == 52 && (Num == 251 && prim == 248) || (Num == 248 && prim == 248)))
			&& (!(XStride == 52 && (Num == 1322 || Num == 1112 || Num == 1045 || Num == 1578 || (Num == 1073 && prim == 1384)
				|| (Num == 1409 && prim == 1581) || (Num == 341 && prim == 200) || (Num == 1321 && prim == 1439) || (Num == 1407 && prim == 1568)))))
		{
			TeamMEC = TRUE;
		}
		else { TeamMEC = FALSE; }

		if (XStride == 52 && TeamMEC == FALSE && (Num == 68 || Num == 70 || Num == 75 || Num == 341 || Num == 361 || Num == 398 || Num == 456 || Num == 480
			|| Num == 495 || Num == 549 || Num == 662 || Num == 782 || Num == 1073 || Num == 1270 || Num == 1322 || Num == 1518
			|| Num == 2148 || Num == 2240 || Num == 2303 || Num == 2414 || Num == 2675 || Num == 724 || Num == 787 || Num == 842
			|| Num == 1158 || Num == 1176 || Num == 1282) &&
			(!(XStride == 52 && (Num == 1643 && prim == 861) || (Num == 3313 && prim == 2065) || (Num == 306 && prim == 128)
				|| (Num == 403 && prim == 153) || (Num == 2910 && prim == 1696) || (Num == 1095 && prim == 631)
				|| (Num == 6613 && prim == 4987) || (Num == 953 && prim == 912) || (Num == 2624 && prim == 1682)
				|| (Num == 1402 && prim == 721) || (Num == 422 && prim == 160) || (Num == 3480 && prim == 1810)
				|| (Num == 1880 && prim == 824) || (Num == 563 && prim == 213) || (Num == 6745 && prim == 4595)
				|| (Num == 6602 && prim == 5004))) && (!(XStride == 52 && (Num == 10 && prim == 8)))
			&& (!(XStride == 52 && (Num == 1322 || Num == 1112 || Num == 1045 || Num == 1578 || (Num == 1073 && prim == 1384)
				|| (Num == 1409 && prim == 1581) || (Num == 341 && prim == 200) || (Num == 1321 && prim == 1439)
				|| (Num == 1407 && prim == 1568)))) && (!(XStride == 52 && Num == 68))
			&& (!(XStride == 52 && (Num == 1073 && prim == 1384) || Num == 1112 || Num == 1045 || Num == 1578))
			&& (!(XStride == 52 && Num == 2302)) && (!(XStride == 52 && (Num == 251 && prim == 248) || (Num == 248 && prim == 248)))
			&& (!(XStride == 52 && (Num == 1322 || Num == 1112 || Num == 1045 || Num == 1578 || (Num == 1073 && prim == 1384)
				|| (Num == 1409 && prim == 1581) || (Num == 341 && prim == 200) || (Num == 1321 && prim == 1439) || (Num == 1407 && prim == 1568)))))
		{
			TeamUSA = TRUE;
		}
		else { TeamUSA = FALSE; }

		/* Draw wallhack and texture chams */
		if ((TeamUSA || TeamMEC) && wall)
		{
			if (TeamUSA) {
				Device_Interface->SetTexture(0, texBlue);
				Device_Interface->SetTexture(2, texBlue);
			}

			if (!TeamUSA) {
				Device_Interface->SetTexture(0, texMaroon);
				Device_Interface->SetTexture(2, texMaroon);
			}

			Device_Interface->SetRenderState(D3DRS_ZENABLE, D3DZB_FALSE);
			DrawIndexedPrimitive_Pointer(Device_Interface, Type, Base, Min, Num, start, prim);
			Device_Interface->SetRenderState(D3DRS_ZENABLE, D3DZB_TRUE);

			if (TeamUSA) {
				Device_Interface->SetTexture(0, texLBlue);
				Device_Interface->SetTexture(2, texLBlue);
			}

			if (!TeamUSA) {
				Device_Interface->SetTexture(0, texOrange);
				Device_Interface->SetTexture(2, texOrange);
			}
		}

		DrawIndexedPrimitive_Pointer(Device_Interface, Type, Base, Min, Num, start, prim);

		/* Call the aimbot function */
		if (btIngame)
			if ((Aim_US_MEC && TeamUSA) || (!Aim_US_MEC && TeamMEC))
				Aimbot(Device_Interface, Type, Base, Min, Num, start, prim);

		return S_OK;
	}

	return DrawIndexedPrimitive_Pointer(Device_Interface, Type, Base, Min, Num, start, prim);
}

//================================================== ===================================

DWORD WINAPI VirtualMethodTableRepatchingLoopToCounterExtension Repatching(LPVOID Param)
{
	UNREFERENCED_PARAMETER(Param);

	while (1)
	{
		Sleep(100);

		*(PDWORD)&Direct3D_VMTable[16] = (DWORD)Reset_Detour;
		*(PDWORD)&Direct3D_VMTable[41] = (DWORD)BeginScene_Detour;
		*(PDWORD)&Direct3D_VMTable[42] = (DWORD)EndScene_Detour;
		*(PDWORD)&Direct3D_VMTable[82] = (DWORD)DrawIndexedPrimitive_Detour;
	}

	return 1;
}

//================================================== ===================================

LRESULT CALLBACK KeyProc(int code, WPARAM wParam, LPARAM lParam)
{
	if (code < 0)
		goto EXIT;

	if ((lParam & 0x40000000) && btIngame)
	{
		switch (wParam)
		{
			// Reset the console
		case VK_DELETE:
			btConsole = 0x00;
			break;
		case VK_INSERT:
		case VK_NUMPAD0:
		case VK_NUMPAD1:
		case VK_NUMPAD2:
		default:
			break;
		}
		// Same as Game console key ( ` / ~ ) to prevent input and sync them . 
		if (wParam == ConKey) {
			btConsole = !btConsole;
			for (UINT i = 0; i < MAX_PATH; i++)
				chConsole[i] = NULL;
			return E_FAIL;
		}
		if (btConsole)
		{
			if ((wParam == VK_SPACE) || (wParam == VK_RETURN) || (wParam = = VK_BACK) || (wParam >= 0x2f) && (wParam <= 0x100))
			{
				if (wParam == VK_RETURN)
				{
					if (!strcmp("WALL 1", chConsole)) wall = 0x01;
					if (!strcmp("NOFOG 1", chConsole)) NoFog = 0x01;

					if (StrStrA(chConsole, "FOV")) {
						char chfov[5] =
						{ chConsole[4],chConsole[5],chConsole[6],chConsole[7],0x00 };
						int fov = atoi(chfov);
						if (fov >= 0 && fov < (int)(+Viewport.Height / 2)) Radius = (UINT)fov;
					}
					if (!strcmp("AIM 1", chConsole)) AIM = 0x01;
					if (!strcmp("AIMTHRU 1", chConsole)) AimThru = 0x01;
					if (!strcmp("XHAIR 1", chConsole)) XHair = 0x01;
					if (!strcmp("ESP 1", chConsole)) ESP = 0x01;
					if (!strcmp("AIM @ US", chConsole)) Aim_US_MEC = 0x01;

					if (!strcmp("SAVE", chConsole)) Save();
					if (!strcmp("LOAD", chConsole)) Load();

					if (!strcmp("WALL 0", chConsole)) wall = 0x00;
					if (!strcmp("NOFOG 0", chConsole)) NoFog = 0x00;
					if (!strcmp("AIM 0", chConsole)) AIM = 0x00;
					if (!strcmp("AIMTHRU 0", chConsole)) AimThru = 0x00;
					if (!strcmp("XHAIR 0", chConsole)) XHair = 0x00;
					if (!strcmp("ESP 0", chConsole)) ESP = 0x00;
					if (!strcmp("AIM @ MEC", chConsole)) Aim_US_MEC = 0x00;

					for (UINT i = 0; i < MAX_PATH; i++)
						chConsole[i] = NULL;

				}
				else
				{
					GetKeyboardState(bKeyBstate);
					WORD wCharacter;
					ToAscii(wParam, NULL, bKeyBstate, &wCharacter, NULL);

					UINT Len;

					for (Len = 0; Len < MAX_PATH; Len++) {
						if (chConsole[Len] == NULL)
							break;
					}

					if (Len < MAX_PATH) {
						chConsole[Len] = (char)wCharacter;
						chConsole[Len + 1] = 0x00;
					}

				}
				if (wParam == VK_BACK)
				{
					UINT Len;

					for (Len = 0; Len < MAX_PATH; Len++) {
						if (chConsole[Len] == NULL)
							break;
					}

					if (Len < MAX_PATH && Len > 0) {
						chConsole[Len] = 0x00;
						chConsole[Len - 1] = 0x00;
						chConsole[Len - 2] = 0x00;
					}
				}
			}
		}
	}

EXIT:

	return CallNextHookEx(KeyHook, code, wParam, lParam);
}

//================================================== ===================================

BOOL __stdcall Save()
{
	HANDLE hFile = CreateFileA(DLL_PATH, GENERIC_READ | GENERIC_WRITE,
		FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, CREATE_ALWAYS,
		FILE_ATTRIBUTE_NORMAL, NULL);

	char chCvars[] = "CVARS";
	char Buff[2] = { 0x00 };
	char Buffer[5] = { 0x00 };

	_itoa(Radius, Buffer, 10);

	if (wall) Buff[0] = '1';
	else Buff[0] = '0';

	WritePrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"WALL", (LPCSTR)&Buff, DLL_PATH);

	if (NoFog) Buff[0] = '1';
	else Buff[0] = '0';

	WritePrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"NOFOG", (LPCSTR)&Buff, DLL_PATH);

	if (AIM) Buff[0] = '1';
	else Buff[0] = '0';

	WritePrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"AIM", (LPCSTR)&Buff, DLL_PATH);

	WritePrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"FOV", (LPCSTR)&Buffer, DLL_PATH);

	if (AimThru) Buff[0] = '1';
	else Buff[0] = '0';

	WritePrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"AIMTHRU", (LPCSTR)&Buff, DLL_PATH);

	if (XHair) Buff[0] = '1';
	else Buff[0] = '0';

	WritePrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"XHAIR", (LPCSTR)&Buff, DLL_PATH);

	if (ESP) Buff[0] = '1';
	else Buff[0] = '0';

	WritePrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"ESP", (LPCSTR)&Buff, DLL_PATH);

	if (Aim_US_MEC) Buff[0] = '1';
	else Buff[0] = '0';

	WritePrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"AIM @", (LPCSTR)&Buff, DLL_PATH);

	return TRUE;
}

//================================================== ===================================

BOOL __stdcall Load()
{
	char chCvars[] = "CVARS";
	char Buff[2] = { 0x00 };
	char Buffer[5] = { 0x00 };

	if (GetPrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"WALL", "0", (LPSTR)&Buff, 2, DLL_PATH) == 1)
		wall = atoi(Buff);

	if (GetPrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"NOFOG", "0", (LPSTR)&Buff, 2, DLL_PATH) == 1)
		NoFog = atoi(Buff);

	if (GetPrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"AIM", "0", (LPSTR)&Buff, 2, DLL_PATH) == 1)
		AIM = atoi(Buff);

	if (GetPrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"FOV", "144", (LPSTR)&Buffer, 5, DLL_PATH) < 5) {
		int fov = atoi(Buffer);
		if (fov >= 0 && fov < 10000) Radius = fov;
	}

	if (GetPrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"AIMTHRU", "0", (LPSTR)&Buff, 2, DLL_PATH) == 1)
		AimThru = atoi(Buff);

	if (GetPrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"XHAIR", "0", (LPSTR)&Buff, 2, DLL_PATH) == 1)
		XHair = atoi(Buff);

	if (GetPrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"ESP", "0", (LPSTR)&Buff, 2, DLL_PATH) == 1)
		ESP = atoi(Buff);

	if (GetPrivateProfileStringA((LPCSTR)chCvars,
		(LPCSTR)"AIMTEAM", "1", (LPSTR)&Buff, 2, DLL_PATH) == 1)
		Aim_US_MEC = atoi(Buff);

	return TRUE;
}
