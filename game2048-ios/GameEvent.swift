enum GameEvent {
    case didBoardChange(board: Board)
    case didStateChange(state: GameState)
}

protocol GameEventObserver {
    func didChange(board: Board)
    func didChange(gameState: GameState)
}

protocol GameEventCenter {
    func register(observer: GameEventObserver)
    func unregister(observer: GameEventObserver)
    
    func send(event: GameEvent)
}

class GameEventCenterImpl: GameEventCenter {
    func register(observer: GameEventObserver) {
        
    }
    
    func unregister(observer: GameEventObserver) {
        
    }
    
    func send(event: GameEvent) {
        
    }
}
