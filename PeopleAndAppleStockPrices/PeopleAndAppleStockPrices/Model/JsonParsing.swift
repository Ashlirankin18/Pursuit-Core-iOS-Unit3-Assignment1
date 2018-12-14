//
//  JsonParsing.swift
//  PeopleAndAppleStockPrices
//
//  Created by Ashli Rankin on 12/10/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class ApiDecoder{
static func UserApiData() -> [UserAttributes] {
        guard let path = Bundle.main.path(forResource: "userinfo", ofType: "json") else {fatalError()}
    let userUrl = URL(fileURLWithPath: path)
        if let data = try? Data.init(contentsOf: userUrl) {
            do{
           let users = try JSONDecoder().decode(Users.self, from:data).results
                return users
            }catch{
                print(error)
            }
        }
        return []
    }
static func stockPath() -> [StockInfo]{
        guard let path = Bundle.main.path(forResource: "applstockinfo", ofType: "json") else {fatalError()}
        let stockUrl = URL.init(fileURLWithPath: path)
        if let data = try? Data.init(contentsOf: stockUrl){
            do{
                let allStock = try JSONDecoder().decode([StockInfo].self, from: data)
                return allStock
            } catch {
                print(error)
            }
        }
    return []

    }


}
