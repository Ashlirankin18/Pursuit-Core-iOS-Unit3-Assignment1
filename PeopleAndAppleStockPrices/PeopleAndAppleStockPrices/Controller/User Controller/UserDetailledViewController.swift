//
//  UserDetailledViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Ashli Rankin on 12/10/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class UserDetailledViewController: UIViewController {

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactEmail: UILabel!
    @IBOutlet weak var contactAddress: UILabel!
    @IBOutlet weak var contactGender: UILabel!
    
    var user: UserAttributes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContact()
    }
   private func getImage() -> UIImage? {
        guard let url = URL(string: user.picture.large) else {return UIImage()}
        do {
            let imageData = try Data(contentsOf: url)
            let image = UIImage(data: imageData)
                return image
            
        } catch {
            print(error)
        }
        return UIImage()
    }
   private func updateContact() {
    contactName.text = "\(user.name.first.capitalized) \(user.name.last.capitalized)"
    contactGender.text = user.gender.capitalized
    contactEmail.text = user.email
    contactAddress.text = " \(user.location.state.capitalized), \(user.location.city.capitalized) ,\(user.location.street)"
       contactImage.image = getImage()
    }


}
