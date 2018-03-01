//
//  PersonView.swift
//  SampleMvpApp
//
//  Created by Dima Yarmolchuk on 3/1/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

protocol PersonView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    
    func setPersons(persons: [PersonViewData])
    func setEmptyPersons()
}
