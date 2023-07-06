//
//  HomeDataSource.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

final class HomeDataSource: NSObject {
    var sections: [HomeSection] = []
}

extension HomeDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].numberOfCell()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sections[indexPath.section].dequeReusableCell(in: tableView, at: indexPath)
    }
}

extension HomeDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].itemDidSelect(in: tableView, at: indexPath.row)
    }
}
