//
//  InfoVC.swift
//  ContactsApp
//
//  Created by Евгений Забродский on 4.12.22.
//

import UIKit

class InfoVC: UIViewController {
    
    //MARK: - Properties
    
    var user: User?

    @IBOutlet weak var infoView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(user?.name ?? "nil") \(user?.surname ?? "nil")"
        infoView.dataSource = self
        title = "Info"
    }
    
}

extension InfoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let phone = user?.phone
        let email = user?.email
        let cell = UITableViewCell()
        cell.textLabel?.text = indexPath.row == 0 ? email : phone
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}
