//
//  StockDetailledViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Ashli Rankin on 12/11/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit
class StockDetailledViewController: UIViewController {
    var stock: StockInfo!
    
    @IBOutlet weak var stockDate: UILabel!
    @IBOutlet weak var stockImageView: UIImageView!
    @IBOutlet weak var stockOpen: UILabel!
    @IBOutlet weak var stockClosed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockInfo()
    }
    private func updateStockInfo(){
        stockDate.text = stock.date
        stockOpen.text = "Open: \(stock.open)"
        stockClosed.text = "Close: \(stock.close)"
        if Double(stock.open) > Double(stock.close) {
             view.backgroundColor = #colorLiteral(red: 0.6811216474, green: 0.1081555858, blue: 0.1454514861, alpha: 1)
            stockImageView.image = UIImage(named: "thumbsDown")
           
        } else {
            view.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
             stockImageView.image = UIImage(named: "thumbsUp")        }
    }
}
