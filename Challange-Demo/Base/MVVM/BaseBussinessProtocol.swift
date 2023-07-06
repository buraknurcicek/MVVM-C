//
//  BaseBussinessLayer.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

protocol BaseBusinessProtocol: AnyObject {
    func viewDidLoad()
    func viewDidAppear()
    func viewWillAppear()
    func viewDidDisappear()
    func viewWillDisappear()
}

extension BaseBusinessProtocol {
    func viewDidLoad() {}
    func viewDidAppear() {}
    func viewWillAppear() {}
    func viewDidDisappear() {}
    func viewWillDisappear() {}
}
