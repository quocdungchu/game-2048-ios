enum BoardEvent {
    case didTilesReset
    case didTileChange(from: Board.Tile, to: Board.Tile, at: Board.Position)
}
