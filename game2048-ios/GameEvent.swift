enum GameEvent {
    case didBoardChange(board: Board)
    case didStateChange(state: GameState)
}

protocol GameEventReceiver: class {
    func onReceive(event: GameEvent)
}

protocol GameEventCenter {
    func register(receiver: GameEventReceiver)
    func unregister(receiver: GameEventReceiver)
    func send(event: GameEvent)
}

class GameEventCenterImpl: GameEventCenter {
    
    private var receivers = [GameEventReceiver]()
    
    func register(receiver: GameEventReceiver) {
        receivers.append(receiver)
    }
    
    func unregister(receiver: GameEventReceiver) {
        if let index = receivers.index(where: { receiver === $0 }) {
            receivers.remove(at: index)
        }
    }
    
    func send(event: GameEvent) {
        receivers.forEach {
            $0.onReceive(event: event)
        }
    }
}
