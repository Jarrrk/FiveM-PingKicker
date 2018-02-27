local strikes = 0
local playerPing = 0

RegisterNetEvent('pingKicker:return')
AddEventHandler('pingKicker:return', function(ping)
	playerPing = ping
end)

Citizen.CreateThread(function()
	while true do
		TriggerServerEvent('pingKicker:check')
		
		Wait(Config.checkInterval)

		if playerPing >= Config.limit then
			strikes = strikes + 1

			-- Displays in the clients F8 console
			print('Your ping (' .. playerPing .. ') is over the limit. (' .. strikes .. '/' .. Config.maxStrikes .. ')')
		else
			if strikes > 0 then
				strikes = strikes - 1
			end
		end

		if strikes >= Config.maxStrikes then
			TriggerServerEvent('pingKicker:kick')
		end
	end
end)