//
//  UIView+Extensions.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
    
    func addIntoView() -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        view.addSubview(self)
        return view
    }
}
