class PieFunction{
	__New(PieFunctionSettings, outer:=""){						
		ObjMerge(this, PieFunctionSettings)		
		this.__Parent := &outer
	}

	pieMenu[]{ ;or Parent[]
		get {
			if (NumGet(this.__Parent) == NumGet(&this)) ; safety check or you can use try/catch/finally
				return Object(this.__Parent)			
		}
	}
}