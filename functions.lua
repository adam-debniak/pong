local functions = {}

function functions.detectColision(ballCenter, ballVelocity, dt, world)
    
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

return functions