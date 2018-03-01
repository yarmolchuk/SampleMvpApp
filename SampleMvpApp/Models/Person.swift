//
//  Person.swift
//  SampleMvpApp
//
//  Created by Dima Yarmolchuk on 3/1/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

final class Person {
    let firstName: String
    let lastName: String
    let email: String
    let age: Int
    
    init(firstName: String, lastName: String, email: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.age = age
    }
}

