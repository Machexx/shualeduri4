Player = Class{}

function Player:init(x, y)
	self.x = 250
	self.y = 250
	
	self.width = 15
	self.height = 15

    
    max_health = 100
	health = 100
end

function Player:render()
	love.graphics.setColor(1,1,0)
    love.graphics.rectangle("fill", self.x - self.width/2, self.y - self.height, self.width, self.height)
    love.graphics.setColor(1,1,1)
end


