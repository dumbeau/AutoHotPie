; name should be in quotes ex.: "roundbrush"
pie_Photoshop_selectBrush(name)
{
    appRef := ComObjActive( "Photoshop.Application" )
    desc := ComObjCreate( "Photoshop.ActionDescriptor" )
    ref := ComObjCreate( "Photoshop.ActionReference" )
    ref.putName( appRef.charIDToTypeID( "Brsh" ), name)
    desc.putReference( appRef.charIDToTypeID( "null" ), ref )
    appRef.executeAction( appRef.charIDToTypeID( "slct" ), desc, 3 )
    return
}

; pie_Photoshop_selectBrush("round") ; works if you have a brush called round