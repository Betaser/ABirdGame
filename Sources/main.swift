import Raylib
// You can't have a main.swift and a static func main entrypoint.

// Let's just say for now we do 
let screenWidth: Int32 = 1280
let screenHeight: Int32 = 720

Raylib.initWindow(screenWidth, screenHeight, "A Bird Game")
Raylib.setTargetFPS(60)

let gameplayState = GameplayState(prevState: NilState.instance)
let menuState = MenuState(prevState: NilState.instance)
let mainStateMngr = StateManager(nilState: NilState.instance)
[
    gameplayState,
    menuState
].forEach(mainStateMngr.addState)

mainStateMngr.setState(to: gameplayState)

// MAIN LOOP
while Raylib.windowShouldClose == false {
    // RENDER LOOP
    Raylib.beginDrawing()

    // Yeah, render code is just in update.
    mainStateMngr.currState.update()

    Raylib.drawFPS(10, 10)
    Raylib.endDrawing()
}

Raylib.closeWindow()
