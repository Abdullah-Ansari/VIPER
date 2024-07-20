//
//  DetailsRouter.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 18/07/24.
//

import Foundation

// talk to presenter
// entry point

protocol UniversityDetailRouterProtocol {
    var entry: UniversityDetailViewController? { get set }
    static func createDetails(with university: University) -> UniversityDetailRouterProtocol
}

class UniversityDetailRouter: UniversityDetailRouterProtocol {
    
    var entry: UniversityDetailViewController?
    
    static func createDetails(with university: University) -> UniversityDetailRouterProtocol {
        let router = UniversityDetailRouter()
        let view = UniversityDetailViewController()
        let presenter = UniversityDetailPresenter()
        let interactor = UniversityDetailInteractor()
        
        // view's presenter
        view.presenter = presenter
        
        /// presenter's
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
//        // interactor's
        interactor.presenter = presenter
        interactor.university = university
        
        // router's
        router.entry = view
        return router
    }
}
