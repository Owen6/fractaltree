angle = 0
rat = .67

love.graphics.setBackgroundColor(255, 255, 255)

function love.update(dt)
	if love.keyboard.isDown("right") and angle < math.pi * 2 then
		angle = angle + 1 * dt
	elseif love.keyboard.isDown("left") and angle > 0 then
		angle = angle - 1 * dt
	end
	if love.keyboard.isDown("up") and rat < .8 then
		rat = rat + .1 * dt
	elseif love.keyboard.isDown("down") and rat > 0 then
		rat = rat - .1 * dt
	end
end

function love.draw()
	love.graphics.translate(400, love.graphics.getHeight()/2)
	love.graphics.push()
	branch(100)
	love.graphics.pop()
	love.graphics.push()
	love.graphics.rotate(math.pi/2)
	branch(100)
	love.graphics.pop()
	love.graphics.push()
	love.graphics.rotate(-math.pi/2)
	branch(100)
	love.graphics.pop()
	love.graphics.push()
	love.graphics.rotate(math.pi)
	branch(100)
	love.graphics.pop()
end

function branch(len)
	local n = len
	if n > 255 then
		n = 0
	end
	love.graphics.setColor(255 - n, math.abs(100 - n), n)
	love.graphics.line(0, 0, 0, -len)
	love.graphics.translate(0, -len)


	if len > 8 then
		love.graphics.push()
		love.graphics.rotate(angle)
		branch(len * rat)
		love.graphics.pop()
		-- love.graphics.push()
		-- branch(len * rat)
		-- love.graphics.pop()
		love.graphics.push()
		love.graphics.rotate(-angle)
		branch(len * rat)
		love.graphics.pop()
	end
end