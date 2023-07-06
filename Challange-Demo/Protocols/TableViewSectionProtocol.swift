//
//  TableViewSectionProtocol.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

protocol TableViewSectionProtocol {
    func registerCells(for tableView: UITableView)
    func dequeReusableCell(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    func numberOfCell() -> Int
    func itemDidSelect(in tableView: UITableView, at index: Int)
}

extension TableViewSectionProtocol {
    func itemDidSelect(in tableView: UITableView, at index: Int) {}
}
