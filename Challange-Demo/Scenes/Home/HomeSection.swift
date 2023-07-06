//
//  HomeSection.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

struct HomeSection {

    private var didSelectHandler: IntHandler?
    private var models: [HomeCell.ViewModel]
    
    init(models: [HomeCell.ViewModel], didSelectHandler: IntHandler?) {
        self.models = models
        self.didSelectHandler = didSelectHandler
    }
}

extension HomeSection: TableViewSectionProtocol {
    func registerCells(for tableView: UITableView) {
        tableView.register(HomeCell.self)
    }
    
    func numberOfCell() -> Int {
        return models.count
    }
    
    func dequeReusableCell(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeCell = tableView.dequeueReusableCell()
        cell.populate(with: models[indexPath.row])
        return cell
    }
    
    func itemDidSelect(in tableView: UITableView, at index: Int) {
        didSelectHandler?(index)
    }
}
