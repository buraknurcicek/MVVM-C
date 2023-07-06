//
//  AppCoordinator.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

protocol AppCoordinatorProtocol: CoordinatorProtocol {
    func goToHome()
}

final class AppCoordinator: AppCoordinatorProtocol {

    var parentCoordinator: CoordinatorProtocol?
    var childrenCoordinators: [CoordinatorProtocol] = []
    
    private weak var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewModel = SplashViewModel()
        let controller = SplashViewController(viewModel: viewModel)
        controller.coordinator = self
        window?.rootViewController = controller
    }
}

extension AppCoordinator {
    func goToHome() {
        let coordinator = HomeCoordinator(window: window)
        coordinator.parentCoordinator = self
        coordinator.start()
        add(child: coordinator)
    }
}
