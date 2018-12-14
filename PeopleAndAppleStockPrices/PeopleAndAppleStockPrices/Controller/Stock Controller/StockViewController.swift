//
//  StovckViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Ashli Rankin on 12/10/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//
import UIKit
class StockViewController: UIViewController {
    var stocks = ApiDecoder.stockPath() {
        didSet {
            stockTableView.reloadData()
        }
    }
    var startIndex = 0
    var anotherThing = String()

     var stockMatrix = [[StockInfo]]()
    @IBOutlet weak var stockTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        stockTableView.dataSource = self
        stockTableView.delegate = self
        matrixFactory()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = stockTableView.indexPathForSelectedRow,
        let stockDetailledView = segue.destination as? StockDetailledViewController else {fatalError()}
        stockDetailledView.stock = stocks[indexPath.row]
    }
   

    func dateConverter(date:String) -> (month:String , year:String){
        let dateArray = date.components(separatedBy:"-")
            return (year:dateArray[0],month:dateArray[1])
    }
    
func matrixFactory(){
    var previousDate = ""
    stockMatrix.append([StockInfo]())
    for stock in stocks {
        let convertedDate = dateConverter(date: stock.date)
        let currentDate = convertedDate.month + "-" + convertedDate.year
        
        if previousDate.isEmpty {
            previousDate = convertedDate.month + "-" + convertedDate.year
        }
        if currentDate != previousDate {
            stockMatrix.append([StockInfo]())
            startIndex += 1
        }
        stockMatrix[startIndex].append(stock)
        previousDate = convertedDate.month + "-" + convertedDate.year
    }
    print(stockMatrix)
    
    }
}

extension StockViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockMatrix[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = stockTableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        cell.textLabel?.text = stockMatrix[indexPath.section][indexPath.row].date
        cell.detailTextLabel?.text = " $ \(stocks[indexPath.row].open)"
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell.detailTextLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }else {
            cell.backgroundColor = #colorLiteral(red: 0, green: 0.5314741731, blue: 0.03594816104, alpha: 1)
        }
        return cell
    }
    
}
extension StockViewController:UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return stockMatrix.count
  
}
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
}

}
