local functions = {}

functions.ballMovement = function(ballCenter, ballRadius, ballVelocity, dt, world)
    if 0 <= ballCenter[1] - ballRadius and ballCenter[1] + ballRadius <= 800 then
        ballCenter[1] = ballCenter[1] + ballVelocity[1]*dt
    elseif ballCenter[1] + ballRadius > 800 then
        ballCenter[1] = 800 - ballRadius
        ballVelocity[1] = -ballVelocity[1]
    else
        ballCenter[1] = 0 + ballRadius
        ballVelocity[1] = -ballVelocity[1]
    end

    if 0 <= ballCenter[2] - ballRadius and ballCenter[2] + ballRadius <= 600 then
        ballCenter[2] = ballCenter[2] + ballVelocity[2]*dt
    elseif ballCenter[2] + ballRadius > 600 then
        ballCenter[2] = 600 - ballRadius
        ballVelocity[2] = -ballVelocity[2]
    else
        ballCenter[2] = 0 + ballRadius
        ballVelocity[2] = -ballVelocity[2]
    end

    
    
  
    
    return ballCenter, ballVelocity
end

function functions.paddleMovement(rocketL, rocketR, rocketSpeed, dt)
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