//
//  List_Interactor.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 16/07/24.
//

import Foundation

// Talk to presenter
protocol UniversityListInteractorProtocol {
    
    var presenter: UniversityListPresenterProtocol? { get set }
    
    func getUniversities()
}

class UniversityListInteractor: UniversityListInteractorProtocol {
    
    var presenter: UniversityListPresenterProtocol?
    let universityRepository: UniversityRepository
    
    init() {
        let remoteDataSource = RemoteUniversityDataSource()
        let localDataSource = LocalUniversityDataSource()
        self.universityRepository = UniversityRepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
    }
    
    func getUniversities() {
        universityRepository.fetchUniversities { result in
            switch result {
            case .success(let universities):
                self.presenter?.interactorWithData(result: .success(universities))
            case .failure(let failure):
                self.presenter?.interactorWithData(result: .failure(failure))
            }
        }
    }
    
}
