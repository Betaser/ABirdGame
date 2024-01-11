protocol GameState {

    func update()
    func reinit(prevState: GameState)
    var singleStore: [String : Storable] { get set }
    // Maybe there should be more to this? But not for now at least.

}

typealias Storable = AnyObject

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
    var store: [String : Storable] = [:]
    
    var singleStore: [String : Storable] {
        get { 
            print("No meaningful storage.")
            return store 
        }
        set {
            _ = newValue
        }
    }

    func update() {
        print("No meaningful state")
    }
    func reinit(prevState: GameState) {}
}
