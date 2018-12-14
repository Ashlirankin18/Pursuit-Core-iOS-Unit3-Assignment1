//
//  ViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Alex Paul on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit
class UsersViewController: UIViewController {
    var users = ApiDecoder.UserApiData().sorted{$0.name.first < $1.name.first} {
        didSet {
                userTableView.reloadData()
            }
        }
    var something = ApiDecoder.UserApiData() {
        didSet{
            userTableView.reloadData()
        }
    }

    @IBOutlet weak var userSearchBar: UISearchBar!
    @IBOutlet weak var userTableView: UITableView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        userTableView.dataSource = self
        userSearchBar.delegate = self
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = userTableView.indexPathForSelectedRow,
         let destination = segue.destination as? UserDetailledViewController else{return}
         let userToSet = users[indexPath.row]
         destination.user = userToSet
        
    }
    }


extension UsersViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userAssigned = users[indexPath.row]
        let cell = userTableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = "\(userAssigned.name.fullName) "
        cell.detailTextLabel?.text = userAssigned.location.city.capitalized
        cell.selectionStyle = .none
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        } else {
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        return cell
    }
}

extension UsersViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let something = ApiDecoder.UserApiData().sorted{$0.name.fullName < $1.name.fullName}
        if searchText == ""{
            users = ApiDecoder.UserApiData().sorted{$0.name.fullName < $1.name.fullName}
            userTableView.reloadData()
        } else {
            users = something.filter{$0.name.fullName.contains(searchText)}
        }
        
    }
}

