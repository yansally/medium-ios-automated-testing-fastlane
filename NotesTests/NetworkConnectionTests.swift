//
//  NetworkConnectionTests.swift
//  NotesTests
//
//  Created by Yan, Sally on 9/14/20.
//  Copyright © 2020 Coletiv. All rights reserved.
//

import XCTest
import Glance_iOS
@testable import Notes

class NetworkConnectionTests: XCTestCase {
    private var coBrowse: CoBrowse!
    
    override func setUp() {
        coBrowse = CoBrowse()
    }

    override func tearDown() {
    }

    func testScreenSharingStarted() {
        let event = GlanceEvent(code: EventConnectedToSession,
                                type: EventTypeNone,
                                message: "testConnectedStarted",
                                properties: ["key": "3355"])!
        coBrowse.glanceVisitorEvent(event)
        XCTAssert(coBrowse.connectionState == "connected")
    }
    
    func testScreenSharingEnded() {
        let event = GlanceEvent(code: EventSessionEnded,
                                type: EventTypeNone,
                                message: "testConnectedEnded",
                                properties: ["key": "3355"])!
        coBrowse.glanceVisitorEvent(event)
         XCTAssert(coBrowse.connectionState == "disconnected")
    }
    
    func testConnectToSessionFailed() {
        let event = GlanceEvent(code: EventStartSessionFailed,
                                type: EventTypeNone,
                                message: "testConnectedEnded",
                                properties: ["key": "3355"])!
        coBrowse.glanceVisitorEvent(event)
         XCTAssert(coBrowse.connectionState == "failed")
    }

}
