//
//  ResultViewModel.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation
import UIKit

protocol ResultBussinessLayer {
    var view: ResultDisplayLayer? { get set }
    
    func getImageViewViewModel() -> FormulaOneImageView.ViewModel
    func getTitleLabelViewModel() -> FormulaOneLabel.ViewModel
    func getMessageLabelViewModel() -> FormulaOneLabel.ViewModel
    func getButtonViewModel() -> FormulaOneButton.ViewModel
}

final class ResultViewModel: ResultBussinessLayer {
    
    weak var view: ResultDisplayLayer?
    
    private let dataSource: DataSource
    
    struct DataSource {
        let message: String
        let state: ResultStateType
    }
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
    
    private var title: String {
        return dataSource.state.title
    }
    
    private var message: String {
        return dataSource.message
    }
    
    private var image: UIImage {
        return dataSource.state.image
    }
    
    func getButtonViewModel() -> FormulaOneButton.ViewModel {
        return FormulaOneButton.ViewModel(style: .primary,
                                          title: "Okey") { [weak self] in
            guard let self = self else { return }
            self.view?.dismiss()
        }
    }
    
    func getImageViewViewModel() -> FormulaOneImageView.ViewModel {
        return FormulaOneImageView.ViewModel(asset: .image(image))
    }
    
    func getTitleLabelViewModel() -> FormulaOneLabel.ViewModel {
        return FormulaOneLabel.ViewModel(style: .mediumTitle, text: title, textAlignment: .center)
    }
    
    func getMessageLabelViewModel() -> FormulaOneLabel.ViewModel {
        return FormulaOneLabel.ViewModel(style: .smallDescription, text: message, textAlignment: .center)
    }
}
