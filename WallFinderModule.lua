local module = {}

module.CheckWallCriteria = function(Part)
	local MinY = 4.2
	local MinX = 0.7
	local MinZ = 6.6
	if (Part.Size.Y >= MinY) and (Part.Size.X >= MinX) and (Part.Size.Z >= MinZ) or (math.abs(Part.Size.Y) >= MinZ) and (math.abs(Part.Size.X) >= MinX) and (math.abs(Part.Size.Z) >= MinZ) then
		return true
	else
		return false
	end
end

module.GetNearestWall = function(Character)
	local RaycastParameters = RaycastParams.new()
	RaycastParameters.FilterDescendantsInstances = {
		Character
	}
	local Direction = Vector3.new(3.23,0,0)
	local Origin = Character:WaitForChild("Right Arm").Position
	local Ray = workspace:Raycast(Origin,Direction,RaycastParameters)
	local InstanceR1
	local a,b = pcall(function()
		local InstanceR = Ray.Instance
		if InstanceR.ClassName == "Part" then
			local FitsCriteria = module.CheckWallCriteria(InstanceR)
			if FitsCriteria == true then
				InstanceR1 = InstanceR
				return true
			else
				error()
			end
		end
	end)
	if a == true then
		return InstanceR1
	end
end

return module
