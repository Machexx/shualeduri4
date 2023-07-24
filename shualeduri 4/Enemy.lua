Enemy = Class()

function Enemy:init(x, y)
    self.width = 15
	self.height = 15

    health = 10
end

function Enemy:render()
	love.graphics.setColor(1,1,0)
    love.graphics.rectangle("fill", self.x - self.width/2, self.y - self.height, self.width, self.height)
    love.graphics.setColor(1,1,1)

    for i = 1, #enemies do
        local enemy = enemies[i]
        love.graphics.draw(enemyImage, enemy.x, enemy.y)
      end
end