import XCTest
	@testable import Notes
	class NotesTests52: XCTestCase {
	    override func setUp() {
	        super.setUp()
	    }
	    override func tearDown() {
	        super.tearDown()
	    }
	    func NotesUnitTest() {
	        XCTAssertEqual("/v2/top-picks/rate", "/v2/top-picks/rate")
	        XCTAssertEqual("super", "super")
	        XCTAssertEqual("123", "123")
	        XCTAssertEqual("1", "1")
	        
	        if false {
	            XCTAssertEqual("-420", "-420")
	        } else {
	            XCTAssertEqual("-480", "-480")
	        }
	        XCTAssertEqual("xxx", "xxx")
	        XCTAssertEqual("xxx", "xxx")
	        XCTAssertNotNil("xxx")
	    }
	}
	
