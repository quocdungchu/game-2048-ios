import Foundation

class Board {
    enum Constants {
        static let numberOfRangs = 4
        static let numberOfColonnes = 4
    }
    
    struct Position {
        let rang: Int
        let colonne: Int
        
        var index: Int {
            return rang * Constants.numberOfRangs + colonne
        }
        
        init(_ rang: Int, _ colonne: Int) {
            self.rang = rang
            self.colonne = colonne
        }
        
        init(index: Int) {
            self.init(
                index / Constants.numberOfRangs,
                index % Constants.numberOfRangs
            )
        }
    }
    
    enum Tile {
        case empty
        case filled(point: Int)
    }
    
    static var defaultTiles: [Tile] {
        return [Tile](repeatElement(.empty, count: Int(Constants.numberOfRangs * Constants.numberOfColonnes)))
    }
    
    private var tiles = Board.defaultTiles
    
    var isFilled: Bool {
        return tiles.first(where: { $0 == .empty }) == nil
    }
    
    var emptyPositions: [Position] {
        return tiles.enumerated()
            .filter { _, tile in tile == .empty }
            .map { index, _ in Position(index: index) }
    }
    
    var randomEmptyPosition: Position? {
        let positions = self.emptyPositions
        let randomIndex = Int(arc4random()) % positions.count
        return positions[randomIndex]
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
    
    subscript(position: Position) -> Tile {
        get {
            return tiles[position.index]
        }
        
        set(newValue) {
            tiles[position.index] = newValue
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
