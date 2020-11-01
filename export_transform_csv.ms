-- LICENSE AND INFORMATIONS
-- Frozen Forest Reality Technologies - Eray OZER
-- 3Ds Max CSV/TXT Exporter for Object Transform Values
-- CSV for Selected Object Type

-- Global Variables Declares / USE THEM WHEN NEEDED
-- global objcount
-- global objcount_int
-- global objcount_str

-- Global Variable Defines / USE THEM WHEN NEEDED
-- globalVars.set #objcount (getCurrentSelection()).count
-- globalVars.set #objcount_int ((globalVars.get #objcount) as integer)
-- globalVars.set #objcount_str ((globalVars.get #objcount) as string)

-- Save Dialog Pup-Up
output_name = getSaveFileName caption:"CSV File" types:"CSV (*.csv)|*.csv|"
if output_name != undefined then
	(
		-- Create CSV File
		output_file = createfile output_name
		
		-- Write Value Titles to CSV (This is required for UE4 Structure.)
		format "%\n" ("," +"POSX" + "," + "POSY" + "," + "POSZ" + "," + "ROTX" + "," + "ROTY" + "," + "ROTZ" + "," + "SCALEX" + "," + "SCALEY" + "," + "SCALEZ" + "," + "UE4POSY") to:output_file
			
		-- Object Properties Writer
		-- You can change "ffmesh" string as you like. It is custom created variable. But if you change it you should change also all referances. Just use replace all.
		for ffmesh in selection do
			(
				-- Transform Values of Objects
				posx = (ffmesh.pos.x as string)
				posy = (ffmesh.pos.y as string)
				posz = (ffmesh.pos.z as string)
				rotx = (ffmesh.rotation.x_rotation as string)
				roty = (ffmesh.rotation.y_rotation as string)
				rotz = (ffmesh.rotation.z_rotation as string)
				scalex = (ffmesh.scale.x as string)
				scaley = (ffmesh.scale.y as string)
				scalez = (ffmesh.scale.z as string)
					
				-- UE4 Value Creator
				ue4_posy = (((ffmesh.pos.y)*(-1)) as string)
				
				-- Write All Values to CSV (We use "%\n" for writing values to second row.)
				format "%\n" (ffmesh.name + "," + posx + "," + posy + "," + posz + "," + rotx + "," + roty + "," + rotz + "," + scalex + "," + scaley + "," + scalez + "," + ue4_posy ) to:output_file
			)
		close output_file
	)