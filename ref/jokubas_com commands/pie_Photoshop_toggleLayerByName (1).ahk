; toggles on/off a layer by name
pie_Photoshop_toggleLayerByName(name)
{
    appRef := ComObjActive( "Photoshop.Application" )
    ref := ComObjCreate( "Photoshop.ActionReference" )
    ref.putName( appRef.stringIDToTypeID("layer"), name )
    desc := ComObjCreate( "Photoshop.ActionDescriptor" )
    desc.putReference( appRef.stringIDToTypeID( "null" ), ref )
    if appRef.executeActionGet(ref).getBoolean( appRef.stringIDToTypeID( "visible" )) == -1
    {
        appRef.executeAction( appRef.charIDToTypeID( "Hd  " ), desc, 3 )
        return
    }
    else
    {
        appRef.executeAction( appRef.charIDToTypeID( "Shw " ), desc, 3 )
    }
}

; pie_Photoshop_toggleLayerByName("Layer 4") ; works if you have a layer named Layer 4