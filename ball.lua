local ball = {
    center = {400, 300}
    radius = 50
    velocity = {100, 110}
    -- to moze byc troche tricky
    -- zaprogramuj to wedle wlasnego pomyslu
    -- ale nie uzywaj w programiwe
    bounce = function (rockets, world)
        if center[1] - radius < edges.x1 and if center[2] < edges.x4 and center[2] > edges.x3 then
            velocity[1] = -velocity[1]
        end

        -- to jest jakis przyklad
        -- to neikoniecznie jset najlepszy pomysl
        -- najlepiej na kartce przemyslec i jakos oprogramowac
    end
}

return ball