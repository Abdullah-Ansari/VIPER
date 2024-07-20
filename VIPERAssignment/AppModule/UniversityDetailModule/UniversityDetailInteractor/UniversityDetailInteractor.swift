//
//  DetailsInteractor.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 18/07/24.
//

import Foundation

// talk to presenter

protocol UniversityDetailInteractorProtocol {
    
    var presenter: UniversityDetailPresenterProtocol? { get set }
    var university: University? { get set }
    
    func getUniversityData()
}

class UniversityDetailInteractor: UniversityDetailInteractorProtocol {
    
    var presenter: UniversityDetailPresenterProtocol?
    var university: University?
    
    func getUniversityData() {
        presenter?.interactorUpdateData(university: university)
    }

}
