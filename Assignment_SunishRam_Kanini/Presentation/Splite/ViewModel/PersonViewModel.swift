//
//  ViewModel.swift
//  Assignment_SunishRam 
//
//  Created by Sunish Ram on 17/12/24.
//

import Foundation
import Combine

class PersonViewModel {
    var isUpdate : Bool = false
    let manager = PersonManager()
    var person: Person?
    func createPerson(person: Person) {
        if manager.createPerson(person: person){}
    }
    func updatePerson(person: Person)  {
        if manager.updatePerson(person: person){}
    }
}
