//
//  UserModel.swift
//  PeopleAndAppleStockPrices
//
//  Created by Ashli Rankin on 12/10/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

struct Users:Codable {
    let results:[UserAttributes]
}
struct UserAttributes:Codable {
    let gender:String
    let name:Name
    let location:Location
    let email:String
    let picture:Picture
}
struct Name: Codable {
    let first:String
    let last:String
    public var fullName : String {
        return  first.capitalized + " " + last.capitalized
    }
   
    }
struct Location:Codable{
    let street:String
    let city:String
    let state:String
}
struct Picture:Codable{
    let large:String
}

