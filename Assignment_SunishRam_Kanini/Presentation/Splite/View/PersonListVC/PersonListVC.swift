//
//  PersonListVC.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 17/12/24.
//

import UIKit

class PersonListVC: UITableViewController {
    @IBOutlet weak var tblPersons: UITableView!
    var viewmodel : PersonViewModel = PersonViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
