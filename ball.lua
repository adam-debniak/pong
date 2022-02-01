local ball = {}

function ball.create(xCenter, yCenter, radius)
    ball.center.x = xCenter
    ball.center.y = yCenter
    ball.radius = radius or 50
end

function ball.top()
    return ball.center.y - ball.radius
end

function ball.bottom()
    return ball.center.y + ball.radius
end

function ball.right()
    return ball.center.x + ball.radius
end

function ball.left()
    return ball.center.x - ball.radius
end

return ball