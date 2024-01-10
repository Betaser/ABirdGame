protocol GameState {

    func update()
    func reinit(prevState: GameState)
    // Maybe there should be more to this? But not for now at least.
    
}

public class NilState: GameState {
    public static let instance = NilState()

    func update() {
        print("No meaningful state")
    }
    func reinit(prevState: GameState) {}
}
