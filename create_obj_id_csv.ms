-- LICENSE AND INFORMATIONS
-- Frozen Forest Reality Technologies - Eray OZER
-- 3Ds Max CSV/TXT Exporter for Object Transform Values
-- CSV for Selected Object Type

-- Global Variables Declares
global objcount

-- Global Variable Defines
globalVars.set #objcount (getCurrentSelection()).count

-- Save Dialog Pup-Up
output_name = getSaveFileName caption:"CSV File" types:"CSV (*.csv)|*.csv|"
if output_name != undefined then
	(
		-- Create CSV File
		output_file = createfile output_name
		
		-- Create OBJ Name Section
		format "%\n" ("OBJINDEX") to:output_file
		
		-- Local Variables for Object ID Creator
		first_index = 0
		last_index = (globalVars.get #objcount)
		
		-- Object ID Creator
		for i = 1 to last_index do
			(
				index = (((first_index)+i)-1)
				format "%\n" (index) to:output_file
			)
	
		close output_file
	)