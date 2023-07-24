PlayState = Class{__includes = BaseState}

function PlayState:render()
	function spawnEnemy(id)
        local enemy = {}
        enemy.health = 10
        
        enemy.x = math.random(0, love.graphics.getWidth() - 15)
        enemy.y = math.random(0, love.graphics.getHeight() - 15)
  
        enemies[#enemies + 1] = enemy
        
        Enemy:render()
end

