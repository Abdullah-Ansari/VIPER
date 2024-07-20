//
//  CDUniversity+CoreDataProperties.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 17/07/24.
//
//

import Foundation
import CoreData


extension CDUniversity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUniversity> {
        return NSFetchRequest<CDUniversity>(entityName: "CDUniversity")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var state: String?
    @NSManaged public var country: String?
    @NSManaged public var countryCode: String?
    @NSManaged public var attribute: String?
    @NSManaged public var webPage: URL?
    
    func convertToUniversity() -> University {
        
        return  University(countryCode: self.countryCode, country: self.country, name: self.name, state: self.state, url: self.webPage)
    }

}

extension CDUniversity : Identifiable {

}
