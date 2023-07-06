//
//  HomeViewController.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 11.06.2023.
//

import UIKit
import Networking

protocol HomeDisplayLayer: BaseDisplayProtocol {
    @MainActor
    func display(sections: [HomeSection])
    @MainActor
    func goToDetail(with team: Team)
}

final class HomeViewController: BaseViewController {
    
    private let tableView = FormulaOneTableView()
    private let dataSource = HomeDataSource()
    private let viewModel: HomeBussinessLayer
    weak var coordinator: HomeCoordinator?

    init(viewModel: HomeBussinessLayer) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupViews()
        viewModel.viewDidLoad()
    }
}

extension HomeViewController: HomeDisplayLayer {
    @MainActor
    func display(sections: [HomeSection]) {
        sections.forEach { $0.registerCells(for: tableView) }
        dataSource.sections = sections
        tableView.reloadData()
    }
    
    @MainActor
    func goToDetail(with team: Team) {
        coordinator?.goToDetail(with: team)
    }
}

private extension HomeViewController {
    func setupViews() {
        addSubviews()
        setConstraints()
        configureTableView()
    }
    
    func addSubviews() {
        view.addSubviews(tableView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureTableView() {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }
}

