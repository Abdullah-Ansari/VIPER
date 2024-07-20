//
//  DetailsPresenter.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 18/07/24.
//

import Foundation

// talk to router
// talk to view
// talk to interactor

protocol UniversityDetailPresenterProtocol {
    
    var router: UniversityDetailRouterProtocol? { get set }
    var interactor: UniversityDetailInteractorProtocol? { get set }
    var view: UniversityDetailViewProtocol? { get set }
    
    func interactorUpdateData(university: University?)
    func viewDidLoad()
    
}

class UniversityDetailPresenter: UniversityDetailPresenterProtocol {
    
    var router: UniversityDetailRouterProtocol?
    var interactor: UniversityDetailInteractorProtocol?
    var view: UniversityDetailViewProtocol?
    
    func viewDidLoad() {
        interactor?.getUniversityData()
    }
    
    func interactorUpdateData(university: University?) {
        if let university = university {
            view?.update(with: university)
        } else {
            view?.update(with: "with no data")
        }
    }
    
}
