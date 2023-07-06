//
//  HomeViewModel.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation
import Networking

protocol HomeBussinessLayer: BaseBusinessProtocol {
    var view: HomeDisplayLayer? { get set }
}

final class HomeViewModel: HomeBussinessLayer {
    
    weak var view: HomeDisplayLayer?
    
    private let repository: HomeRepositoryProtocol
    private var teams: [Team]?
    
    init(repository: HomeRepositoryProtocol = HomeRepository()) {
        self.repository = repository
    }
    
    func viewDidLoad() {
        fetchData()
    }
    
    private func fetchData() {
        Task {
            await view?.startLoading()
            let (response, error) = await repository.getTeams()
            
            await view?.stopLoading()
            if let error = error {
                await view?.showResultViewController(message: error.localizedDescription, state: .error)
                return
            }   
            self.teams = response?.teams
            await view?.display(sections: sections)
        }
    }
    
    @MainActor
    private var sections: [HomeSection] {
        guard let teams = self.teams else { return [] }
        var tmpSections: [HomeSection] = []
        let cellViewModels = teams.map { team -> HomeCell.ViewModel in
            let viewModel = HomeCell.ViewModel(name: (team.teamName).toStringValueOrEmpty)
            return viewModel
        }
        let section = HomeSection(models: cellViewModels) { [weak self] index in
            guard let self = self, let team = self.teams?[safe: index] else { return }
            self.view?.goToDetail(with: team)
        }
        tmpSections.append(section)
        return tmpSections
    }
}
