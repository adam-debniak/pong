local functions = {}

functions.ballMovement = function(ball, dt, world)    
    if 0 <= ball.center[1] - ball.radius and ball.center[1] + ball.radius <= world.width then
        ball.center[1] = ball.center[1] + ball.velocity[1]*dt
    elseif ball.center[1] + ball.radius > world.width then
        ball.center[1] = world.width - ball.radius
        ball.velocity[1] = -ball.velocity[1]
    else
        ball.center[1] = 0 + ball.radius
        ball.velocity[1] = -ball.velocity[1]
    end

    if 0 <= ball.center[2] - ball.radius and ball.center[2] + ball.radius <= world.height then
        ball.center[2] = ball.center[2] + ball.velocity[2]*dt
    elseif ball.center[2] + ball.radius > world.height then
        ball.center[2] = world.height - ball.radius
        ball.velocity[2] = -ball.velocity[2]
    else
        ball.center[2] = 0 + ball.radius
        ball.velocity[2] = -ball.velocity[2]
    end

    return ball.center, ball.velocity
end

function functions.paddleMovement(rocketL, rocketR, rocketSpeed, dt, world)
    if love.keyboard.isDown("w") then 
        rocketL[2] = rocketL[2] - rocketSpeed * dt
        rocketL[4] = rocketL[4] - rocketSpeed * dt
        rocketL[6] = rocketL[6] - rocketSpeed * dt
        rocketL[8] = rocketL[8] - rocketSpeed * dt
    end

    if love.keyboard.isDown("s") then 
        rocketL[2] = rocketL[2] + rocketSpeed * dt
        rocketL[4] = rocketL[4] + rocketSpeed * dt
        rocketL[6] = rocketL[6] + rocketSpeed * dt
        rocketL[8] = rocketL[8] + rocketSpeed * dt
    end

    if love.keyboard.isDown("o") then 
        rocketR[2] = rocketR[2] - rocketSpeed * dt
        rocketR[4] = rocketR[4] - rocketSpeed * dt
        rocketR[6] = rocketR[6] - rocketSpeed * dt
        rocketR[8] = rocketR[8] - rocketSpeed * dt
    end

    if love.keyboard.isDown("l") then 
        rocketR[2] = rocketR[2] + rocketSpeed * dt
        rocketR[4] = rocketR[4] + rocketSpeed * dt
        rocketR[6] = rocketR[6] + rocketSpeed * dt
        rocketR[8] = rocketR[8] + rocketSpeed * dt
    end
end

return functions