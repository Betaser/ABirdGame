import Raylib

public class MenuState: GameState {
    var msg = "Menu state"

    init(prevState: GameState) {
        reinit(prevState: prevState)
    }

    func update() {
        Raylib.clearBackground(.white)
        Raylib.drawText(msg, 425, 40, 40, .black)

        if Raylib.isMouseButtonDown(.left) {
            mainStateMngr.setState(to: gameplayState)
            return
        }
    }

    func reinit(prevState state: GameState) {
        switch state {
        case is GameState:
            print("from gamestate")
        default: msg = "Menu state"
        }
    }
}
