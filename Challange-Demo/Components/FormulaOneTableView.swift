//
//  FormulaOneTableView.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 13.06.2023.
//

import UIKit

final class FormulaOneTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        translatesAutoresizingMaskIntoConstraints = false
        separatorInset = .zero
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}
