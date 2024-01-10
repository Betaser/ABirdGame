import Raylib

public class Bird {
    public static let blah = Bird()

    private init() {}

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
