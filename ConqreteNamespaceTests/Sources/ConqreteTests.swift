//
//  ConqreteNamespaceTests.swift
//  ConqreteNamespaceTests
//
//  Created by stilltimm on 22/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import XCTest
@testable import ConqreteNamespace

final class ConqreteTests: XCTestCase {

    func test_Conqrete_name() {
        XCTAssertEqual(String(describing: Conqrete.self), "Conqrete")
    }
}
