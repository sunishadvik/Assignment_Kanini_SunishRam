//
//  PersonDataRepository.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 17/12/24.
//

import Foundation
import CoreData
import Combine

protocol PersonRepository {
    func create(person: Person) -> Bool
    func getAll() -> AnyPublisher<[CDPerson]?, Error>
    func get(byIdentifier id: UUID) -> Person?
    func update(person: Person) -> Bool
    func delete(id: UUID) -> Bool
}


struct PersonDataRepository : PersonRepository
{
    func create(person: Person)  -> Bool{
        let cdPerson = CDPerson(context: PersistentStorage.shared.context)
        cdPerson.age = person.age
        cdPerson.name = person.name
        cdPerson.id = person.id
        cdPerson.gender = person.gender
        cdPerson.dob  = person.dob

        PersistentStorage.shared.saveContext()
        return true


    }
    

    func getAll() -> AnyPublisher<[CDPerson]?, Error> {

        return PersistentStorage.shared.fetchManagedObject(managedObject: CDPerson.self)

    }

    func get(byIdentifier id: UUID) -> Person? {

        let result = getCDPerson(byIdentifier: id)
        guard result != nil else {return nil}
        return result?.convertToPerson()
    }

    func update(person: Person) -> Bool {

        let cdPerson = getCDPerson(byIdentifier: person.id)
        guard cdPerson != nil else {return false}
 
        cdPerson?.age = person.age
        cdPerson?.name = person.name
        cdPerson?.gender = person.gender
        cdPerson?.dob  = person.dob

        PersistentStorage.shared.saveContext()
        return true
    }

    func delete(id: UUID) -> Bool {

        let cdPerson = getCDPerson(byIdentifier: id)
        guard cdPerson != nil else {return false}

        PersistentStorage.shared.context.delete(cdPerson!)
        PersistentStorage.shared.saveContext()
        return true
    }


    private func getCDPerson(byIdentifier id: UUID) -> CDPerson?
    {
        let fetchRequest = NSFetchRequest<CDPerson>(entityName: "CDPerson")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)

        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first

            guard result != nil else {return nil}

            return result

        } catch let error {
            debugPrint(error)
        }

        return nil
    }

    
}
