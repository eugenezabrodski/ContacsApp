//
//  InfoTableViewController.swift
//  ContactsApp
//
//  Created by Евгений Забродский on 4.12.22.
//

import UIKit

class InfoTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var user: User?
    let headerID = String(describing: CustomHeaderView.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
        title = "Info contacts"
    }
    
    //MARK: - Methods
    
    private func tableViewConfig() {
        let nib = UINib(nibName: headerID, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: headerID)
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        ContactSource.contact.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! CustomHeaderView
        header.textLabel?.text = "\(ContactSource.contact[section].name ?? "") \(ContactSource.contact[section].surname ?? "")"
        return header
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContacsCell", for: indexPath)
        
        let user = ContactSource.contact.randomElement()
        cell.textLabel?.text = "\(user?.phone ?? "") \(user?.email ?? "")"
        return cell
    }
}



