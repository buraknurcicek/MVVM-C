//
//  SplashViewModel.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

protocol SplashBusinessLayer: BaseBusinessProtocol {
    var view: SplashDisplayLayer? { get set }
    
    func getImageViewViewModel() -> FormulaOneImageView.ViewModel
}

final class SplashViewModel: SplashBusinessLayer {

    weak var view: SplashDisplayLayer?
    
    func viewDidLoad() {
        goToHome()
    }
    
    private func goToHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self = self else { return }
            self.view?.goToHome()
        }
    }

    func getImageViewViewModel() -> FormulaOneImageView.ViewModel {
        return FormulaOneImageView.ViewModel(asset: .image(AssetHelper.shared.logo))
    }
}
