//
//  CDPerson+CoreDataProperties.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 17/12/24.
//
//

import Foundation
import CoreData
 
extension CDPerson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPerson> {
        return NSFetchRequest<CDPerson>(entityName: "CDPerson")
    }
    @NSManaged public var dob: String?
    @NSManaged public var gender: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var age: String?
    func convertToPerson() -> Person
    {
        return Person(name: self.name, age: self.age, gender: self.gender, dob: self.dob, id: self.id!)
    }
}

 
