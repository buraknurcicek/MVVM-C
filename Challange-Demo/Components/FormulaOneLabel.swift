//
//  FormulaOneLabel.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 13.06.2023.
//

import UIKit

final class FormulaOneLabel: UILabel {
    
    struct ViewModel {
        let style: Style
        let text: String
        let textAlignment: NSTextAlignment
    }
    
    enum Style {
        
        /// .formulaOneFont(.bold, size: 24), .titleColor
        case headerTitle
        
        /// .formulaOneFont(.regular, size: 16), .descriptionColor
        case headerDescription
        
        /// .formulaOneFont(.bold, size: 36), .titleColor
        case largeTitle
        
        /// .formulaOneFont(.bold, size: 18), .titleColor
        case mediumTitle
        
        /// .formulaOneFont(.regular, size: 14), .descriptionColor
        case smallDescription
        
        /// custom font and color
        case custom(font: UIFont, color: UIColor)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func populate(with viewModel: ViewModel) {
        textColor = viewModel.style.textColor
        font = viewModel.style.font
        text = viewModel.text
        textAlignment = viewModel.textAlignment
    }
}

private extension FormulaOneLabel.Style {
    var font: UIFont {
        switch self {
        case .headerTitle:
            return .formulaOneFont(.bold, size: 24)
        case .headerDescription:
            return .formulaOneFont(.regular, size: 16)
        case .largeTitle:
            return .formulaOneFont(.bold, size: 36)
        case .mediumTitle:
            return .formulaOneFont(.bold, size: 18)
        case .smallDescription:
            return .formulaOneFont(.regular, size: 14)
        case .custom(let font, _):
            return font
        }
    }
    
    var textColor: UIColor? {
        switch self {
        case .headerTitle, .largeTitle, .mediumTitle:
            return ColorHelper.shared.titleColor
        case .headerDescription, .smallDescription:
            return ColorHelper.shared.descriptionColor
        case .custom(_, let color):
            return color
        }
    }
}
