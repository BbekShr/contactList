//
//  ViewController.swift
//  contactList
//
//  Created by Bibek Shrestha on 2/25/19.
//  Copyright © 2019 Bibek Shrestha. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath as IndexPath)
        let contactToDisplay = contacts[indexPath.row]
        cell.textLabel?.text = contactToDisplay.firstName + " " + contactToDisplay.lastName
        cell.detailTextLabel?.text = contactToDisplay.number
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailScreenId") as! DetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.contactInfo = contacts[indexPath.row]

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        contactStore.requestAccess(for: .contacts) {(success, error) in
        if success {
            print("AS")
        }

        }
        fetchContacts()
}
    
    func fetchContacts(){
        let key = [CNContactGivenNameKey,CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactEmailAddressesKey ] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        
        try! contactStore.enumerateContacts(with: request){ (contact, stoppingPointer) in
        let name = contact.givenName
        let familyName = contact.familyName
        let number = contact.phoneNumbers.first?.value.stringValue
        let email = contact.emailAddresses.first?.value ?? ""
            
            let contactToAppend = ContactStruct(firstName: name, lastName: familyName, number: number!, email: email as String)
            
            
            self.contacts.append(contactToAppend)
            
    }
        tableView.reloadData()
    

}
}
