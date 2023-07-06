//
//  ResultViewController.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

protocol ResultDisplayLayer: BaseDisplayProtocol {
    func dismiss()
}

final class ResultViewController: BaseViewController {
    
    private class Constants: BaseConstants {
        static let imageSize: CGSize = CGSize(width: 50, height: 50)
    }
    
    private let imageView = FormulaOneImageView()
    private let titleLabel = FormulaOneLabel()
    private let messageLabel = FormulaOneLabel()
    private let button = FormulaOneButton()
    
    private var viewModel: ResultBussinessLayer
    
    init(viewModel: ResultBussinessLayer) {
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
    }
}

extension ResultViewController: ResultDisplayLayer {
    func dismiss() {
        dismiss(animated: true)
    }
}

private extension ResultViewController {
    func setupViews() {
        addSubviews()
        setConstraints()
        configureSubviews()
    }
    
    func addSubviews() {
        view.addSubviews(imageView, titleLabel, messageLabel, button)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: BaseConstants.padding),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -BaseConstants.padding),
            
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: BaseConstants.padding),
            messageLabel.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: BaseConstants.padding),
            messageLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -BaseConstants.padding),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -BaseConstants.padding),
            imageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.width),
            imageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.height),
            
            button.heightAnchor.constraint(equalToConstant: BaseConstants.buttonSize),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -BaseConstants.padding),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: BaseConstants.padding),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -BaseConstants.padding)
        ])
    }
    
    func configureSubviews() {
        titleLabel.populate(with: viewModel.getTitleLabelViewModel())
        messageLabel.populate(with: viewModel.getMessageLabelViewModel())
        imageView.populate(with: viewModel.getImageViewViewModel())
        button.populate(with: viewModel.getButtonViewModel())
    }
}
