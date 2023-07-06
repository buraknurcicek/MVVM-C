//
//  HomeCoordinator.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    
    private weak var window: UIWindow?
 
    var parentCoordinator: CoordinatorProtocol?
    var childrenCoordinators: [CoordinatorProtocol]
    var navigationController: BaseNavigationController?
 
    init(window: UIWindow?, parentCoordinator: CoordinatorProtocol? = nil) {
        self.window = window
        self.parentCoordinator = parentCoordinator
        self.childrenCoordinators = []
    }
    
    func start() {
        let viewModel = HomeViewModel()
        let controller = HomeViewController(viewModel: viewModel)
        controller.coordinator = self
        navigationController = BaseNavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
    }
    
    func goToDetail(with team: Team) {
        let viewModel = DetailViewModel(with: team)
        let controller = DetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(controller, animated: true)
    }
}
