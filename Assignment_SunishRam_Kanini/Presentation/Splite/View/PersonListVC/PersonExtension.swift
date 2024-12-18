//
//  VCExtension.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 17/12/24.
//

import Foundation
import UIKit


extension PersonListVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonListTVC.cellIdentifier(), for: indexPath) as! PersonListTVC
        cell.personData = viewmodel.person
        return cell
     }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 240
    }
}
