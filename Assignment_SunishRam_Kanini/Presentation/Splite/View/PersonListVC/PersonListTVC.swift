//
//  PersonListTVC.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 17/12/24.
//

import UIKit

class PersonListTVC: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblDOB: UILabel!
    var personData : Person?
    {
        didSet{
            setPersonData()
        }
    }
    func setPersonData(){
        lblName.text    = String.getString(personData?.name)
        lblGender.text  = String.getString(personData?.gender)
        lblDOB.text     = String.getString(personData?.dob)
        lblAge.text    = String.getString(personData?.age)
    }
}
