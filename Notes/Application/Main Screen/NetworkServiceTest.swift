
import Foundation
import Glance_iOS

final class CoBrowse: GlanceVisitorDelegate {
    private let glanceId: Int32 = 15687
    public var connectionState = "none"

    init() { }

    /// start carrying out the screen sharing process
    func startSession() {
        // per documentation, need to use main thread to call all the Glance's interfaces
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.initializeVistor()
        }
    }

    private func initializeVistor() {
        GlanceVisitor.add(self)
        GlanceVisitor.`init`(glanceId, token: "", name: "", email: "", phone: "")
    }

    func glanceVisitorEvent(_ event: GlanceEvent) {
        switch event.code {
        case EventVisitorInitialized:
            DispatchQueue.main.async {
                GlanceVisitor.startSession()
            }
        case EventSessionEnded:
            connectionState = "disconnected"
        case EventConnectedToSession:
            connectionState = "connected"
        case EventStartSessionFailed:
            connectionState = "failed"
        default:
            switch event.type {
            case EventError, EventAssertFail :
                connectionState = "fail"
            case EventWarning:
                break
            default:
                break
            }
        }
    }
}

