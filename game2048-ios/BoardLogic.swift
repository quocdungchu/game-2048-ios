import Foundation

protocol BoardLogic {
    func fillRandomTile(board: Board)
    func moveTiles(to direction: Direction, board: Board)
}

class BoardLogicImpl {
    private func moveTilesToLeft(board: Board) {
        
    }
    
    private func moveTilesToRight(board: Board) {
        
    }
    
    private func moveTilesToUp(board: Board) {

    }
    
    private func moveTilesToDown(board: Board) {

    }    
}

extension BoardLogicImpl: BoardLogic {
    func fillRandomTile(board: Board) {
        if let position = board.randomEmptyPosition {
            board[position] = .filled(point: 2)
        }
    }
    
    func moveTiles(to direction: Direction, board: Board) {
        switch direction {
        case .down:
            moveTilesToDown(board: board)

        case .up:
            moveTilesToUp(board: board)

        case .left:
            moveTilesToLeft(board: board)
            
        case .right:
            moveTilesToRight(board: board)
        }
    }
}
