//
//  PersonManager.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 17/12/24.
//

import Foundation
import Combine

struct PersonManager
{
    private let personDataRepository = PersonDataRepository()
    func createPerson(person: Person) -> Bool {
        return personDataRepository.create(person: person)
    }
    func fetchPerson() -> AnyPublisher<[CDPerson]?, Error> {
        return personDataRepository.getAll()
    }
    func fetchPerson(byIdentifier id: UUID) -> Person?
    {
        return personDataRepository.get(byIdentifier: id)
    }
    func updatePerson(person: Person) -> Bool {
        return personDataRepository.update(person: person)
    }
    func deletePerson(id: UUID) -> Bool {
        return personDataRepository.delete(id: id)
    }
}
