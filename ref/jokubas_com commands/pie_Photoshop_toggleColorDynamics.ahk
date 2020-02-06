; toggles on/off color dynamics when a brush is selected, takes hue, saturation, brightness arguments
pie_Photoshop_toggleColorDynamics(hue, sat, brt)
{
    appRef := ComObjActive( "Photoshop.Application" )
    ref := ComObjCreate( "Photoshop.ActionReference" )
    ref.putProperty( appRef.charIDToTypeID( "Prpr" ), appRef.stringIDToTypeID( "tool" ))
    ref.putEnumerated( appRef.charIDToTypeID( "capp" ), appRef.charIDToTypeID( "Ordn" ), appRef.charIDToTypeID( "Trgt" ))
    appDesc := appRef.executeActionGet( ref )
    options := appDesc.getObjectValue( appRef.stringIDToTypeID( "currentToolOptions" ))
    tool := appDesc.getEnumerationType( appRef.stringIDToTypeID( "tool" ))
    brush := options.getObjectValue( appRef.stringIDToTypeID( "brush" ))
    if options.getBoolean( appRef.stringIDToTypeID( "useColorDynamics" )) == 0
    {
        options.putBoolean(appRef.stringIDToTypeID( "useColorDynamics" ), ComObj(0xB, -1))
        options.putUnitDouble(appRef.stringIDToTypeID("hue"), appRef.charIDToTypeID("#Prc"), hue)
        options.putUnitDouble(appRef.stringIDToTypeID("saturation"), appRef.charIDToTypeID("#Prc"), sat)
        options.putUnitDouble(appRef.stringIDToTypeID("brightness"), appRef.charIDToTypeID("#Prc"), brt)
    }
    else
    {
        options.putBoolean(appRef.stringIDToTypeID( "useColorDynamics" ), ComObj(0xB, 0))
    }
    options.putObject( appRef.stringIDToTypeID( "brush" ), appRef.stringIDToTypeID( "null" ), brush)
    ref2 := ComObjCreate( "Photoshop.ActionReference" )
    ref2.putClass(tool)
    desc := ComObjCreate( "Photoshop.ActionDescriptor" )
    desc.putReference( appRef.stringIDToTypeID( "null" ), ref2 )
    desc.putObject( appRef.stringIDToTypeID( "to" ), appRef.stringIDToTypeID( "null" ), options)
    appRef.executeAction( appRef.stringIDToTypeID( "set" ), desc, 3 )
    return
}

; pie_Photoshop_toggleColorDynamics(15, 10, 5) ; works if you have the brush tool selected