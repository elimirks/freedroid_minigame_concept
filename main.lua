tileSize = 20

-- References to the graphics
tileGraphics = { cross, finish, intersect, start, straight, turn }

-- Enum
TILE_TYPES = {
	cross = 1,
	start = 2,
	finish = 3,
	straight_vertical = 4,
	straight_horizontal = 5,
	turn_up_right = 6,
	turn_up_left = 7,
	turn_down_right = 8,
	turn_down_left = 9,
	intersect_up = 10,
	intersect_down = 11,
	intersect_right = 12,
	intersect_left = 13,
}

--[[
TODO it would be better to use store transformed images which are rotated on load. This required a lot of dynamic computation.
Draw a tile to the screen.
params:
tileType - Type from the TILE_TYPES enum.
x, y - Position
state - The state of the tile - plain, highlighted, broken, etc.
 - Not implemented - You could use whatever you want for this.
]]
function drawTile(tileType, x, y, state)
	local r = 0
	local image = nil
	if tileType == TILE_TYPES.cross then
		image = tileGraphics.cross
	elseif tileType == TILE_TYPES.start then
		image = tileGraphics.start
	elseif tileType == TILE_TYPES.finish then
		image = tileGraphics.finish
	elseif tileType == TILE_TYPES.straight_vertical then
		image = tileGraphics.straight
	elseif tileType == TILE_TYPES.straight_horizontal then
		image = tileGraphics.straight
		r = math.rad(90)
		x = x + 1 -- rotation will shift the image
	elseif tileType == TILE_TYPES.turn_up_right then
		image = tileGraphics.turn
		r = math.rad(-90)
		y = y + 1
	elseif tileType == TILE_TYPES.turn_up_left then
		image = tileGraphics.turn
		r = math.rad(180)
		y = y + 1
		x = x + 1
	elseif tileType == TILE_TYPES.turn_down_right then
		image = tileGraphics.turn
	elseif tileType == TILE_TYPES.turn_down_left then
		image = tileGraphics.turn
		r = math.rad(90)
		x = x + 1
	elseif tileType == TILE_TYPES.intersect_up then
		image = tileGraphics.intersect
		r = math.rad(-90)
		y = y + 1
	elseif tileType == TILE_TYPES.intersect_down then
		image = tileGraphics.intersect
		r = math.rad(90)
		x = x + 1
	elseif tileType == TILE_TYPES.intersect_right then
		image = tileGraphics.intersect
	elseif tileType == TILE_TYPES.intersect_left then
		image = tileGraphics.intersect
		r = math.rad(180)
		x = x + 1
		y = y + 1
	else
		print("Unknown tile type")
		return
	end
	love.graphics.draw(image, x * tileSize, y * tileSize, r)
end

function love.load()
	love.graphics.setBackgroundColor(0, 0, 0)
	tileGraphics.cross = love.graphics.newImage("graphics/cross.png")
	tileGraphics.finish = love.graphics.newImage("graphics/finish.png")
	tileGraphics.intersect = love.graphics.newImage("graphics/intersect.png")
	tileGraphics.start = love.graphics.newImage("graphics/start.png")
	tileGraphics.straight = love.graphics.newImage("graphics/straight.png")
	tileGraphics.turn = love.graphics.newImage("graphics/turn.png")
end

-- Display all of the tiles lined up - Just for testing.
function tileDrawTest()
	for k,val in pairs(TILE_TYPES) do
		drawTile(TILE_TYPES[k], val - 1, 0, nil)
	end
end

function love.draw()
	tileDrawTest()
end

function love.update(dt)
end

