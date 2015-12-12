Cannon = class("Cannon", Enemy)
Cannon.static.width = 35
Cannon.static.height = 40

function Cannon:initialize(x, y)
  Enemy.initialize(self, x, y or Enemy.spawnY - Cannon.height)
  self.width = Cannon.width
  self.height = Cannon.height
  self.health = 350
  self.ySpeed = 50
  self.contactDamage = 150
  
  self.minShot = 5
  self.maxShot = 8
  self.shotRange = math.tau / 8
  self.shootInterval = 1.5
  self.shootTimer = self.shootInterval
  self.color = { 220, 220, 220 }
end

function Cannon:update(dt)
  Enemy.update(self, dt)
  if self.dead then return end
  
  if self.shootTimer > 0 then
    self.shootTimer = self.shootTimer - dt
  else
    self.shootTimer = self.shootInterval
    
    for i = 1, math.random(self.minShot, self.maxShot) do
      local randomAngle = math.tau / 4 + self.shotRange * math.random() - self.shotRange / 2
      self.world:add(CannonShot:new(self.x, self.y, randomAngle))
    end
  end
end
