RegisterServerEvent('pingKicker:check')
AddEventHandler('pingKicker:check', function()
	local _source = source
	local currentPing = GetPlayerPing(_source)

	TriggerClientEvent('pingKicker:return', _source, currentPing)
end)

RegisterServerEvent('pingKicker:kick')
AddEventHandler('pingKicker:kick', function()
	local _source = source
	local finalPing = GetPlayerPing(_source)

	DropPlayer(_source, "You have been kicked due to your high ping! (" .. finalPing .. "ms/" .. Config.limit .. "ms limit)")
end)