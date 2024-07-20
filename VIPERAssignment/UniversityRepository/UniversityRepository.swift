//
//  UniversityRepository.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 17/07/24.
//

import Foundation

protocol UniversityRepository {
    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void)
}

protocol LocalUniversityRepository {
    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void)
    func saveUniversities(_ universities: [University])
}
