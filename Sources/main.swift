import Raylib
// You can't have a main.swift and a static func main entrypoint.

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Raylib.initWindow(screenWidth, screenHeight, "A Bird Game")
Raylib.setTargetFPS(60)

var state = GameplayState(prevState: NilState.instance)

// MAIN LOOP
while Raylib.windowShouldClose == false {
    // RENDER LOOP
    Raylib.beginDrawing()

    // Yeah, render code is just in update.
    state.update()

    Raylib.drawFPS(10, 10)
    Raylib.endDrawing()
}

Raylib.closeWindow()
