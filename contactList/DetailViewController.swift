//
//  DetailViewController.swift
//  contactList
//
//  Created by Bibek Shrestha on 2/25/19.
//  Copyright © 2019 Bibek Shrestha. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var contactInfo :ContactStruct! 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameLabel.text = contactInfo!.firstName
        lastNameLabel.text = contactInfo!.lastName
        phoneNumLabel.text = contactInfo!.number
        emailLabel.text = contactInfo!.email
//        print(contactInfo!.email)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
