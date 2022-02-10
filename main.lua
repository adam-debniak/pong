local f = require("functions")
-- local newBall = require("ball")

local ball = {}
ball.radius = 25
ball.color = {0.5, 0.5, 0.5}
ball.velocity = {250, 250}

local score = {
    [1] = 0,
    [2] = 0
}

local world = {}

local rocketL = {
    50,400,
    50,250,
    25,250,
    25,400
}
local rocketR = {
    750,400,
    750,250,
    775,250,
    775,400
}
local rocketSpeed = 250

function love.load()
    -- newBall.create(world.width/2, world.height/2)

    world.width, world.height = love.graphics.getDimensions()
    ball.center = {world.width/2, world.height/2}
end

function love.update(dt)
    f.paddleMovement(rocketL, rocketR, rocketSpeed, dt, world)
    f.ballMovement(ball, dt, world)
    f.ballBounce(ball, rocketL, rocketR)
    f.countPoints(ball, world, score)
end

function love.draw()
    love.graphics.setColor(
        ball.color[1],     
        ball.color[2],
        ball.color[3])
    love.graphics.circle(
        "fill",
        ball.center[1],
        ball.center[2],
        ball.radius
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
    love.graphics.print("use w,s", 50, 550 )
    love.graphics.print("use o,l", 715, 550 )
    love.graphics.print(score[1] .. " : " .. score[2] , 380, 50 ) --tu powinny być zmienne zamiast 0

end