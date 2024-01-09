#!/usr/bin/osascript

tell application "Finder"
	set selectedFiles to selection as alias list
	if selectedFiles is not {} then
		-- Assuming WorkDir is in your home directory, change the path if necessary
		set workDir to (path to documents folder as text) & "Projects Concentrix:"
		
		-- Check if WorkDir exists, if not create it
		if not (exists folder workDir) then
			display dialog "WorkDir folder does not exist." buttons {"OK"} default button 1
			return
		end if
		
		-- Check for existing files in 'Work Dir' and move files
		repeat with aFile in selectedFiles
			set fileName to name of aFile
			if exists file (workDir & fileName) then
				display dialog "A file with the name '" & fileName & "' already exists in Work Dir." buttons {"OK"} default button 1
				return
			else
				move aFile to folder workDir
			end if
		end repeat
	end
end tell
