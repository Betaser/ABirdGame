import Raylib
// You can't have a main.swift and a static func main entrypoint.

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Raylib.initWindow(screenWidth, screenHeight, "A Bird Game")
Raylib.setTargetFPS(60)
let randomColors: [Color] = [.blue, .red, .green, .yellow, .darkBlue, .maroon, .magenta]
var ballColor: Color = .maroon
var ballPosition = Vector2(x: -100, y: -100)
var prevBallPosition: Vector2
while Raylib.windowShouldClose == false {
    prevBallPosition = ballPosition
    ballPosition = Raylib.getMousePosition()

    if Raylib.isMouseButtonDown(.left) {
        ballColor = randomColors.randomElement() ?? .black
    }

    let size = max(abs(ballPosition.x - prevBallPosition.x) + abs(ballPosition.y - prevBallPosition.y), 10)

    Raylib.beginDrawing()
    Raylib.clearBackground(.rayWhite)
    Raylib.drawText("Hello, World!", 425, 25, 25, .darkGray)
    Raylib.drawCircleV(ballPosition, size, ballColor)
    Raylib.drawFPS(10, 10)
    Raylib.endDrawing()
}

Raylib.closeWindow()
