//
//  FormulaOneButton.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 13.06.2023.
//

import UIKit

final class FormulaOneButton: UIButton {
    
    struct ViewModel {
        var style: Style
        var title: String
        var onTap: VoidHandler
    }
    
    enum Style {
        case primary
    }
    
    private var viewModel: ViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func populate(with viewModel: ViewModel) {
        self.viewModel = viewModel
        setTitle(viewModel.title, for: .normal)
        switch viewModel.style {
        case .primary:
            setTitleColor(ColorHelper.shared.whiteColor, for: .normal)
            backgroundColor = ColorHelper.shared.redColor
            break
        }
    }
}

private extension FormulaOneButton {
    func setupViews() {
        configureButton()
    }
    
    func configureButton() {
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonOnTapped), for: .touchUpInside)
        layer.masksToBounds = true
        layer.cornerRadius = BaseConstants.radiusValue
    }

    @objc func buttonOnTapped() {
        viewModel?.onTap()
    }
}
