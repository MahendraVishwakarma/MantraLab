//
//  DataModel.swift
//  MahendraTest
// this file used to create model of json
//


import Foundation

// MARK: - JSONModel
public struct JSONModel: Codable {
    let name: String
    let subCategory: [SubCategory]
    
    enum CodingKeys: String, CodingKey {
        case name
        case subCategory = "sub_category"
    }
}

// MARK: - SubCategory
public struct SubCategory: Codable {
    let name, displayName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case displayName = "display_name"
    }
}

typealias JSONDataModel = [JSONModel]
