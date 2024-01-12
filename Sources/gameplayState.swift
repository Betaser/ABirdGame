import Raylib

public class GameplayState: GameState {
    static let randomColors: [Color] = [.blue, .red, .green, .yellow, .darkBlue, .maroon, .magenta]

    var playerColor: Color = .black
    var prevPos = Vector2.zero
    // We initialize bird in init, so blah is just some dumb representation of player.
    var player = Bird.blah

    init(prevState: GameState) {
        reinit(prevState: prevState)
    }
    deinit {
        print("no gameplay :(")
    }

    var singleStore: [String : Storable] {
        get {
            print("For now, gameplay doesn't need to use loading or anything from menustate.")
            return NilState.instance.store
        }
        set {
            _ = newValue
        }
    }

    func update() {
        prevPos = player.pos
        player.updatePhysics()

        // Debug stuff that shouldn't be organized into player.
        if Raylib.isMouseButtonDown(.left) {
            player.pos = Raylib.getMousePosition()
            playerColor = GameplayState.randomColors.randomElement() ?? .black
        }

        player.update()

        // Render stuff for now just is here.
        let playerSize = max((abs(player.pos.x - prevPos.x) + abs(player.pos.y - prevPos.y) / 10.0), 
                             10)

        Raylib.clearBackground(.rayWhite)
        Raylib.drawText("Tweet tweet!!", 425, 25, 25, .darkGray)
        Raylib.drawCircleV(player.pos, playerSize, playerColor)
    }

    func reinit(prevState _: GameState) {
        player = Bird(
            pos: Vector2(x: 100, y: 100),
            vel: Vector2(x: 0.1, y: 0.1)
        )
    }
}
