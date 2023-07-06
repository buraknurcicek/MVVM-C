//
//  SpyNavigationController.swift
//  Challange-DemoTests
//
//  Created by Burak Nurçiçek on 14.06.2023.
//

import UIKit

class SpyNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
}
