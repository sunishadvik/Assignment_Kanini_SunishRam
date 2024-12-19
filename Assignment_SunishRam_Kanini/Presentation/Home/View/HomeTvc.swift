//
//  HomeTvc.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 18/12/24.
//

import UIKit

class HomeTvc: UITableViewCell {
     @IBOutlet weak var lblPersonName: UILabel!
     @IBOutlet weak var lblPersonAge: UILabel!
     @IBOutlet weak var lblGender: UILabel!
     @IBOutlet weak var lblDob: UILabel!
    
    var personData : Person?
    {
        didSet{
            setPersonData()
        }
    }
    
    func setPersonData() {
        lblPersonName.text   = String.getString(personData?.name)
        lblGender.text  = String.getString(personData?.gender)
        lblDob.text    = String.getString(personData?.dob)
        lblPersonAge.text    = String.getString(personData?.age)
    }
}
