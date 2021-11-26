local f = require("functions")

local ballCenter = {400,300}
local ballRadius = 50
local ballColor = {0.5,0.5,0.5}
local ballVelocity = {100,110}
local rocketL = {
    50,500,
    50,250,
    25,250,
    25,500
}
local rocketR = {
    750,500,
    750,250,
    775,250,
    775,500
}
local rocketSpeed = 400

function love.load()
end

function love.update(dt)
    f.paddleMovement(rocketL, rocketR, rocketSpeed, dt)
    f.ballMovement(ballCenter, ballRadius, ballVelocity, dt)
end

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