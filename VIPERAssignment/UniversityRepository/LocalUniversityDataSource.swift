//
//  LocalUniversityDataSource.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 17/07/24.
//

import Foundation

enum UniversityError: Error {
    
    case notFetchedSuccessfully
    
}
enum LocalError: Error {
    case noDataAvailable
}


class LocalUniversityDataSource: LocalUniversityRepository {
    
  
    private var persistentStorage: PersistentStorage
    
    init() {
        self.persistentStorage = PersistentStorage.shared
    }
    
    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void) {
        // Fetch universities from Core Data
        let result = persistentStorage.fetchManagedObject(managedObject: CDUniversity.self)
        
        var universities: [University] = []
        
        result?.forEach({ (cdUniversity) in
            universities.append(cdUniversity.convertToUniversity())
        })
        if universities.isEmpty {
            completion(.failure(LocalError.noDataAvailable))
        }
        completion(.success(universities))
    }
   
    
    func saveUniversities(_ universities: [University]) {
        persistentStorage.saveUniversities(universities)
    }
}
