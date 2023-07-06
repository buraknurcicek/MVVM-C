//
//  SeparatorView.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

final class SeparatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = ColorHelper.shared.separatorColor
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: BaseConstants.separatorHeight)
        ])
    }
}
