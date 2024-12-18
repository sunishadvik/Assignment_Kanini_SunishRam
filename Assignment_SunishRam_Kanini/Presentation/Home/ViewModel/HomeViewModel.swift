//
//  HomeViewModel.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 18/12/24.
//

import Foundation
import Combine
import CoreData
 
class HomeViewModel : ObservableObject
{
    @Published var person: [Person] = []
    private var cancellables = Set<AnyCancellable>()
    private let manager = PersonManager()
    func retrievePersonInfo() {
        manager.fetchPerson()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    debugPrint("Error fetching: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { [weak self] people in
                self?.person.removeAll()
                people?.forEach({ (cdPerson) in
                    self?.person.append(cdPerson.convertToPerson())
                    self?.person.reverse()
                })
            }
            .store(in: &cancellables)
    }
    func deletePerson(id: UUID)  {
        if  manager.deletePerson(id: id) {
            retrievePersonInfo()
        }
    }
}
