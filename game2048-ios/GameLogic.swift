protocol GameLogic {
    func nextStep()
    func move(to direction: Direction)
    func reset()
}

class GameLogicImpl {
    
    private let gameState: GameState
    private let board: Board
    private let boardLogic: BoardLogic
    private let eventCenter: EventCenter
    
    init(
        gameState: GameState,
        board: Board,
        boardLogic: BoardLogic,
        eventCenter: EventCenter)
    {
        self.gameState = gameState
        self.board = board
        self.boardLogic = boardLogic
        self.eventCenter = eventCenter
    }
}

extension GameLogicImpl: GameLogic {
    func nextStep() {
        boardLogic.fillRandomTile(board: board)
    }
    
    func move(to direction: Direction) {
        boardLogic.moveTiles(to: direction, board: board)
        gameState.score = board.points
    }
    
    func reset() {
        gameState.reset()
        board.reset()
    }
}
