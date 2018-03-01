//
//  PersonPresenter.swift
//  SampleMvpApp
//
//  Created by Dima Yarmolchuk on 3/1/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

struct PersonViewData {
    let name: String
    let age: String
}

final class PersonPresenter {
    private let personService: PersonService
    weak private var personView : PersonView?
    
    init(personService: PersonService) {
        self.personService = personService
    }
    
    func attachView(view: PersonView) {
        personView = view
    }
    
    func detachView() {
        personView = nil
    }
        
    func getPerson() -> Void {
        self.personView?.startLoading()
        
        personService.getPersons { [weak self] persons in
            self?.personView?.finishLoading()
            
            if (persons.isEmpty) {
                self?.personView?.setEmptyPersons()
            } else {
                let mappedPersons = persons.map {
                    return PersonViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
                }
                self?.personView?.setPersons(persons: mappedPersons)
            }
        }
    }
}
