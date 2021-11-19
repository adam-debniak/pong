local f = require("functions")

-- wykonuje sie raz na poczatku programu
function love.load()
    ballCenter = {400,300}
    ballRadius = 50
    ballColor = {0.5,0.5,0.5}
    ballVelocity = {100,110}
    redHue   = 0.1
    greenHue = 0.3
    blueHue  = 0.2
    rocketL = {
        50,500,
        50,150,
        25,150,
        25,500
    }

    rocketR = {
        750,500,
        750,150,
        775,150,
        775,500
    }

    -- dodaj cos w stylu rocketSpeed

    -- rocketR[1]  ==  750
    -- rocketR[2]  ==  500
    -- if love.keyboard.isDown('w') then
        -- rocketR[1] == rocketR[1] + 2
    -- end
    -- wewnatrz update


    -- ballVelocity = {12,13}
    -- usage: ballVelocity[1] znaczy 12 ...
    --
end

-- potem w petli wykonuja sie 2 nastepujace funkcje:
---- 1) update
function love.update(dt)
    ballCenter, ballVelocity = f.detectColision(ballCenter, ballVelocity, dt)
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
    
    love.graphics.polygon(
        "fill",
        rocketL
    )
    love.graphics.polygon(
        "fill",
        rocketR
    )
    

end