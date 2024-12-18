//
//  ManagePersonDetailsVC.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 19/12/24.
//

import UIKit

class ManagePersonDetailsVC: UIViewController {
    @IBOutlet weak var txtFieldName: UITextField!
    @IBOutlet weak var txtFieldGender: UITextField!
    @IBOutlet weak var txtFieldDob: UITextField!
    @IBOutlet weak var txtFieldAge: UITextField!
    var viewModel : PersonViewModel = PersonViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        displayPersonDetails()
    }
    @IBAction func handleGenderTap(_ sender: UIButton) {
        setGenderOption()
    }
    @IBAction func calculateAgeFromDate(_ sender: UIButton) {
        handleDateSelectionAndAge()
     }
    @IBAction func didTapSaveChanges(_ sender: UIBarButtonItem) {
        persistPersonDetails()
    }
 }
