import Raylib

public class GameplayState: GameState {
    static let randomColors: [Color] = [.blue, .red, .green, .yellow, .darkBlue, .maroon, .magenta]

    var playerColor: Color = .black
    var prevPos = Vector2.zero
    var player = Bird.blah

    init(prevState: GameState) {
        reinit(prevState: prevState)
    }

    func update() {
        print(player.pos)
        prevPos = player.pos
        player.updatePhysics()

        if Raylib.isMouseButtonDown(.left) {
            player.pos = Raylib.getMousePosition()
            playerColor = GameplayState.randomColors.randomElement() ?? .black
        }

        let playerSize = max((abs(player.pos.x - prevPos.x) + abs(player.pos.y - prevPos.y) / 10.0), 
                             10)

        // Render stuff for now just is here.
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
