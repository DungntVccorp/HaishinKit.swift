import Foundation
import XCTest

@testable import lf

final class TSTests: XCTestCase {
    static let dataWithMetadata:[UInt8] = [71, 64, 17, 16, 0, 66, 240, 37, 0, 1, 193, 0, 0, 0, 1, 255, 0, 1, 252, 128, 20, 72, 18, 1, 6, 70, 70, 109, 112, 101, 103, 9, 83, 101, 114, 118, 105, 99, 101, 48, 49, 167, 121, 160, 3, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255]

    func testTSPacket() {
        let packetWithMetadata:TSPacket = TSPacket(bytes: TSTests.dataWithMetadata)!
        XCTAssertEqual(packetWithMetadata.syncByte, TSPacket.defaultSyncByte)
        XCTAssertEqual(packetWithMetadata.PID, 17)
        XCTAssertEqual(packetWithMetadata.bytes, TSTests.dataWithMetadata)
    }

    func testTSReader() {
        do {
            let bundle:NSBundle = NSBundle(forClass: self.dynamicType)
            let url:NSURL = NSURL(fileURLWithPath: bundle.pathForResource("SampleVideo_360x240_5mb/000", ofType: "ts")!)
            let reader:TSReader = try TSReader(url: url)
            reader.read()
            XCTAssertEqual(reader.numberOfPackets, 5984)
        } catch {
            
        }
    }
}