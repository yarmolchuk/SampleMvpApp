//
//  UserService.swift
//  SampleMvpApp
//
//  Created by Dima Yarmolchuk on 3/1/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol UserService {
    func getPersons(callBack:([Person]) -> Void)
}

// MARK: Implementation

private final class UserServiceImpl: UserService {
    //the service delivers mocked data with a delay
    func getUsers(callBack:([User]) -> Void){
        let users = [User(firstName: "Iyad", lastName: "Agha", email: "iyad@test.com", age: 36),
                     User(firstName: "Mila", lastName: "Haward", email: "mila@test.com", age: 24),
                     User(firstName: "Mark", lastName: "Astun", email: "mark@test.com", age: 39)
        ]
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            callBack(users)
        }
    }
}

//// MARK: Factory
//
//final class UserServiceFactory {
//    static func `default`() -> UserService {
//        return UserServiceImpl()
//    }
//}

