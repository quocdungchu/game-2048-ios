import RxSwift

enum ScoreEvent {
    case didScoreReset
    case didScoreChange(point: Int)
}

protocol ScoreLogic {
    var didScoreEventChange: PublishSubject<ScoreEvent> { get }
}

class ScoreLogicImpl {
    let didScoreEventChange: PublishSubject<ScoreEvent>
    private let didBoardEventChange: PublishSubject<BoardEvent>
    
    private let bag = DisposeBag()
    
    init(
        didScoreEventChange: PublishSubject<ScoreEvent>,
        didBoardEventChange: PublishSubject<BoardEvent>)
    {
        self.didScoreEventChange = didScoreEventChange
        self.didBoardEventChange = didBoardEventChange
        
        setup()
    }
    
    private func setup() {
        didBoardEventChange.map { boardEvent -> Int? in
            switch boardEvent {
            case .didTileTransform(_, _, _, let newPoint):
                return newPoint
            default:
                return nil
            }
        }
        .filter { $0 != nil }
        .map { $0! }
        .subscribe(onNext: { [unowned self] point in
            self.didScoreEventChange.onNext(ScoreEvent.didScoreChange(point: point))
        })
        .disposed(by: bag)
    }
}

extension ScoreLogicImpl: ScoreLogic {
    
}

