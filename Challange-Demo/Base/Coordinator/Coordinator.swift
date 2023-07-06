//
//  Coordinator.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

protocol CoordinatorProtocol: AnyObject {
    var parentCoordinator: CoordinatorProtocol? { get set }
    var childrenCoordinators: [CoordinatorProtocol] { get set }
    
    func start()
}

extension CoordinatorProtocol {
    func add(child: CoordinatorProtocol) {
        if !childrenCoordinators.contains(where: { $0 === child }) {
            childrenCoordinators.append(child)
            child.parentCoordinator = self
        }
    }
    
    func remove(child: CoordinatorProtocol) {
        if let index = childrenCoordinators.firstIndex(where: { $0 === child }) {
            childrenCoordinators.remove(at: index)
        }
    }
    
    func getChildCoordinator<T:CoordinatorProtocol>() -> T? {
        for coordinator in childrenCoordinators {
            if let matched = coordinator as? T {
                return matched
            }
        }
        
        return nil
    }
    
    func removeFromParentCoordinator() {
        parentCoordinator?.remove(child: self)
    }
}
