//
//  PersistentStorage.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 17/07/24.
//

import Foundation
import CoreData

final class PersistentStorage {
    
    private init() {}
    
    // MARK: - Core Data stack
    static let shared = PersistentStorage()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "VIPERAssignment")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

   lazy var context = persistentContainer.viewContext
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]? {
        
        do {
            guard let result = try PersistentStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else { return nil }
            return result
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    func saveUniversities(_ universities: [University]) {
            universities.forEach { university in
                let cdUniversity = CDUniversity(context: context) // Assuming UniversityEntity is the
                cdUniversity.name = university.name
                cdUniversity.country = university.country
                cdUniversity.countryCode = university.countryCode
                cdUniversity.state = university.state
                cdUniversity.webPage = university.url
            }
            
            saveContext() // Save the context to persist the changes
        }
    
}
