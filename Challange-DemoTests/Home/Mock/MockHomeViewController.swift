//
//  MockHomeViewController.swift
//  Challange-DemoTests
//
//  Created by Burak Nurçiçek on 14.06.2023.
//

import Foundation

@testable import Challange_Demo

class MockHomeViewController: HomeDisplayLayer {
    var didCallDisplay = false
    var displayAction: BoolHandler?
    
    var didCallResult = false
    var resultAction: BoolHandler?

    var didCallGoToDetail = false
    var goToDetailAction: ((Team) -> Void)?
    
    var startLoadingCallCount = 0
    var startLoadingAction: IntHandler?

    var stopLoadingCallCount = 0
    var stopLoadingAction: IntHandler?
    
    func display(sections: [HomeSection]) {
        didCallDisplay = true
        displayAction?(didCallDisplay)
    }
    
    func showResultViewController(message: String, state: Challange_Demo.ResultStateType) {
        didCallResult = true
        resultAction?(didCallResult)
    }

    func goToDetail(with team: Team) {
        didCallGoToDetail = true
        goToDetailAction?(team)
    }
    
    func startLoading() {
        startLoadingCallCount += 1
        startLoadingAction?(startLoadingCallCount)
    }
    
    func stopLoading() {
        stopLoadingCallCount += 1
        stopLoadingAction?(stopLoadingCallCount)
    }
}
