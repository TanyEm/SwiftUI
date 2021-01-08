//
//  WoltTests.swift
//  WoltTests
//
//  Created by Tatiana Podlesnykh on 26.12.2020.
//

import XCTest
@testable import Wolt

class WoltLikeManagerTests: XCTestCase {
    
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Rewrite data document with an empty array
    private func EraseDataDocument() throws {
        let path = documentsDirectory().appendingPathComponent("Liks.plist")
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode([LikeModel]())
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            throw error
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try EraseDataDocument()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try EraseDataDocument()
    }

    func testAddLike() throws {
        let likeManager = LikeStatusManager()
        
        let restWithLike1 = LikeModel(id: "1", isLked: true)
        
        likeManager.appendLike(likeRest: restWithLike1)
        
        let gotLikes = likeManager.getLikes()
        
        XCTAssertEqual(gotLikes.count, 1)
        XCTAssertEqual(gotLikes[0].id, restWithLike1.id)
    }
    
    func testCheckIfAlreadyExists() throws {
        let likeManager = LikeStatusManager()
        
        let restWithLike1 = LikeModel(id: "1", isLked: true)
        let restWithLike2 = LikeModel(id: "1", isLked: true)
        
        likeManager.appendLike(likeRest: restWithLike1)
        likeManager.appendLike(likeRest: restWithLike2)
        
        let gotLikes = likeManager.getLikes()
        
        XCTAssertEqual(gotLikes.count, 1)
    }

    func testRemoveLike() throws {
        let likeManager = LikeStatusManager()

        let restWithLike1 = LikeModel(id: "1", isLked: true)
        let restWithLike2 = LikeModel(id: "2", isLked: true)

        likeManager.appendLike(likeRest: restWithLike1)
        likeManager.appendLike(likeRest: restWithLike2)
        
        try likeManager.removeLike(id: restWithLike1.id)
        
        let remainingLikes = likeManager.getLikes()
        
        XCTAssertEqual(remainingLikes.count, 1)
        XCTAssertEqual(remainingLikes[0].id, restWithLike2.id)
        XCTAssertEqual(remainingLikes[0].isLked, restWithLike2.isLked)
        
    }

}
