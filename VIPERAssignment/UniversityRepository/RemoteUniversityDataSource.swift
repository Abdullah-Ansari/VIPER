//
//  RemoteUniversityDataSource.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 17/07/24.
//

import Foundation

class RemoteUniversityDataSource: UniversityRepository {
    
    private let networkService: NetworkService

    init(networkService: NetworkService = NetworkServiceImpl()) {
        self.networkService = networkService
    }

    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void) {
//        ?country=United%20Arab%20Emirates
        let qParam = ["country": "United Arab Emirates"]
        let endPoint = EndpointBuilder()
            .setPath(.university)
            .setMethod(.get)
            .setAuthenticated(false)
            .setQueryParameters(qParam)
            .build()
        
        networkService.fetchData(with: endPoint) { (result: Result<[University], Error>) in
            switch result {
            case .success(let universities):
                completion(.success(universities))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

