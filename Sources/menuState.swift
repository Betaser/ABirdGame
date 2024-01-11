import Raylib

public class MenuState: GameState {
    var msg = "Menu state"

    init(prevState: GameState) {
        reinit(prevState: prevState)
    }

    func update() {
        Raylib.drawText(msg, 425, 40, 40, .black)
    }

    func reinit(prevState state: GameState) {
        switch state {
        case is GameState:
            print("from gamestate")
        default: msg = "Menu state"
        }
    }
}
