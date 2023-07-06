//
//  ResultCompatibleProtocol.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

protocol ResultCompatibleProtocol {
    @MainActor
    func showResultViewController(message: String, state: ResultStateType)
}

extension UIViewController: ResultCompatibleProtocol {
    @MainActor
    func showResultViewController(message: String, state: ResultStateType) {
        let dataSource = ResultViewModel.DataSource(message: message, state: state)
        let viewModel = ResultViewModel(dataSource: dataSource)
        let controller = ResultViewController(viewModel: viewModel)
        controller.modalPresentationStyle = .formSheet
        present(controller, animated: true)
    }
}
