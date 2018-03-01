//
//  PersonService.swift
//  SampleMvpApp
//
//  Created by Dima Yarmolchuk on 3/1/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol PersonService {
    func getPersons(callBack:@escaping ([Person]) -> Void)
}

// MARK: Implementation

private final class PersonServiceImpl: PersonService {
    //the service delivers mocked data with a delay
    func getPersons(callBack:@escaping ([Person]) -> Void) {
        let persons = [ Person(firstName: "Valentino", lastName: "Rossi", email: "iyad@test.com", age: 39),
                        Person(firstName: "Johann", lastName: "Zarco", email: "mila@test.com", age: 23),
                        Person(firstName: "Danilo", lastName: "Petrucci", email: "mark@test.com", age: 29),
                        Person(firstName: "Maverick", lastName: "Viñales", email: "mila@test.com", age: 25),
                        Person(firstName: "Dani", lastName: "Pedrosa", email: "mark@test.com", age: 31) ]

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            callBack(persons)
        }
    }
}

// MARK: Factory

final class PersonServiceFactory {
    static func `default`() -> PersonService {
        return PersonServiceImpl()
    }
}

