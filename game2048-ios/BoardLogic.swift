import RxSwift
import Foundation

enum BoardEvent {
    case didTilesReset(board: Board)
    case didTileGenerate(board: Board, point: Int)
    case didTileMove(board: Board, from: Board.Position, to: Board.Position)
    case didTileTransform(board: Board, from: Board.Position, to: Board.Position, newPoint: Int)
}

protocol BoardLogic {
    var didEventSend: PublishSubject<BoardEvent> { get }
    func fillRandomTile()
    func moveTiles(to direction: Direction)
    func reset()
}

class BoardLogicImpl {
    
    let didEventSend = PublishSubject<BoardEvent>()
    private let board: Board
    
    init(board: Board) {
        self.board = board
    }
    
    private func moveTilesToLeft() {
        
    }
    
    private func moveTilesToRight() {
        
    }
    
    private func moveTilesToUp() {

    }
    
    private func moveTilesToDown() {

    }    
}

extension BoardLogicImpl: BoardLogic {
    func fillRandomTile() {
        if let position = board.randomEmptyPosition {
            let point = 2
            board[position] = .filled(point: point)
            didEventSend.onNext(.didTileGenerate(board: board, point: point))
        }
    }
    
    func moveTiles(to direction: Direction) {
        switch direction {
        case .down:
            moveTilesToDown()

        case .up:
            moveTilesToUp()

        case .left:
            moveTilesToLeft()
            
        case .right:
            moveTilesToRight()
        }
    }
    
    func reset() {
        board.reset()
        didEventSend.onNext(.didTilesReset(board: board))
    }
}
