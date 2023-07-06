//
//  ResultStateType.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

enum ResultStateType {
    case error
    case inform
    case success
    
    var title: String {
        switch self {
        case .error:
            return "Error"
        case .inform:
            return "Inform"
        case .success:
            return "Success"
        }
    }
    
    var image: UIImage {
        switch self {
        case .error:
            return AssetHelper.shared.errorIcon
        case .inform:
            return AssetHelper.shared.infoIcon
        case .success:
            return AssetHelper.shared.successIcon
        }
    }
}
