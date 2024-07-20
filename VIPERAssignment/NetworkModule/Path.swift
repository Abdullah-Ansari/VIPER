//
//  APIs.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 17/07/24.
//

import Foundation

import Foundation

// MARK:- HTTPMethods
enum HTTPMethod: String {
    case get = "GET"
    // can add more method based on the requirement.
}

// MARK:- Base url
enum BaseURL: String {
    
    case baseUrl
    
    var value: String {
        switch self {
        case .baseUrl:
            return "universities.hipolabs.com"
        }
    }
}

// MARK:- Declare all the apis..
enum Path: String {
    
    case university
    // can declare more cases, if have more apis.
    
    var name: String {
        switch self {
        case .university:
            return "/search"
        }
    }
}
