import Raylib

public class MenuState: GameState {
    var msg = "Menu state"
    // The only thing you don't reinit.
    var store: [String : Storable] = [:]

    // When you reinit, you might want to alter the renderInfo here. 
    //If so, know that your menustate argument in the closure you provide will be up to date.
    // Key of string so it can be referenced back properly.
    var renderInfos: [String : (MenuState) -> RenderInfo] = [:]

    init(prevState: GameState) {
        reinit(prevState: prevState)
    }

    var singleStore: [String : Storable] {
        get { return store }
        set {
            store = newValue
        }
    }

    func update() {
        Raylib.clearBackground(.white)

        if Raylib.isMouseButtonDown(.left) {
            mainStateMngr.setState(to: gameplayState)
            return
        }

        for (_, renderInfo) in renderInfos {
            switch renderInfo(self) {
            case let .text(data, posX, posY, size, color):
                Raylib.drawText(data, posX, posY, size, color)
            }
        }

        if Raylib.isKeyPressed(.letterR) {
            reinit(prevState: self)
            print(msg)
        }
    }

    func reinit(prevState state: GameState) {
        switch state {
        case is GameplayState:
            print("from gameplaystate")
        default: msg = "Menu state"
        }
        renderInfos = [:]
    }
}
