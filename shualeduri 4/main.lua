push = require 'push'
Class = require 'class'

require 'StateMachine'

require 'BaseState'
require 'StartState'
require 'PlayState'

require 'Player'
require 'Bullet'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()
    
    io.stdout:setvbuf("no")
    
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    medium_font = love.graphics.newFont('8bit_font.ttf', 8)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = true,
		vsync = true
	})

    stateMachine =  StateMachine {
		['start'] = function() return StartState() end,
		['play'] = function() return PlayState() end
	}

    stateMachine:change('start')

    love.graphics.setFont(medium_font)

    
	
	bullets = {}
	player = Player()
    
end

function love.update(dt)
    
    stateMachine:update(dt)

    for i,v in ipairs(bullets) do
		v.x = v.x + (v.dx * dt)
		v.y = v.y + (v.dy * dt)
	end
    
end

function love.draw()
    push:start()

    bullet:render()

    player:render()
    
    stateMachine:render()

    push:finish()
end

function love.mousepressed(x, y, button)
	if button == 1 then
		local startX = player.x + player.width / 2
		local startY = player.y + player.height / 2
		local mouseX = x
		local mouseY = y
		
		local angle = math.atan2((mouseY - startY), (mouseX - startX))
		
		local bulletDx = bulletSpeed * math.cos(angle)
		local bulletDy = bulletSpeed * math.sin(angle)
		
		table.insert(bullets, {x = startX, y = startY, dx = bulletDx, dy = bulletDy})
	end
end

function love.keypressed(key)

 
end
