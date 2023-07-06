//
//  DetailViewModel.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation

protocol DetailBussinessLayer: BaseBusinessProtocol {
    var view: DetailDisplayLayer? { get set }
    
    func getHeaderViewViewModel() -> HeaderView.ViewModel
}

final class DetailViewModel: DetailBussinessLayer {
    
    weak var view: DetailDisplayLayer?
    
    private let team: Team
    
    init(with team: Team) {
        self.team = team
    }
    
    func getHeaderViewViewModel() -> HeaderView.ViewModel {
        return HeaderView.ViewModel(components: [.title((team.teamName).toStringValueOrEmpty),
                                                 .description((team.teamName).toStringValueOrEmpty),
                                                 .separator])
    }
}
