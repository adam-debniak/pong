local f = require("functions")

local ball = {}
ball.radius = 50
ball.color = {0.5, 0.5, 0.5}
ball.velocity = {100, 110}

local world = {}

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

local rockets = {}
rockets.left = {}
rocket.edges = {}


rockets.right = {}


local rocketSpeed = 400

function love.load()
    world.width, world.height = love.graphics.getDimensions()
    ball.center = {world.width/2, world.height/2}
end

function love.update(dt)
    f.paddleMovement(rocketL, rocketR, rocketSpeed, dt, world)
    -- rockets.dealWithMovementDERP(dt, world)
    f.ballMovement(ball, dt, world)
    f.ballBounce(ball, rocketL, rocketR, world, dt)
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

end