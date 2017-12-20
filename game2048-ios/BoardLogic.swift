import Foundation

enum MovingRecord {
    case transition(from: Board.Position, to: Board.Position)
    case transform(at: Board.Position, newPoint: Int)
}

struct MovingResult {
    let board:  Board
    let records: [MovingRecord]
}

protocol BoardLogic {
    func fillRandomTile(board: Board) -> Board
    func moveTiles(to direction: Direction, board: Board) -> MovingResult
}

class BoardLogicImpl {
    
    private struct MovingTilesResult {
        let tiles: [Board.Tile]
        let records: [MovingRecord]
    }
    
    // TODO
    private func moveToFront(tiles: [Board.Tile]) -> MovingTilesResult {
        guard !tiles.isEmpty else {
            return MovingTilesResult(tiles: [], records: [])
        }
        
        for tile in tiles {
            
        }
        
        return MovingTilesResult(tiles: [], records: [])
    }
    
    // TODO
    private func moveToFront(index: Int, tiles: [Board.Tile]) -> MovingTilesResult {
        guard tiles.count > index, case .filled(let targetPoint) = tiles[index] else {
            return MovingTilesResult(tiles: [], records: [])
        }
        
        for i in (0..<index).reversed() {
            if case .filled(let point) = tiles[i] {
                if targetPoint == point {
                    
                } else {
                    
                }
                break
            }
        }
        
        return MovingTilesResult(tiles: [], records: [])
    }
    
    private func moveTilesToLeft(board: Board) -> MovingResult {
        return MovingResult(board: board, records: [])
    }
    
    private func moveTilesToRight(board: Board) -> MovingResult {
        return MovingResult(board: board, records: [])
    }
    
    private func moveTilesToUp(board: Board) -> MovingResult {
        return MovingResult(board: board, records: [])
    }
    
    private func moveTilesToDown(board: Board) -> MovingResult {
        return MovingResult(board: board, records: [])
    }
}

extension BoardLogicImpl: BoardLogic {
    func fillRandomTile(board: Board) -> Board {
        guard let position = board.randomEmptyPosition else {
            return board
        }
        var board = board
        let point = 2
        board[position] = .filled(point: point)
        return board
    }
    
    func moveTiles(to direction: Direction, board: Board) -> MovingResult {
        switch direction {
        case .down:
            return moveTilesToDown(board: board)

        case .up:
            return moveTilesToUp(board: board)

        case .left:
            return moveTilesToLeft(board: board)
            
        case .right:
            return moveTilesToRight(board: board)
        }
    }
}
