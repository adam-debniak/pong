local rockets = {
    speed = 400,
    size = {},
    left = {
        edges = {
            U = 1,
            D = 1,
            R = 1,
            L = 1
        },
        draw = function()
            -- tutaj robisz faktyzcne rysowanie takie
            -- na jakie pozwala love
        end
    },
    right = {},
}

rockets.left.draw()

local rockets_old = {
    speed = 400,
    size = {
        height = 100,
        width = 20
    },
    left = {
        center = {
            x = 20,
            y = 300
        },
        edges = {
            x = 10,
            y = 250,

            x2 = 30, 
            y2 = 250,

            x3 = 30,
            y3 = 350,

            x4 = 10,
            y4 = 350
        }
    },
    right = {
        center = {
            x = 800-20,
            y = 300
        }
        edges = {
            x1 = 800-30
            y1 = 250

            x2 = 800-10
            y2 = 250
            
            x3 = 800-30
            y3 = 350

            x4 = 800-10
            y4 = 350
        }
    }

    draw = function()
        local A = {
            left.center.x - width/2
            left.center.y + height/2
        }
        local B = {
            left.center.x + width/2
            left.center.y + height/2
        }
        local C = {
            left.center.x + width/2
            left.center.y + height/2
        local D = {
            left.center.x - width/2
            left.center.y + height/2
        }

        love.graphics.polygon(
            -- nie wiem jak odnieść się do wartości zapisanych w rockets

        )
    end
}






return rockets_old