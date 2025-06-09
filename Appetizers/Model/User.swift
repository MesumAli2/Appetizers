//
//  User.swift
//  Appetizers
//
//  Created by Mesum Syed on 03/06/2025.
//

import Foundation

struct User: Codable{
    var firstName = ""
    var LastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkin = false
    var frequentRefills = false
}
