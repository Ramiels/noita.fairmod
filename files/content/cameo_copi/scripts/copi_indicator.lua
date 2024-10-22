dofile_once("mods/noita.fairmod/files/scripts/utils/utilities.lua")
local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local players = GetPlayersInRadius(x, y, 256)
for i=1, #players do
	local player = players[i]
	local tx, ty = EntityGetTransform(player)
	local ray_x, ray_y = tx-x, ty-y
	local dist = ((ray_x*ray_x)+(ray_y*ray_y))^0.5
	local run, rise = ray_x/dist, ray_y/dist
	for k=6, dist do
		GameCreateCosmeticParticle("spark_red", x+run*k, y+rise*k, 1, 0, 0, 0, 0.05, 0.05, true, true, false, false, 0, 0)
	end
end