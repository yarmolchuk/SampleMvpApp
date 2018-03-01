//
//  PersonPresenterTest.swift
//  SampleMvpAppTests
//
//  Created by Dima Yarmolchuk on 3/1/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation
import XCTest
@testable import SampleMvpApp

class PersonServiceMock: PersonService {
    private let persons: [Person]
    
    init(persons: [Person]) {
        self.persons = persons
    }
    
    func getPersons(callBack: @escaping ([Person]) -> Void) {
        callBack(persons)
    }
}

class PersonViewMock : NSObject, PersonView {
    var setPersonsCalled = false
    var setEmptyPersonsCalled = false
    
    func setPersons(persons: [PersonViewData]) {
        setPersonsCalled = true
    }
    
    func setEmptyPersons() {
        setEmptyPersonsCalled = true
    }
    
    func startLoading() {
    }
    
    func finishLoading() {
    }
}

class PersonPresenterTest: XCTestCase {
    
    let emptyPersonsServiceMock = PersonServiceMock(persons:[Person]())
    
    let mockPersonsService = PersonServiceMock(persons: [
                                                    Person(firstName: "first1", lastName: "lastname1", email: "first@test.com", age: 33),
                                                    Person(firstName: "first2", lastName: "lastname2", email: "second@test.com", age: 34)
        ])
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldSetEmptyIfNoUserAvailable() {
        //given
        let personViewMock = PersonViewMock()
        let personPresenterTest = PersonPresenter(personService: emptyPersonsServiceMock)
        personPresenterTest.attachView(view: personViewMock)
        
        //when
        personPresenterTest.getPersons()
    
        //verify
        XCTAssertTrue(personViewMock.setEmptyPersonsCalled)
    }
    
    func testShouldSetPersons() {
        //given
        let mockPersonView = PersonViewMock()
        let personPresenterTest = PersonPresenter(personService: mockPersonsService)
        personPresenterTest.attachView(view: mockPersonView)
        
        //when
        personPresenterTest.getPersons()
        
        //verify
        XCTAssertTrue(mockPersonView.setPersonsCalled)
    }
    
}
