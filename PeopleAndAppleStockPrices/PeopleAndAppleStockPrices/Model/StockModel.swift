//
//  StockModel.swift
//  PeopleAndAppleStockPrices
//
//  Created by Ashli Rankin on 12/10/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation
struct StockInfo:Codable {
    let date:String
    let open: Double
    let high:Double
    let low: Double
    let close:Double
    let label:String
}

