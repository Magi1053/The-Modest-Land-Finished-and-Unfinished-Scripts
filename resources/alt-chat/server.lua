TriggerEvent('modest:addCommand', 'ooc', function(source, args, user)
	table.remove(args, 1)
	message = table.concat(args, " ")
	TriggerClientEvent('chatMessage', -1, "[OOC] - " .. GetPlayerName(source), {88, 193, 221}, message)
end, {help = "talk out of rp", params = {{name = "message", help = "Talk out of rp"}}})

TriggerEvent('modest:addCommand', 'ad', function(source, args, user)
	table.remove(args, 1)
	message = table.concat(args, " ")
	TriggerClientEvent('chatMessage', -1, "[Advertisement] - " .. GetPlayerName(source), {171, 67, 227}, message)
end, {help = "boardcast an advertisement", params = {{name = "message", help = "Broadcast an advertisement."}}})

TriggerEvent('modest:addCommand', 'me', function(source, args, user, location)
	table.remove(args,1)
	TriggerClientEvent('chatMessageLocation', -1, "", {}, " ^6" .. GetPlayerName(source) .. " " .. table.concat(args, " "), location)
end, {help = "talk as an action", params = {{name = "message", help = "Talk as an action."}}})
