import Raylib

public class Bird {
    public static let blah = Bird()

    private init() {}
    deinit {
        print("bird deinit")
    }

    var pos = Vector2(x: 0, y: 0)
    var vel = Vector2(x: 0, y: 0)
    var gravEnabled = false
    

    init(pos: Vector2, vel: Vector2) {
        self.pos = pos
        self.vel = vel
        gravEnabled = false
    }

    func update() {
        if Raylib.isKeyDown(.letterG) {
            gravEnabled = !gravEnabled
        }

        if gravEnabled {
            vel = vel + Vector2(x: 0, y: 0.5)
        }

        if pos.y + vel.y >= Float(screenHeight + 20) {
            // Switch game state to menu state.
            menuState.msg = "Velocity when hit ground: \(vel)"
            mainStateMngr.setState(to: menuState)
            return
            // vel = Vector2(x: vel.x, y: -vel.y) // Bouncing, fun
        }
    }

    func updatePhysics() {
        self.pos = self.pos + self.vel
    }
}
