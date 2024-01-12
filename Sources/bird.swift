import Raylib

public class Bird {
    public static let blah = Bird()

    private init() {}
    deinit {
        print("bird deinit")
    }

    var pos = Vector2.zero
    var vel = Vector2.zero
    var initialVel = Vector2.zero
    var gravEnabled = false
    
    init(pos: Vector2, vel: Vector2) {
        self.pos = pos
        self.vel = vel
        initialVel = vel
        gravEnabled = false
    }

    func update() {
        if Raylib.isKeyPressed(.letterG) {
            gravEnabled = !gravEnabled
        }

        vel = if gravEnabled { vel + Vector2(x: 0, y: 0.5) } else { initialVel }

        if pos.y + vel.y >= Float(screenHeight + 20) {
            // Switch game state to menu state. This will reinit everything, so call setState before this other stuff.
            mainStateMngr.setState(to: menuState)

            let plays: UInt32 = if let str = menuState.singleStore["gamePlays"] {
                UInt32(str as! String)!
            } else {
                UInt32(0)
            }
            menuState.msg = "Velocity when hit ground: \(vel)\nGame plays: \(plays)"
            menuState.singleStore["gamePlays"] = String(plays + 1) as Storable
            print(menuState.store)

            let calcMenuText: (MenuState) -> RenderInfo = 
            { state in try! RenderInfo.horzCenteredText(
                data: state.msg,
                posY: 40,
                size: 40,
                color: .black) }
            menuState.renderInfos["statsText"] = calcMenuText
            return
        }
    }

    func updatePhysics() {
        self.pos = self.pos + self.vel
    }
}
