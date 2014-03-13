require "defines"

game.oninit(function()
	initTables()
end)


game.onload(function()
	initTables()
end)

function tableContains(t, element)
	for _, value in pairs(t) do
		if value == element then
			return true
		end
	end
	return false
end

function iTableContains(t, element)
	for _, value in ipairs(t) do
		if value == element then
			return true
		end
	end
	return false
end

game.onevent(defines.events.onentitydied, function(event)
	if event.entity.name == "field" then
		checkFieldValidity()
	end

	if     (event.entity.name == "germling")
		or (event.entity.name == "very-small-tree") 
		or (event.entity.name == "small-tree") 
		or (event.entity.name == "medium-tree")
		or (event.entity.name == "big-tree")
		then
			checkTreeValidity()
	end
end)

function checkTreeValidity()
	for k, tree in ipairs(glob.treefarm.growingTrees.entities) do
		if not tree.valid then
			table.remove(glob.treefarm.growingTrees.entities, k)
			table.remove(glob.treefarm.growingTrees.efficiency, k)
			table.remove(glob.treefarm.growingTrees.status, k)
			break
		end
	end
end

function checkFieldValidity()
	for k, field in ipairs(glob.treefarm.field) do
		if not field.valid then
			table.remove(glob.treefarm.field, k)
			table.remove(glob.treefarm.efficiency, k)
			break
		end
	end
end
game.onevent(defines.events.onplayermineditem, function(event)
	if event.itemstack.name == "field" then
		checkFieldValidity()
	end	
	if (event.itemstack.name == "germling") or 
		(event.itemstack.name == "very-small-tree") or 
		(event.itemstack.name == "small-tree") or 
		(event.itemstack.name == "medium-tree")
		then
			checkTreeValidity()
	end
end)


game.onevent(defines.events.onbuiltentity, function(event)
	--[[
	if event.createdentity.name == "field" then
		glob.treefarm.field[#glob.treefarm.field + 1] = event.createdentity
		glob.treefarm.efficiency[#glob.treefarm.field] = calcEfficiency(event.createdentity.position)
	end

	if event.createdentity.name == "germling" then
		addTreeToFarm(event.createdentity, 1)
	]]--
	if event.createdentity.name == "field" then
		local blockingField = {}
		blockingField = game.findentitiesfiltered{area = {{x = event.createdentity.position.x - 8, y = event.createdentity.position.y - 8}, event.createdentity.position}, name="field"}
		if #blockingField > 1 then
			game.player.character.insert{name="field", count=1}
			event.createdentity.destroy()
			game.player.print(game.gettext("msg_buildingFail").." A field is blocking us.")
			return
		end

		blockingField = {}
		blockingField = game.findentitiesfiltered{area = {{x = event.createdentity.position.x - 8, y = event.createdentity.position.y},{x = event.createdentity.position.x, y = event.createdentity.position.y + 8}}, name="field"}
		if #blockingField > 1 then
			game.player.character.insert{name="field", count=1}
			event.createdentity.destroy()
			game.player.print(game.gettext("msg_buildingFail").." A field is blocking us.")
			return
		end

		blockingField = {}
		blockingField = game.findentitiesfiltered{area = {{x = event.createdentity.position.x - 8, y = event.createdentity.position.y - 8},{x = event.createdentity.position.x + 8, y = event.createdentity.position.y}}, name="field"}
		if #blockingField > 1 then
			game.player.character.insert{name="field", count=1}
			event.createdentity.destroy()
			game.player.print(game.gettext("msg_buildingFail").." A field is blocking us.")
			return
		end

		local xi, yi
		local fieldPos = {x = event.createdentity.position.x, y = event.createdentity.position.y}
		local buildEnable = true
		for xi = 0, 7 do
			for yi = 0, 7 do
				if (xi == 0) and (yi == 0) then
					-- do nothing
				else
					if not game.canplaceentity{name="wooden-chest", position = {fieldPos.x + xi, fieldPos.y + yi}} then
						local playerEnt = game.findentitiesfiltered{area = {{fieldPos.x + xi - 1, fieldPos.y + yi - 1},{fieldPos.x + xi + 1, fieldPos.y + yi + 1}}, name="player"}
						if #playerEnt > 0 then
							-- do nothing
						else
							buildEnable = false
						end
					end
				end
			end
		end

		if buildEnable == false then
			game.player.character.insert{name="field", count=1}
			event.createdentity.destroy()
			game.player.print(game.gettext("msg_buildingFail").." A chest is blocking us.")
			return
		end


		local efficiency = {}
		local x,y
		efficiency[1] = calcEfficiency({x = event.createdentity.position.x + 0, y = event.createdentity.position.y + 0})
		efficiency[2] = calcEfficiency({x = event.createdentity.position.x + 7, y = event.createdentity.position.y + 0})
		efficiency[3] = calcEfficiency({x = event.createdentity.position.x + 0, y = event.createdentity.position.y + 7})
		efficiency[4] = calcEfficiency({x = event.createdentity.position.x + 7, y = event.createdentity.position.y + 7})
		
		if (efficiency[1] == 0) or (efficiency[2] == 0) or (efficiency[3] == 0) or (efficiency[4] == 0) then
			game.player.character.insert{name="field", count=1}
			event.createdentity.destroy()
			game.player.print(game.gettext("msg_buildingFail").." The soil is too poor.")
		else
			efficiency[5] = (efficiency[1] + efficiency[2] + efficiency[3] + efficiency[4]) / 4
			glob.treefarm.field[#glob.treefarm.field + 1] = event.createdentity
			glob.treefarm.efficiency[#glob.treefarm.field] = efficiency[5]
		end
	
	elseif event.createdentity.name == "germling" then
		glob.treefarm.growingTrees.entities[#glob.treefarm.growingTrees.entities + 1] = event.createdentity
		glob.treefarm.growingTrees.efficiency[#glob.treefarm.growingTrees.efficiency + 1] = calcEfficiency(event.createdentity.position)
		glob.treefarm.growingTrees.status[#glob.treefarm.growingTrees.status + 1] = 1
	end

end)

function detectTreeStatus(entity)
	if     entity.name == "germling"        then return 1
	elseif entity.name == "very-small-tree" then return 2
	elseif entity.name == "small-tree"      then return 3
	elseif entity.name == "medium-tree"     then return 4
	elseif	(entity.name == "dark-thin-tree") or
			(entity.name == "green-thin-tree") or
			(entity.name == "dark-green-thin-tree") or
			(entity.name == "green-tree") or
			(entity.name == "dark-green-tree")
			then
				return 5
	end
end

function addTreeToFarm(entity, status)
	if status == 0 then
		status = detectTreeStatus(entity)
		if status == 5 then return end
	end
	if not iTableContains(glob.treefarm.growingTrees.entities, entity) then
		glob.treefarm.growingTrees.entities[#glob.treefarm.growingTrees.entities + 1] = entity
		glob.treefarm.growingTrees.efficiency[#glob.treefarm.growingTrees.efficiency + 1] = calcTreeEfficiency(entity.position)
		glob.treefarm.growingTrees.status[#glob.treefarm.growingTrees.status + 1] = status
	end
end


game.onevent(defines.events.ontick, function(event)

	glob.treefarm.tick = glob.treefarm.tick + 1

	if (glob.treefarm.tick % 60) == 0 then
		for k, field in pairs(glob.treefarm.field) do
			if field.valid then
				local efficiency =  glob.treefarm.efficiency[k]
				if field.getitemcount("fertilizer") > 0 then efficiency = efficiency * 2 end
				local growchance = math.ceil(math.random()* 100)		
				local growntrees = game.findentitiesfiltered{area = {field.position, {field.position.x + 8, field.position.y + 8}}, type="tree"}
				
				if (growchance > 95) then
					if math.random() <= efficiency then
						local treeplaced = false					
						-- Loop maximum of 49 times.
						for loop=0,49 do
							local growntree = {}					
							local treeposition ={}
							treeposition.x = math.floor(math.random()*7) + field.position.x + 1
							treeposition.y = math.floor(math.random()*7) + field.position.y + 1
							growntree = game.findentitiesfiltered{area = {treeposition, treeposition}, type="tree"}
							if #growntree > 1 then
								for id=2,#growntree do
									growntree[id].destroy()
								end
							end
							if growntree[1] == nil then
								if #growntrees < 40 then
									--game.createentity{name = "big-tree", position = treeposition}
									addTreeToFarm(game.createentity{name = "germling", position = treeposition},1)
									treeplaced = true
									break
								else
									break
								end
							else
								addTreeToFarm(growntree[1],0)
							end
						end -- (treeplaced~= true)
					end
				end -- (growchance > 99) and (#growntrees < 40)
			end
		end -- _, field in ipairs(glob.treefarm.field)
	end -- (glob.treefarm.tick % 60) == 0

	--if ((glob.treefarm.tick + 30) % 60) == 0 then		
	--	for _, field in pairs(glob.treefarm.field) do
	--		if field.valid then
	--			local diechance = math.ceil(math.random()*100)			
	--			local growntrees = game.findentitiesfiltered{area = {field.position, {field.position.x + 7, field.position.y + 7}}, type="tree"}
	--			if (#growntrees > 20) and (diechance > 98) then
	--				-- N3X: growntrees[math.ceil(math.random()*#growntrees)].destroy()
	--				table.insert(treesToDestroy,treesToDestroy[math.ceil(math.random()*#growntrees)])
	---			end -- (#growntrees > 10) and (diechance > 80)
	--		end
	--	end -- _, field in ipairs(glob.treefarm.field)
	--end -- ((glob.treefarm.tick + 30) % 60) == 0

	if (glob.treefarm.tick % 1200) == 0 then		
		for _, field in ipairs(glob.treefarm.field) do
			if field.valid then
				if field.getitemcount("fertilizer") > 0 then
					field.getinventory(1).remove{name = "fertilizer", count = 1}
				end
			end
		end -- _, field in ipairs(glob.treefarm.field)
	end -- ((glob.treefarm.tick + 30) % 60) == 0

	if (glob.treefarm.tick % (300 + math.ceil(math.random()*300))) == 0 then		
		for k, field in pairs(glob.treefarm.field) do
			if field.valid then	
				local growntrees = game.findentitiesfiltered{area = {field.position, {field.position.x + 8, field.position.y + 8}}, type="tree"}
				if #growntrees > 5 then
					local efficiency = glob.treefarm.efficiency[k]
					if field.getitemcount("fertilizer") > 0 then efficiency = efficiency * 4 end

					local rnd_out = math.ceil(math.random()*efficiency)
					-- N3X - Make sure we're only producing as much wood as we have trees.
					rnd_out = math.max(math.min(rnd_out, #growntrees),1)
					if 128 - field.getitemcount("raw-wood") >= rnd_out*5 then
						local wood_produced=0
						local trees_cut=0
						-- This is a predictable pattern, but I'd rather not deal with a table being resized while it's being iterated.
						for _, tree in pairs(growntrees) do
							if tree.valid and (trees_cut + 1) <= rnd_out and detectTreeStatus(tree)==5 then
								tree.destroy()
								wood_produced = wood_produced + 5
								trees_cut = trees_cut + 1
							end
						end
						checkTreeValidity()
						--game.showmessagedialog("Produced "..wood_produced.." wood.")
						if wood_produced > 0 then
							field.getinventory(1).insert{name = "raw-wood", count = wood_produced}
						end
					end
				end
			end
		end -- _, field in ipairs(glob.treefarm.field)
	end -- ((glob.treefarm.tick + 30) % 60) == 0

	growTrees()
end)


function calcEfficiency(position)

	local efficiency = 0
	local x,y

	for x = 0, 7, 7 do
		for y = 0, 7 , 7 do
			if game.gettile(position.x + x, position.y + y).name == "grass" then
				efficiency = efficiency + 1.00
			elseif game.gettile(position.x + x, position.y + y).name == "dirt" then
				efficiency = efficiency + 0.95
			elseif game.gettile(position.x + x, position.y + y).name == "hills" then
				efficiency = efficiency + 0.70
			elseif game.gettile(position.x + x, position.y + y).name == "sand" then
				efficiency = efficiency + 0.60
			else
				efficiency = efficiency + 0.00
			end
		end
	end

	efficiency = efficiency / 4
	return efficiency
end


function calcTreeEfficiency(position)

	local efficiency = 0

	if game.gettile(position.x, position.y).name == "grass" then
		efficiency = efficiency + 1.00
	elseif game.gettile(position.x, position.y).name == "grass-medium" then
		efficiency = efficiency + 1.00
	elseif game.gettile(position.x, position.y).name == "grass-dry" then
		efficiency = efficiency + 1.00
	elseif game.gettile(position.x, position.y).name == "dirt" then
		efficiency = efficiency + 0.95
	elseif game.gettile(position.x, position.y).name == "dirt-dark" then
		efficiency = efficiency + 0.95
	elseif game.gettile(position.x, position.y).name == "hills" then
		efficiency = efficiency + 0.70
	elseif game.gettile(position.x, position.y).name == "sand" then
		efficiency = efficiency + 0.60
	elseif game.gettile(position.x, position.y).name == "sand-dark" then
		efficiency = efficiency + 0.60
	else
		efficiency = efficiency + 0.00
	end

	return efficiency
end


function calcEfficiencyMigration()

	glob.treefarm.efficiency = {}

	for k, field in pairs(glob.treefarm.field) do
		if field.valid then
			glob.treefarm.efficiency[k] = calcEfficiency(field.position)
		end
	end
end


function initTables()

	if glob.treefarm == nil then
		glob.treefarm = {}													-- Namespace
	elseif glob.treefarm.efficiency == nil then
		calcEfficiencyMigration()
	end

	if glob.treefarm.field == nil then
		glob.treefarm.field = {}											-- stores fieldentity position etc
	end

	if glob.treefarm.tick == nil then
		glob.treefarm.tick = 0												-- general mod-tickcounter
	end

	if glob.treefarm.efficiency == nil then
		glob.treefarm.efficiency = {}	
	end

	if glob.treefarm.growingTrees == nil then
		glob.treefarm.growingTrees = {}
		glob.treefarm.growingTrees.entities = {}										-- seed table
		glob.treefarm.growingTrees.efficiency = {}
		glob.treefarm.growingTrees.status = {}
	end

end


function startingItems()

	game.player.character.insert{name="iron-plate", count=8}
	game.player.character.insert{name="pistol", count=1}
	game.player.character.insert{name="basic-bullet-magazine", count=100}
	game.player.character.insert{name="wooden-chest", count=64}
	game.player.character.insert{name="small-electric-pole", count=32}
	game.player.character.insert{name="basic-inserter", count=64}
	game.player.character.insert{name="solar-panel", count=54}
	game.player.character.insert{name="cokery", count=16}
	game.player.character.insert{name="basic-transport-belt", count=128}
	game.player.character.insert{name="steam-engine", count=16}
	game.player.character.insert{name="boiler", count=32}
	game.player.character.insert{name="lab", count=8}
	game.player.character.insert{name="pipe", count=64}
	game.player.character.insert{name="basic-mining-drill", count=32}
	game.player.character.insert{name="basic-transport-belt-to-ground", count=32}
	game.player.character.insert{name="pipe-to-ground", count=32}
	game.player.character.insert{name="basic-splitter", count=32}
	game.player.character.insert{name="straight-rail", count=32}
	game.player.character.insert{name="curved-rail", count=32}
	game.player.character.insert{name="field", count=32}
	game.player.character.insert{name="fertilizer", count=128}
	game.player.character.insert{name="coal", count=128}
	game.player.character.insert{name="raw-wood", count=128}
	game.player.character.insert{name="seeds", count=64}
	game.player.character.insert{name="car", count=1}
	game.player.character.insert{name="stone-crusher", count=8}
	game.player.character.insert{name="chemical-plant", count=8}
	game.player.character.insert{name="empty-barrel", count=32}
	game.player.character.insert{name="stone", count=256}
	game.player.character.insert{name="science-pack-1", count=256}
	game.player.character.insert{name="hydroculture", count=8}
	game.player.character.insert{name="oil-refinery", count=8}
	game.player.character.insert{name="offshore-pump", count=8}
	game.player.character.insert{name="poison-capsule", count=8}
	game.player.character.insert{name="medicine", count=8}


	game.player.force.technologies["coal-processing"].researched = true
	game.player.force.technologies["fertilizer"].researched = true
	game.player.force.technologies["organic-plastic"].researched = true
	game.player.force.technologies["medicine"].researched = true

end


function growTrees()

	if (glob.treefarm.tick % (60 + math.floor(math.random()*120))) == 0 then
		for k, tree in pairs(glob.treefarm.growingTrees.entities) do
			if tree.valid then
				local growchance = math.random()
				local efficiency = math.random()

				if (growchance >= 0.99) and (efficiency <= glob.treefarm.growingTrees.efficiency[k]) then
					updateTree(k)
					--break
				end
			end
		end

	end

end


function updateTree(k)

	local tmpPos

	glob.treefarm.growingTrees.status[k] = glob.treefarm.growingTrees.status[k] + 1

	if glob.treefarm.growingTrees.status[k] == 2 then		-- very small tree
		tmpPos = glob.treefarm.growingTrees.entities[k].position
		glob.treefarm.growingTrees.entities[k].destroy()
		table.remove(glob.treefarm.growingTrees.entities, k)
		table.insert(glob.treefarm.growingTrees.entities, k , game.createentity{name = "very-small-tree", position = tmpPos})

	elseif glob.treefarm.growingTrees.status[k] == 3 then		-- small tree
		tmpPos = glob.treefarm.growingTrees.entities[k].position
		glob.treefarm.growingTrees.entities[k].destroy()
		table.remove(glob.treefarm.growingTrees.entities, k)
		table.insert(glob.treefarm.growingTrees.entities, k , game.createentity{name = "small-tree", position = tmpPos})

	elseif glob.treefarm.growingTrees.status[k] == 4 then		-- medium tree
		tmpPos = glob.treefarm.growingTrees.entities[k].position
		glob.treefarm.growingTrees.entities[k].destroy()
		table.remove(glob.treefarm.growingTrees.entities, k)
		table.insert(glob.treefarm.growingTrees.entities, k , game.createentity{name = "medium-tree", position = tmpPos})

	elseif glob.treefarm.growingTrees.status[k] == 5 then		-- big tree
		tmpPos = glob.treefarm.growingTrees.entities[k].position
		glob.treefarm.growingTrees.entities[k].destroy()
		table.remove(glob.treefarm.growingTrees.entities, k)
		--table.remove(glob.treefarm.growingTrees.efficiency, k)
		--table.remove(glob.treefarm.growingTrees.status, k)
		local tmpRandom = math.random(5)
		local treeType = "dark-thin-tree"
		if tmpRandom == 1 then
			treeType = "dark-thin-tree"
		elseif tmpRandom == 2 then
			treeType = "green-thin-tree"
		elseif tmpRandom == 3 then
			treeType = "dark-green-thin-tree"
		elseif tmpRandom == 4 then
			treeType = "green-tree"
		elseif tmpRandom == 5 then
			treeType = "dark-green-tree"
		end
		table.insert(glob.treefarm.growingTrees.entities, k, game.createentity{name = treeType, position = tmpPos})
	end

end
