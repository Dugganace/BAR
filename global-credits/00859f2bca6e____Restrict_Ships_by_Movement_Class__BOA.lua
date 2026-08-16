-- Restrict Ships by Movement Class "BOAT

local factoriesarray={"corsy","armsy","legsy","corasy","armasy","legasy"}

for a,b in pairs(UnitDefs) do 

	if b.movementclass and string.find(b.movementclass,"BOAT") then 
		b.unitrestricted=0	
	end

	for k,v in pairs(factoriesarray) do 
		if a==v then
			b.unitrestricted=0	
			break
		end
	end		
end;