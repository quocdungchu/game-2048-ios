import Foundation

class Board {
    enum Constants {
        static let width = 4
        static let height = 4
    }
    
    enum Tile {
        case empty
        case filled(point: Int)
    }
    
    static var defaultTiles: [Tile] {
        return [Tile](repeatElement(.empty, count: Constants.width * Constants.height))
    }
    
    private var tiles = Board.defaultTiles
    
    var isFilled: Bool {
        return tiles.first(where: { $0 == .empty }) == nil
    }
    
    var emptyTileIndexes: [Int] {
        return tiles.enumerated()
            .filter { _, tile in tile == .empty }
            .map { index, _ in index }
    }
    
    var randomEmptyIndex: Int? {
        let emptyTileIndexes = self.emptyTileIndexes
        let randomIndex = Int(arc4random()) % emptyTileIndexes.count
        return emptyTileIndexes[randomIndex]
    }
    
    var points: Int {
        return tiles.reduce(0) { cumulated, tile in
            switch tile {
            case .empty:
                return cumulated
                
            case .filled(let point):
                return cumulated + point
            }
        }
    }
    
    subscript(index: Int) -> Tile {
        get {
            return tiles[index]
        }
        
        set(newValue) {
            tiles[index] = newValue
        }
    }
    
    func reset() {
        tiles = Board.defaultTiles
    }
}

func == (lhs: Board.Tile, rhs: Board.Tile) -> Bool {
    switch (lhs, rhs) {
    case (.empty, .empty):
        return true
        
    case (.filled(let leftPoint), .filled(let rightPoint)):
        return leftPoint == rightPoint
        
    default:
        return false
    }
}
