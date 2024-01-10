import Raylib
// You can't have a main.swift and a static func main entrypoint.

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Raylib.initWindow(screenWidth, screenHeight, "A Bird Game")
Raylib.setTargetFPS(60)
let randomColors: [Color] = [.blue, .red, .green, .yellow, .darkBlue, .maroon, .magenta]
var ballColor: Color = .maroon
var prevBallPosition: Vector2

class Bird {
    var pos = Vector2(x: 0, y: 0)
    var vel = Vector2(x: 0, y: 0)
    init(pos: Vector2, vel: Vector2) {
        self.pos = pos
        self.vel = vel
    }
    func updatePhysics() {
        self.pos = self.pos + self.vel
    }
}

var player = Bird(
    pos: Vector2(x: 100, y: 100),
    vel: Vector2(x: 0.1, y: 0.1)
)

// MAIN LOOP
while Raylib.windowShouldClose == false {
    // prevBallPosition = ballPosition
    prevBallPosition = player.pos

    player.updatePhysics()

    // FOR DEBUGGING REASONS
    if Raylib.isMouseButtonDown(.left) {
        player.pos = Raylib.getMousePosition()
    }

    if Raylib.isMouseButtonDown(.left) {
        ballColor = randomColors.randomElement() ?? .black
    }

    let size = max(abs(player.pos.x - prevBallPosition.x) + abs(player.pos.y - prevBallPosition.y), 10)

    // RENDER LOOP
    Raylib.beginDrawing()
    Raylib.clearBackground(.rayWhite)
    Raylib.drawText("Hello, World!", 425, 25, 25, .darkGray)
    Raylib.drawCircleV(player.pos, size, ballColor)
    Raylib.drawFPS(10, 10)
    Raylib.endDrawing()
}

Raylib.closeWindow()
