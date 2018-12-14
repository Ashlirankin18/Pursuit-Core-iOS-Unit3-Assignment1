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

    var sectionName: String {
        var dateComponents = date.components(separatedBy: "-")
        let year = dateComponents[0]
        let month = dateComponents[1]
        return "\(MonthsDict[month]!) - \(year)"
    }
    private let MonthsDict = [
        "01":"January",
        "02":"February",
        "03":"March",
        "04":"April",
        "05":"May",
        "06":"June",
        "07":"July",
        "08":"August",
        "09":"September",
        "10":"October",
        "11":"November",
        "12":"December"
    ]
    
}

