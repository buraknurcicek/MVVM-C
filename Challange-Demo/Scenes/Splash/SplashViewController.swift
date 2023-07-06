//
//  SplashViewController.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

protocol SplashDisplayLayer: BaseDisplayProtocol {
    func goToHome()
}

final class SplashViewController: BaseViewController {

    private class Constants: BaseConstants {
        static let imageSize: CGSize = CGSize(width: 160, height: 70)
    }
    
    private let imageView = FormulaOneImageView()
    private let viewModel: SplashBusinessLayer

    weak var coordinator: AppCoordinator?    
    
    init(viewModel: SplashBusinessLayer) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.viewDidLoad()
    }
}

extension SplashViewController: SplashDisplayLayer {
    func goToHome() {
        coordinator?.goToHome()
    }
}

private extension SplashViewController {
    func setupViews() {
        addSubviews()
        setConstraints()
        populateImageView()
    }
    
    func addSubviews() {
        view.addSubviews(imageView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.width),
            imageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.height)
        ])
    }
    
    func populateImageView() {
        imageView.populate(with: viewModel.getImageViewViewModel())
    }
}
