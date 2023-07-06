//
//  AssetHelper.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

enum AssetName: String {
    case logo
    case infoIcon
    case successIcon
    case errorIcon
}

@dynamicMemberLookup
class AssetHelper {
    
    static let shared = AssetHelper()
    
    private init() { }
    
    subscript(dynamicMember dynamicMember: String) -> UIImage {
        guard let asset = AssetName(rawValue: dynamicMember),
              let image = UIImage(named: asset.rawValue) else {
            return UIImage()
        }
        return image
    }
}
