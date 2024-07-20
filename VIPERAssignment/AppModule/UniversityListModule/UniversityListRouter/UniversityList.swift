//
//  ListRouter.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 16/07/24.
//

import UIKit

// Entry Point

protocol UniversityListRouterProtocol {
    
    var entry: UniversityListViewController? { get }
    static func start() -> UniversityListRouterProtocol
    
    func goToDetailView(university: University)
}

class UniversityListRouter: UniversityListRouterProtocol {
    
    var entry: UniversityListViewController?
    
    static func start() -> UniversityListRouterProtocol {
        
        let router = UniversityListRouter()
        let view = UniversityListViewController()
        let presenter = ListPresenter()
        let interactor = UniversityListInteractor()
        // view's
        view.presenter = presenter
        // presenter's
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        // interactor's
        interactor.presenter = presenter
        // router's
        router.entry = view
        return router
    }
    
    func goToDetailView(university: University) {
        let detailsRouter = UniversityDetailRouter.createDetails(with: university)
        guard let detailView = detailsRouter.entry else { return }
        guard let viewController = self.entry else { return }
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
    
}
