#!/usr/bin/osascript

# Documentation:
# @raycast.description Creates a new file in the currently active Finder window's directory.

tell application "Finder"
	if (count of Finder windows) > 0 then
		set theFolder to (target of front Finder window) as alias
		set thePath to POSIX path of theFolder
		
		-- Name of the new file
		set fileName to "NewFile.txt"
		
		-- Combine the path and file name
		set fullPath to thePath & fileName
		
		-- Command to create a file
		do shell script "touch " & quoted form of fullPath
	else
		display dialog "No Finder window is open." buttons {"OK"} default button 1
	end if
end tell
