-- wykonuje sie raz na poczatku programu
function love.load()
    ballCenter = {400,300}
    ballRadius = 50
    ballColor = {0.5,0.5,0.5}
    ballVelocity = {100,110}
    redHue   = 0.1
    greenHue = 0.3
    blueHue  = 0.2
    
    -- ballVelocity = {12,13}
    -- usage: ballVelocity[1] znaczy 12 ...
    --
end

-- potem w petli wykonuja sie 2 nastepujace funkcje:
---- 1) update
function love.update(dt)
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

    if 0 <= ballColor[1] and ballColor[1] <= 1 then
        ballColor[1] = ballColor[1] + redHue*dt
    elseif ballColor[1] > 1 then
        ballColor[1] = 1
        redHue = -redHue
    else
        ballColor[1] = 0
        redHue = -redHue
    end

    if 0 <= ballColor[2] and ballColor[2] <= 1 then
        ballColor[2] = ballColor[2] + greenHue*dt
    elseif ballColor[2] > 1 then
        ballColor[2] = 1
        greenHue = -greenHue
    else
        ballColor[2] = 0
        greenHue = -greenHue
    end

    if 0 <= ballColor[3] and ballColor[3] <= 1 then
        ballColor[3] = ballColor[3] + blueHue*dt
    elseif ballColor[3] > 1 then
        ballColor[3] = 1
        blueHue = -blueHue
    else
        ballColor[3] = 0
        blueHue = -blueHue
    end
    


end

---- 2) dRedaw
function love.draw()
    love.graphics.setColor(ballColor[1],ballColor[2],ballColor[3])
    love.graphics.circle(
        "fill",
        ballCenter[1],
        ballCenter[2],
        ballRadius
    
    )
    love.graphics.setColor(1,1,1)


end







-- konczy sie petla programu/gry


-- praca domowa zrobic zeby kulka odbijala sie we wszystkie strony nie tylko poziomo jak logo dvd