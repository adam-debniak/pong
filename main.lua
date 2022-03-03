local f = require("functions")
-- local newBall = require("ball")

local ball = {}
ball.radius = 25
ball.color = { 0.5, 0.5, 0.5 }
ball.velocity = { 250, 250 }

local score = {
	[1] = 0,
	[2] = 0,
}

local world = {}

local rocketL = {
	50,
	400,
	50,
	250,
	25,
	250,
	25,
	400,
}
local rocketR = {
	750,
	400,
	750,
	250,
	775,
	250,
	775,
	400,
}
local rocketSpeed = 250

local winningScore = 1; -- ile potrzeba punktów aby wygrać czyli kiedy gra się wyłączy
local gameEnded = false -- utworzenie zmiennej której wartość logiczna będzie zmieniana przez if-y aby przekazać programowi informacje kiedy gra się zakończy lub kiedy trwa

local amountOfTimeToShowEndingScreen = 5; -- ile sekund będzie się pokazywał ekran końcowy
local timeSinceGameEnded = 0; -- czas w sekundach który zaczyna się naliczać po zakończeniu gry

function love.load()
	-- newBall.create(world.width/2, world.height/2)

	world.width, world.height = love.graphics.getDimensions()
	ball.center = { world.width / 2, world.height / 2 }
end

function love.update(dt)
	if not gameEnded then --jeśli gra się nie zakpńczyła to ... 
		if score[1] == winningScore or score[2] == winningScore then -- jeśli wynik jedngo z graczy osiągnie wartość uznawaną za zwycięstwo to gra się kończy
			-- love.event.quit()
			gameEnded = true -- zmiana wartości zmiennej game ended na true ponieważ gra się zakończyła po zdobyciu wymaganej liczby punktów
		else -- else czyli jeśli gra DALEJ działa to wtedy wszystkie funkcje dalej się wykonują dopóki gameEnded nie zmieni wartości na true
			f.paddleMovement(rocketL, rocketR, rocketSpeed, dt, world)
			f.ballMovement(ball, dt, world)
			f.ballBounce(ball, rocketL, rocketR)
			f.countPoints(ball, world, score)
		end

		if love.keyboard.isDown("q") then -- sprawdza czy naciśnięto przycisk q jeśli tak to gra się wyłącza i nie pkazuje ekranu końcowego po prostu alt + f4
			love.event.quit()
		end
    else
        timeSinceGameEnded = timeSinceGameEnded + dt -- naliczanie sekund po zaończeniu gry 
	end
end

function love.draw()
	if not gameEnded then -- jeśli gra się jeszcze nie skończył to program dalej rysuje obiekty takie jak paletki i piłka
		love.graphics.setColor(ball.color[1], ball.color[2], ball.color[3])
		love.graphics.circle("fill", ball.center[1], ball.center[2], ball.radius)
		love.graphics.setColor(1, 1, 1)
		love.graphics.polygon("fill", rocketL)
		love.graphics.polygon("fill", rocketR)
		love.graphics.print("press q to exit", 50, 50)
		love.graphics.print("use w,s", 50, 550)
		love.graphics.print("use o,l", 715, 550)
		love.graphics.print(score[1] .. " : " .. score[2], 380, 50) --tu powinny być zmienne zamiast 0
    else
        local message = "Time since game ended: " .. timeSinceGameEnded -- wyświetla komunikat który pokazuje w sekundach ile czasu minęło od zakończenia gry i rozpoczęcia ekranu końcowego
		if score[1] == winningScore then
			love.graphics.print("P1 WINS!", 350, 300)
		end
		if score[2] == winningScore then
			love.graphics.print("P2 WINS!", 350, 300)
			
		end

        love.graphics.print(message, 350, 100)
        -- Some functions in the string library are quite simple: string.len(s) returns the length of a string s.
	end
end
