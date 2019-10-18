//
//  AppExtensions.swift
//  MahendraTest
//
//  Created by Mahendra Vishwakarma on 18/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController:ViewModelDelegate{
    
    func jsonResponse(result:[JSONModel]?){
        DispatchQueue.main.async {
            self.menuList = result ?? []
            self.tableview.reloadData()
        }
    }
}

extension HomeViewController:UITableViewDataSource,UITableViewDelegate{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == selectedSection){
            return subCategoryList.count
        }else{
            return 0
        }
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as! HeaderView
        let menu = menuList[section]
        headerView.btnClicked.tag = section
        headerView.btnClicked.addTarget(self, action: #selector(expand_collepsCell(sender:)), for: .touchUpInside)
        headerView.headerLabel.text = menu.name.capitalized
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        
        cell.setInfo(info: subCategoryList[indexPath.row])
        return cell
        
    }
    
    @objc func expand_collepsCell(sender:UIButton){
        
        self.selectedSection = self.selectedSection < 0 ? sender.tag : sender.tag != self.selectedSection ? sender.tag : -1
        if(self.selectedSection >= 0){
           let subCat = menuList[self.selectedSection].subCategory
            subCategoryList.removeAll()
            tableview.reloadData()
            for item in subCat {
                
                self.subCategoryList.append(item)
                self.tableview.beginUpdates()
                let indexpath = IndexPath(row: self.subCategoryList.count-1, section: self.selectedSection)
                self.tableview.insertRows(at: [indexpath], with: .fade)
                self.tableview.endUpdates()
               
            }
            self.tableview.scrollToRow(at: IndexPath(row: 0, section: self.selectedSection), at: .middle, animated: true)
        }else{
            subCategoryList.removeAll()
            tableview.reloadData()
        }
        
        
    }
}
