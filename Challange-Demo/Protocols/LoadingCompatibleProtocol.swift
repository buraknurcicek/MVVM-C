//
//  LoadingCompatibleProtocol.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

protocol LoadingCompatibleProtocol: AnyObject {
    @MainActor func startLoading()
    @MainActor func stopLoading()
}

extension UIViewController: LoadingCompatibleProtocol {
    @MainActor
    func startLoading() {
        let child = LoadingViewController()
        self.add(child)
    }
    
    @MainActor
    func stopLoading() {
        if let child = self.children.first as? LoadingViewController {
            child.remove()
        }
    }
}
