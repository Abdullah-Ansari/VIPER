//
//  NetworkService.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 17/07/24.
//

import Foundation

// Mark:- Network Service Protocol
protocol NetworkService {
    // fetchRepositories to fetch the data from the server and map into the concrete types.
    func fetchData<T: Decodable>(with endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}

