#Include Gdip_All.ahk
#Include GdipHelper.ahk

SetUpGDIP()
StartDrawGDIP()
ClearDrawGDIP()

Gdip_SetSmoothingMode(G, 4)

pBrush := Gdip_BrushCreateSolid(0xffff0000)
Gdip_FillEllipse(G, pBrush, 300, 500, 200, 300)
Gdip_DeleteBrush(pBrush)

pBrush := Gdip_BrushCreateSolid(0x660000ff)
Gdip_FillRectangle(G, pBrush, 250, 80, 300, 200)
Gdip_DeleteBrush(pBrush)

G := Gdip_BlurBitmap(G, 50)



EndDrawGDIP()
return

esc::
exitapp
return