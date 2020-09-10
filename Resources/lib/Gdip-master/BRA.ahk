; BRA standard library v1.02 by tic (Tariq Porter) 05/02/10
;
;#####################################################################################
;#####################################################################################

BRA_LibraryVersion()
{
	return 1.02
}

;#####################################################################################

BRA_VersionNumber(ByRef BRAFromMemIn)
{
	if !BRAFromMemIn
		return -1
	Loop, Parse, BRAFromMemIn, `n
	{
		StringSplit, Header, A_LoopField, |
		return (Header0 != 4 || Header2 != "BRA!") ? -1 : Header3
	}
}

;#####################################################################################

BRA_CreationDate(ByRef BRAFromMemIn)
{
	if !BRAFromMemIn
		return -1
	Loop, Parse, BRAFromMemIn, `n
	{
		StringSplit, Header, A_LoopField, |
		return (Header0 != 4 || Header2 != "BRA!") ? -1 : Header4
	}
}

;#####################################################################################

; Alternate = 0			List File names
; Alternate = 1			List File numbers
BRA_ListFiles(ByRef BRAFromMemIn, FolderName="", Recurse=0, Alternate=0)
{
	if !BRAFromMemIn
		return -1
	Loop, Parse, BRAFromMemIn, `n
	{
		StringSplit, Header, A_LoopField, |
		if (Header0 != 4 || Header2 != "BRA!")
			return -1
		break
	}

	if (FolderName = "")
		NameMatch := Recurse ? ".+?" : "[^\\]+?"
	else
	{
		FolderName .= (SubStr(FolderName, 0) = "\") ? "" : "\"
		StringReplace, RegExFolderName, FolderName, \, \\, All
		NameMatch := Recurse ? RegExFolderName ".+?" : RegExFolderName "[^\\]+?"
	}

	Pos := 1
	Loop
	{
		Pos := RegExMatch(BRAFromMemIn, "mi`n)^(\d+)\|(" NameMatch ")\|\d+\|\d+$", FileInfo, Pos+StrLen(FileInfo))
		if FileInfo
		{
			if Alternate
				AllFiles .= FileInfo1 "|"
			else
			{
				SplitPath, FileInfo2, OutFileName, OutDirectory
				
				if (OutDirectory = SubStr(FolderName, 1, StrLen(FolderName)-1))
					AllFiles .= OutFileName "|"
				else
					AllFiles .= SubStr(OutDirectory, InStr(OutDirectory, "\", 0)+1) "\" OutFileName "|"
			}
		}
		else
			break
	}
	StringTrimRight, AllFiles, AllFiles, 1
	return AllFiles
}

;#####################################################################################

BRA_ListFolders(ByRef BRAFromMemIn, FolderName="", Recurse=0)
{
	if !BRAFromMemIn
		return -1
	Loop, Parse, BRAFromMemIn, `n
	{
		StringSplit, Header, A_LoopField, |
		if (Header0 != 4 || Header2 != "BRA!")
			return -1
		break
	}

	if (FolderName = "")
		NameMatch := Recurse ? "([^\n]+?)\\[^\\]+?" : "([^\\\n]+?)\\[^\\]+?"
	else
	{
		FolderName .= (SubStr(FolderName, 0) = "\") ? "" : "\"
		StringReplace, RegExFolderName, FolderName, \, \\, All
		NameMatch := RegExFolderName (Recurse ? "(.+?)\\[^\\]+?" : "([^\\]+?)\\.+?")
	}

	Pos := 1, AllFolders := "|"
	Loop
	{
		Pos := RegExMatch(BRAFromMemIn, "mi`n)^\d+\|" NameMatch "\|\d+\|\d+$", FileInfo, Pos+StrLen(FileInfo))
		if FileInfo
		{
			InPos := StrLen(FileInfo1)
			Loop
			{
				ThisFolder := SubStr(FileInfo1, 1, InPos)
				if !InStr(AllFolders, "|" ThisFolder "|")
					AllFolders .= ThisFolder "|"

				StringGetPos, InPos, FileInfo1, \, R%A_Index%

				if (InPos = -1)
					break
			}
		}
		else
			break
	}
	StringTrimLeft, AllFolders, AllFolders, 1
	StringTrimRight, AllFolders, AllFolders, 1
	return AllFolders
}

;#####################################################################################

; Alternate = 0			Input files by name
; Alternate = 1			Input files by number
BRA_ListSizes(ByRef BRAFromMemIn, Files="", FolderName="", Recurse=0, Alternate=0)
{
	if !BRAFromMemIn
		return -1
	Loop, Parse, BRAFromMemIn, `n
	{
		StringSplit, Header, A_LoopField, |
		if (Header0 != 4 || Header2 != "BRA!")
			return -1
		break
	}
	
	StringSplit, File, Files, |
	Pos := 1
	if FolderName
	{
		FolderName .= (SubStr(FolderName, 0) = "\") ? "" : "\"
		StringReplace, RegExFolderName, FolderName, \, \\, All
		
		if !Files
		{
			NameMatch := Recurse ? RegExFolderName ".+?[^\\]+?" : RegExFolderName "[^\\]+?"
			Loop
			{
				Pos := RegExMatch(BRAFromMemIn, "mi`n)^\d+\|" NameMatch "\|\d+\|(\d+)$", FileInfo, Pos+StrLen(FileInfo))
				if FileInfo
					AllFiles .= FileInfo1 "|"
				else
					break
			}
		}
		else
		{
			Loop, %File0%
			{
				RegEx := Alternate ? "mi`n)^" File%A_Index% "\|.+?\|\d+\|(\d+)$" : "mi`n)^\d+\|" RegExFolderName File%A_Index% "\|\d+\|(\d+)$"
				RegExMatch(BRAFromMemIn, RegEx, FileInfo)
				AllFiles .= FileInfo ? FileInfo1 "|" : "|"
			}
		}
	}
	else
	{
		if !Files
		{
			if Recurse
			{
				Loop
				{
					Pos := RegExMatch(BRAFromMemIn, "mi`n)^" A_Index "\|.+?\|\d+\|(\d+)$", FileInfo, Pos+StrLen(FileInfo))
					if FileInfo
						AllFiles .= FileInfo1 "|"
					else
						break
				}
			}
			else
			{
				Loop
				{
					Pos := RegExMatch(BRAFromMemIn, "mi`n)^\d+\|[^\\]+?\|\d+\|(\d+)$", FileInfo, Pos+StrLen(FileInfo))
					if FileInfo
						AllFiles .= FileInfo1 "|"
					else
						break
				}
			}
		}
		else
		{
			Loop, %File0%
			{
				RegEx := Alternate ? "mi`n)^" File%A_Index% "\|.+?\|\d+\|(\d+)$" : "mi`n)^\d+\|" File%A_Index% "\|\d+\|(\d+)$"
				RegExMatch(BRAFromMemIn, RegEx, FileInfo)
				AllFiles .= FileInfo ? FileInfo1 "|" : "|"
			}
		}
	}
	StringTrimRight, AllFiles, AllFiles, 1
	return AllFiles
}

;#####################################################################################

; ###Header###
; BRA! | VersionNumber | DateCreated
; FileCount | StartPointer | SizeOfAllFiles
; FileNumber | FileName | FileSize | FileOffset
BRA_AddFiles(ByRef BRAFromMemIn, Files="", Folder="")
{
	StringSplit, File, Files, |
	
	if !File0
		return -1

	Loop, Parse, BRAFromMemIn, `n
	{
		if (A_Index = 1)
		{
			StringSplit, Header, A_LoopField, |
			if (Header0 != 4 || Header2 != "BRA!")
				return -2
			Header := A_LoopField "`n"
		}
		else if (A_Index = 2)
		{
			StringSplit, Info, A_LoopField, |
			if (Info0 != 3)
				return -3
		}
		else if (A_Index = Info1+3)
			break
		else
		{
			StringSplit, ThisLine, A_loopField, |
			if (ThisLine0 != 4)
				return -4
		}
	}

	if Folder
		Folder .= (SubStr(Folder, 0) = "\") ? "" : "\"
		
	if !BRAFromMemIn
	{
		TotalSize := 0
		Loop, %File0%
		{
			if !FileExist(File%A_Index%)
				return -4
			FileGetSize, Filesize%A_Index%, % File%A_Index%
			SplitPath, File%A_Index%, OutFileName
			Header .= A_Index "|" Folder OutFileName "|" TotalSize "|" FileSize%A_Index% "`n"
			TotalSize += Filesize%A_Index%
			FileRead, FileData%A_Index%, % File%A_Index%
		}

		NewHeader := Chr(1) "|BRA!|" BRA_LibraryVersion() "|" A_Now "`n"
		NewHeader .= SubStr("000000000000" File0, -11) "|" SubStr("000000000000" StrLen(Header)+66, -11) "|"  SubStr("000000000000" TotalSize, -11) "`n" Header
		VarSetCapacity(BRAFromMemIn, StrLen(NewHeader)+TotalSize, 0)
		DllCall("RtlMoveMemory", "UInt", &BRAFromMemIn, "UInt", &NewHeader, "UInt", StrLen(NewHeader))

		Pos := &BRAFromMemIn+StrLen(NewHeader)
		Loop, %File0%
		{
			DllCall("RtlMoveMemory", "UInt", Pos, "UInt", &FileData%A_Index%, "UInt", Filesize%A_Index%)
			Pos += Filesize%A_Index%
		}
		VarSetCapacity(BRAFromMemIn, -1)
	}
	else
	{
		FileCount := Round(Info1), StartPointer := Round(Info2), TotalFileSize := Round(Info3)
		TotalSize := 0
		Loop, %File0%
		{
			if !FileExist(File%A_Index%)
				return -4
			FileGetSize, Filesize%A_Index%, % File%A_Index%
			AppendHeader .= FileCount+A_Index "|" Folder File%A_Index% "|" TotalFileSize+TotalSize "|" FileSize%A_Index% "`n"
			TotalSize += Filesize%A_Index%
			FileRead, FileData%A_Index%, % File%A_Index%
		}

		VarSetCapacity(OldBRAFiles, TotalFileSize, 0)
		DllCall("RtlMoveMemory", "UInt", &OldBRAFiles, "UInt", &BRAFromMemIn+StartPointer, "UInt", TotalFileSize)
		
		Header .= SubStr("000000000000" FileCount+File0, -11) "|" SubStr("000000000000" StartPointer+StrLen(AppendHeader), -11) "|" SubStr("000000000000" TotalSize+TotalFileSize, -11) "`n"
		Header .= SubStr(BRAFromMemIn, StrLen(Header)+1, StartPointer-StrLen(Header))
		Header .= AppendHeader
		
		VarSetCapacity(BRAFromMemIn, StrLen(Header)+TotalFileSize+TotalSize, 0)
		DllCall("RtlMoveMemory", "UInt", &BRAFromMemIn, "UInt", &Header, "UInt", StrLen(Header))
		DllCall("RtlMoveMemory", "UInt", &BRAFromMemIn+StrLen(Header), "UInt", &OldBRAFiles, "UInt", TotalFileSize)
		Pos := &BRAFromMemIn+StrLen(Header)+TotalFileSize
		Loop, %File0%
		{
			DllCall("RtlMoveMemory", "UInt", Pos, "UInt", &FileData%A_Index%, "UInt", Filesize%A_Index%)
			Pos += Filesize%A_Index%
		}
		VarSetCapacity(BRAFromMemIn, -1)
	}
	return 0
}

;#####################################################################################

BRA_DeleteFiles(ByRef BRAFromMemIn, Files="", FolderName="", Alternate=0)
{
	StringSplit, File, Files, |
	
	if !File0
		return -1

	if !BRAFromMemIn
		return -2
		
	if FolderName
		FolderName .= (SubStr(FolderName, 0) = "\") ? "" : "\"

	ThisIndex := 0, TotalSize := 0
	Loop, Parse, BRAFromMemIn, `n
	{
		if (A_Index = 1)
		{
			StringSplit, Header, A_LoopField, |
			if (Header0 != 4 || Header2 != "BRA!")
				return -3
		}
		else if (A_Index = 2)
		{
			StringSplit, Info, A_LoopField, |
			if (Info0 != 3)
				return -4
			FileCount := Round(Info1), StartPointer := Round(Info2), TotalFileSize := Round(Info3)
		}
		else if (A_Index = FileCount+3)
			break
		else
		{
			StringSplit, FileInfo, A_LoopField, |
			if (FileInfo0 != 4)
				return -5
			
			Match := 0
			ThisMatch := Alternate ? FileInfo1 : FileInfo2
			Loop, %File0%
			{
				if (ThisMatch = FolderName File%A_Index%)
				{
					;MsgBox, %FileInfo2%
					Match := 1
					break
				}
			}
			
			if !Match
			{
				ThisIndex++
				Start%ThisIndex% := FileInfo3, Size%ThisIndex% := FileInfo4
				AppendHeader .= ThisIndex "|" FileInfo2 "|" TotalSize "|" FileInfo4 "`n"
				TotalSize += FileInfo4
			}
		}
	}
	;MsgBox, %AppendHeader%

	VarSetCapacity(OldBRAFiles, TotalFileSize, 0)
	DllCall("RtlMoveMemory", "UInt", &OldBRAFiles, "UInt", &BRAFromMemIn+StartPointer, "UInt", TotalFileSize)
	
	Header := Chr(1) "|BRA!|" Header3 "|" Header4 "`n"
	Header .= SubStr("000000000000" ThisIndex, -11) "|" SubStr("000000000000" StrLen(AppendHeader)+66, -11) "|" SubStr("000000000000" TotalSize, -11) "`n"
	Header .= AppendHeader
	
	;MsgBox, %Header%
	
	VarSetCapacity(BRAFromMemIn, StrLen(Header)+TotalSize, 0)
	DllCall("RtlMoveMemory", "UInt", &BRAFromMemIn, "UInt", &Header, "UInt", StrLen(Header))
	Pos := &BRAFromMemIn+StrLen(Header)
	Loop, %ThisIndex%
	{
		DllCall("RtlMoveMemory", "UInt", Pos, "UInt", &OldBRAFiles+Start%A_Index%, "UInt", Size%A_Index%)
		Pos += Size%A_Index%
	}
	VarSetCapacity(BRAFromMemIn, -1)
	return 0
}

;#####################################################################################

BRA_DeleteFolders(ByRef BRAFromMemIn, Folders)
{
	StringSplit, Folder, Folders, |
	
	if !Folder0
		return -1
		
	Loop, %Folder0%
		Folder%A_Index% .= (SubStr(FolderName, 0) = "\") ? "" : "\"

	if !BRAFromMemIn
		return -2

	ThisIndex := 0, TotalSize := 0
	Loop, Parse, BRAFromMemIn, `n
	{
		if (A_Index = 1)
		{
			StringSplit, Header, A_LoopField, |
			if (Header0 != 4 || Header2 != "BRA!")
				return -3
		}
		else if (A_Index = 2)
		{
			StringSplit, Info, A_LoopField, |
			if (Info0 != 3)
				return -4
			FileCount := Round(Info1), StartPointer := Round(Info2), TotalFileSize := Round(Info3)
		}
		else if (A_Index = FileCount+3)
			break
		else
		{
			StringSplit, FileInfo, A_LoopField, |
			if (FileInfo0 != 4)
				return -5
			
			Match := 0
			Loop, %Folder0%
			{
				if (Instr(FileInfo2, Folder%A_Index%) = 1)
				{
					Match := 1
					break
				}
			}
			
			if !Match
			{
				ThisIndex++
				Start%ThisIndex% := FileInfo3, Size%ThisIndex% := FileInfo4
				AppendHeader .= ThisIndex "|" FileInfo2 "|" TotalSize "|" FileInfo4 "`n"
				TotalSize += FileInfo4
			}
		}
	}

	VarSetCapacity(OldBRAFiles, TotalFileSize, 0)
	DllCall("RtlMoveMemory", "UInt", &OldBRAFiles, "UInt", &BRAFromMemIn+StartPointer, "UInt", TotalFileSize)
	
	Header := Chr(1) "|BRA!|" Header3 "|" Header4 "`n"
	Header .= SubStr("000000000000" ThisIndex, -11) "|" SubStr("000000000000" StrLen(AppendHeader)+66, -11) "|" SubStr("000000000000" TotalSize, -11) "`n"
	Header .= AppendHeader
	
	VarSetCapacity(BRAFromMemIn, StrLen(Header)+TotalSize, 0)
	DllCall("RtlMoveMemory", "UInt", &BRAFromMemIn, "UInt", &Header, "UInt", StrLen(Header))
	Pos := &BRAFromMemIn+StrLen(Header)
	Loop, %ThisIndex%
	{
		DllCall("RtlMoveMemory", "UInt", Pos, "UInt", &OldBRAFiles+Start%A_Index%, "UInt", Size%A_Index%)
		Pos += Size%A_Index%
	}
	VarSetCapacity(BRAFromMemIn, -1)
	return 0
}

;#####################################################################################

BRA_ExtractFiles(ByRef BRAFromMemin, Files="", FolderName="", OutputFolder="", Recurse=0, Alternate=0, Overwrite=0)
{
	if !BRAFromMemIn
		return -1
	Loop, Parse, BRAFromMemIn, `n
	{
		if (A_Index = 1)
		{
			StringSplit, Header, A_LoopField, |
			if (Header0 != 4 || Header2 != "BRA!")
				return -2
			Header := A_LoopField "`n"
		}
		else if (A_Index = 2)
		{
			StringSplit, Info, A_LoopField, |
			if (Info0 != 3)
				return -3
		}
		else if (A_Index = Info1+3)
			break
		else
		{
			StringSplit, ThisLine, A_loopField, |
			if (ThisLine0 != 4)
				return -4
		}
	}

	if OutputFolder
	{
		OutputFolder .= (SubStr(OutputFolder, 0) = "\") ? "" : "\"
		 if !InStr(FileExist(OutputFolder), "D")
			FileCreateDir, %OutputFolder%
	}
	
	; if FolderName
		; FolderName .= (SubStr(FolderName, 0) = "\") ? "" : "\"
		
	Pos := 1
	if !Files && !FolderName
	{
		Loop
		{
			if Recurse
				RegExMatch(BRAFromMemIn, "mi`n)^" A_Index "\|(.+?)\|(\d+)\|(\d+)$", FileInfo)
			else
			{
				;MsgBox, here
				;([^\\]+?)\|(\d+)\|(\d+)$
				Pos := RegExMatch(BRAFromMemIn, "mi`n)^(\d+)\|([^\\]+?)\|", FileInfo, Pos+StrLen(FileInfo))
			}

			MsgBox, % FileInfo "`n`n" FileInfo1 "`n`n" FileInfo2 "`n`n" FileInfo3 "`n`n" FileInfo4		;%
			if FileInfo
			{
				SplitPath, FileInfo1, OutFileName, OutDirectory
				if !FileExist(OutputFolder OutDirectory)
					FileCreateDir, % OutputFolder OutDirectory		;%

				if FileExist(OutputFolder FileInfo1)
				{
					if Overwrite
					{
						FileDelete, % OutputFolder FileInfo1		;%
						if ErrorLevel
							return -5
					}
					else
						continue
				}
			}
			else
				break
			
			h := DllCall("CreateFile", "Str", OutputFolder FileInfo1, "UInt", 0x40000000, "UInt", 0, "UInt", 0, "UInt", 4, "UInt", 0, "UInt", 0)
			if (h = -1)
				return -6
			result := DllCall("WriteFile", "UInt", h, "UInt", &BRAFromMemIn+Info2+FileInfo2, "UInt", FileInfo3, "UInt*", Written, "UInt", 0)
			h := DllCall("CloseHandle", "UInt", h)
		}
	}
	else if Files
	{
		if Alternate
		{

		}
		else
		{
			if FolderName
			{
			}
			else
			{
			}
		}
	}
	return 0
}

;#####################################################################################

BRA_ExtractToMemory(ByRef BRAFromMemin, File, ByRef OutputVar, Alternate=0)
{
}

;#####################################################################################

BRA_SaveToDisk(ByRef BRAFromMemIn, Output, Overwrite=0)
{
	if !BRAFromMemIn
		return -1
	Loop, Parse, BRAFromMemIn, `n
	{
		if (A_Index = 1)
		{
			StringSplit, Header, A_LoopField, |
			if (Header0 != 4 || Header2 != "BRA!")
				return -2
		}
		else if (A_Index = 2)
		{
			StringSplit, Info, A_LoopField, |
			if (Info0 != 3)
				return -3
		}
		else
			break
	}

	FileAttr := FileExist(Output)
	if (!Overwrite && FileAttr)
		return -4
	if InStr(FileAttr, "D")
		return -5
	
	if (Overwrite && FileAttr)
	{
		FileDelete, %Output%
		if ErrorLevel
			return -6
	}

	h := DllCall("CreateFile", "Str", Output, "UInt", 0x40000000, "UInt", 0, "UInt", 0, "UInt", 4, "UInt", 0, "UInt", 0)
	if (h = -1)
		return -7
	result := DllCall("WriteFile", "UInt", h, "UInt", &BRAFromMemIn, "UInt", Round(Info2)+Round(Info3), "UInt*", Written, "UInt", 0)
	h := DllCall("CloseHandle", "UInt", h)
	return 0
}