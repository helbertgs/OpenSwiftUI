import Foundation

public struct _Graph {
    var storage : Storage

    init(_ storage: Storage) {
        self.storage = storage
    }
}

extension _Graph {
    enum Storage {
        case empty
        case scene(SceneGraph)
        case view(ViewGraph)
    }
}
