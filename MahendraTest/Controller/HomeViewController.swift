//
//  ViewController.swift
//  MahendraTest
//
//  Created by Mahendra Vishwakarma on 18/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel : HomeViewModel?
    var menuList = Array<JSONModel>()
    var subCategoryList = Array<SubCategory>()
    var selectedSection = -1
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register cell/header on tableView
        tableview.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "menuCell")
        tableview.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerView")
        tableview.tableFooterView = UIView(frame: .zero)
        
        // view model object initialised
        viewModel = HomeViewModel()
        viewModel?.delegate = self
        viewModel?.fetchData()
    }
    deinit{
        viewModel = nil
    }

}

