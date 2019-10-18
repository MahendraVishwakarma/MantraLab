//
//  HomeViewModel.swift
//  MahendraTest
//
//  Created by Mahendra Vishwakarma on 18/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import Foundation

public class HomeViewModel:ViewModelProtocol{
    public weak var delegate: ViewModelDelegate?
    
    init() {
        
    }
    public func fetchData()  {
       
        CommonUtils.fetchJSONData(fileName: CommonUtils.fileName, decode: { (json) -> JSONDataModel? in
         
            guard let response = json as? JSONDataModel else{
                return nil
            }
            return response
            
        }) { [weak self] (result) in
            switch result{
                
            case .success(let data):
                self?.delegate?.jsonResponse(result: data)
               
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
       
    }
    
    
}
