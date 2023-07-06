//
//  FormulaOneImageView.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 13.06.2023.
//

import UIKit

final class FormulaOneImageView: UIImageView {
    
    struct ViewModel {
        let asset: AssetType
    }
    
    enum AssetType {
        case image(UIImage)
        case imageFromUrl(String)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func populate(with viewModel: ViewModel) {
        switch viewModel.asset {
        case .image(let image):
            self.image = image
        case .imageFromUrl(let urlString):
            // kingfisher
            break
        }
    }
}
