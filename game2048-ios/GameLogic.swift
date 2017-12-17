protocol GameLogic {
    func nextStep()
    func move(to direction: Direction)
    func reset()
}

class GameLogicImpl {
    
    private let gameState: GameState
    private let board: Board
    private let boardLogic: BoardLogic
    private let gameEventCenter: GameEventCenter
    
    init(
        gameState: GameState,
        board: Board,
        boardLogic: BoardLogic,
        gameEventCenter: GameEventCenter)
    {
        self.gameState = gameState
        self.board = board
        self.boardLogic = boardLogic
        self.gameEventCenter = gameEventCenter
    }
}

extension GameLogicImpl: GameLogic {
    func nextStep() {
        boardLogic.fillRandomTile(board: board)
        gameEventCenter.send(event: .didBoardChange(board: board))
    }
    
    func move(to direction: Direction) {
        boardLogic.moveTiles(to: direction, board: board)
        gameState.score = board.points
        
        gameEventCenter.send(event: .didBoardChange(board: board))
        gameEventCenter.send(event: .didStateChange(state: gameState))
    }
    
    func reset() {
        gameState.reset()
        board.reset()
        
        gameEventCenter.send(event: .didBoardChange(board: board))
        gameEventCenter.send(event: .didStateChange(state: gameState))
    }
}
