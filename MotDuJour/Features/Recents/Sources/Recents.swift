import Foundation
import Models

public enum RecentsAction {
    case didTapWord
    case didTapClearAll
}

public func reducer(value: inout [Language: [Word]], action: RecentsAction) {
    switch action {
    case .didTapWord:
        print("didTapWord")
    case .didTapClearAll:
        print("didTapClearAll")
    }
}
