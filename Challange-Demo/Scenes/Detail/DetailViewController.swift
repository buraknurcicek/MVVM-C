//
//  DetailViewController.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

protocol DetailDisplayLayer: BaseDisplayProtocol {}

final class DetailViewController: BaseViewController, DetailDisplayLayer {

    private let headerView = HeaderView()
    private let viewModel: DetailBussinessLayer
    
    init(viewModel: DetailBussinessLayer) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Detail"
        setupViews()
    }
}

private extension DetailViewController {
    func setupViews() {
        addSubviews()
        setConstraints()
        configureHeaderView()
    }
    
    func addSubviews() {
        view.addSubviews(headerView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureHeaderView() {
        headerView.populate(with: viewModel.getHeaderViewViewModel())
    }
}
