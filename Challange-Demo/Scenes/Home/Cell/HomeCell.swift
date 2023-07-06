//
//  HomeCell.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

final class HomeCell: UITableViewCell, ReusableView {

    struct ViewModel {
        let name: String
    }
    
    private let titleLabel = FormulaOneLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func populate(with viewModel: ViewModel) {
        let viewModel = FormulaOneLabel.ViewModel(style: .mediumTitle, text: viewModel.name, textAlignment: .left)
        titleLabel.populate(with: viewModel)
    }
}

private extension HomeCell {
    func setupViews() {
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        contentView.addSubviews(titleLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: BaseConstants.padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -BaseConstants.padding),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: BaseConstants.padding),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -BaseConstants.padding),
        ])
    }
}
