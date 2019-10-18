//
//  AppProtocols.swift
//  MahendraTest
// protocols for message passing
//  Created by Mahendra Vishwakarma on 18/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import Foundation

// protocol for viewmodel.
public protocol ViewModelProtocol:class{
    var delegate:ViewModelDelegate?{get set}
    func fetchData()
}

// for data update in viewmodel
public protocol ViewModelDelegate:class{
    func jsonResponse(result:[JSONModel]?)
}
