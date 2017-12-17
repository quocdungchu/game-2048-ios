enum Event {
    case didStateChange(state: GameState)
    case didTilesReset
    case didTileChange(from: Board.Tile, to: Board.Tile, at: Board.Position)
}

protocol EventReceiver: class {
    func onReceive(event: Event)
}

protocol EventCenter {
    func register(receiver: EventReceiver)
    func unregister(receiver: EventReceiver)
    func send(event: Event)
}

class EventCenterImpl: EventCenter {
    
    private var receivers = [EventReceiver]()
    
    func register(receiver: EventReceiver) {
        receivers.append(receiver)
    }
    
    func unregister(receiver: EventReceiver) {
        if let index = receivers.index(where: { receiver === $0 }) {
            receivers.remove(at: index)
        }
    }
    
    func send(event: Event) {
        receivers.forEach {
            $0.onReceive(event: event)
        }
    }
}
