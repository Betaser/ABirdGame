protocol GameState {

    func update()
    func reinit(prevState: GameState)
    // Maybe there should be more to this? But not for now at least.

}

public class StateManager {
    private var states: [GameState] = []
    let nilState: GameState
    private(set) var currState: GameState

    init(nilState: GameState) {
        self.nilState = nilState
        currState = nilState
    }

    func addState(_ state: GameState) {
        states.append(state)
    }

    func setState(to: GameState) {
        to.reinit(prevState: currState)
        currState = to
    }
}

public class NilState: GameState {
    public static let instance = NilState()

    func update() {
        print("No meaningful state")
    }
    func reinit(prevState: GameState) {}
}
