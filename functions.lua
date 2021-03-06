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
    
    if love.keyboard.isDown("w") and rocketL[6] > 0 then 
        rocketL[2] = rocketL[2] - rocketSpeed * dt
        rocketL[4] = rocketL[4] - rocketSpeed * dt
        rocketL[6] = rocketL[6] - rocketSpeed * dt
        rocketL[8] = rocketL[8] - rocketSpeed * dt
    end

    if love.keyboard.isDown("s") and rocketL[2] < world.height then 
        rocketL[2] = rocketL[2] + rocketSpeed * dt
        rocketL[4] = rocketL[4] + rocketSpeed * dt
        rocketL[6] = rocketL[6] + rocketSpeed * dt
        rocketL[8] = rocketL[8] + rocketSpeed * dt
    end

    if love.keyboard.isDown("o") and rocketR[6] > 0 then 
        rocketR[2] = rocketR[2] - rocketSpeed * dt
        rocketR[4] = rocketR[4] - rocketSpeed * dt
        rocketR[6] = rocketR[6] - rocketSpeed * dt
        rocketR[8] = rocketR[8] - rocketSpeed * dt
    end

    if love.keyboard.isDown("l") and rocketR[2] < world.height then 
        rocketR[2] = rocketR[2] + rocketSpeed * dt
        rocketR[4] = rocketR[4] + rocketSpeed * dt
        rocketR[6] = rocketR[6] + rocketSpeed * dt
        rocketR[8] = rocketR[8] + rocketSpeed * dt
    end
    return rocketR[2], rocketR[4], rocketR[6], rocketR[8], rocketL[2], rocketL[4], rocketL[6], rocketL[8]
end


function functions.ballBounce(ball, rocketL, rocketR)
    local ballY = ball.center[2]
    local ballX = ball.center[1]
    local LrL = rocketL[5]
    local LrR = rocketL[1]
    local LrT = rocketL[2]
    local LrB = rocketL[4]

    if ball.center[2] >= rocketL[4] and ball.center[2] <= rocketL[2] then
        if ball.center[1]  - ball.radius <= rocketL[1] then
            ball.center[1] = LrR + ball.radius
            ball.velocity[1] = -ball.velocity[1]
        end

    end 

    if ball.center[2] >= rocketR[4] and ball.center[2] <= rocketR[2] then
        if ball.center[1]  + ball.radius >= rocketR[1] then
            ball.velocity[1] = -ball.velocity[1]
        end

    end

     if
         LrL <= ballX - ball.radius and ballX - ball.radius <= LrR
             and
         LrT <= ballY and ballY <= LrB
             then

         ball.velocity[2] = -ball.velocity[2]
     end


    


    
end

function functions.countPoints(ball, world, score)
    if ball.center[1] - ball.radius == 0 then 
        score[2] = score[2] + 1
        ball.center[1] = 400
        ball.center[2] = 300
    elseif ball.center[1] + ball.radius == world.width then
        score[1] = score[1] + 1
        ball.center[1] = 400
        ball.center[2] = 300
    end





    -- zrobi?? ??eby pi??ka odbija??a si?? od paletek, sprawdza?? czy jest szansa na zderzenie przez sprawdzenie koordynat??w.
end
    


return functions