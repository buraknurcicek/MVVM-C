//
//  LoadingViewController.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

final class LoadingViewController: UIViewController {
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension LoadingViewController {
    func setupViews() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        view.addSubviews(spinner)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
