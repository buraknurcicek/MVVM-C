//
//  HeaderView.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

final class HeaderView: UIView {
    
    enum VisibleComponents {
        case title(String)
        case description(String)
        case separator
    }
    
    struct ViewModel {
        let components: [VisibleComponents]
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = BaseConstants.stackViewSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel = FormulaOneLabel()
    private lazy var descriptionLabel = FormulaOneLabel()
    private lazy var separatorView = SeparatorView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func populate(with viewModel: ViewModel) {
        for component in viewModel.components {
            switch component {
            case .title(let title):
                stackView.addArrangedSubview(titleLabel)
                populateTitleLabel(with: title)
            case .description(let description):
                stackView.addArrangedSubview(descriptionLabel)
                populateDescriptionLabel(with: description)
            case .separator:
                stackView.addArrangedSubview(separatorView)
            }
        }
    }
}

private extension HeaderView {
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        addSubviews(stackView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func populateTitleLabel(with text: String) {
        let viewModel = FormulaOneLabel.ViewModel(style: .headerTitle, text: text, textAlignment: .center)
        titleLabel.populate(with: viewModel)
    }
    
    func populateDescriptionLabel(with text: String) {
        let viewModel = FormulaOneLabel.ViewModel(style: .headerDescription, text: text, textAlignment: .center)
        descriptionLabel.populate(with: viewModel)
    }
}
