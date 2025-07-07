//
//  SubscriberListViewModelTests.swift
//  GlobeSubsAppTests
//
//  Created by Bon Ryan on 7/8/25.
//

import Testing

import XCTest
@testable import GlobeSubsApp

@MainActor
final class SubscriberListViewModelTests: XCTestCase {
    func testViewModelLoadsSubscribers() async {
        let repo = MockSubscriberRepository()
        let viewModel = SubscriberListViewModel(repository: repo)
        await viewModel.load()
        XCTAssertEqual(viewModel.subscribers.count, 1)
        XCTAssertEqual(viewModel.subscribers.first?.lastName, "User")
    }
}
