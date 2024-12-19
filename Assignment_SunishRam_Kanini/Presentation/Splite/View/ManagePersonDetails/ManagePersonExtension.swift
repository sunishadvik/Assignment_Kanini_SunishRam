//
//  AddUpdatePersonExtnsn.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 18/12/24.
//

import Foundation
import UIKit
 
extension ManagePersonDetailsVC {
     func displayPersonDetails() {
         if viewModel.isUpdate{
             txtFieldName.text   = String.getString(viewModel.person?.name)
            txtFieldAge.text    = String.getString(viewModel.person?.age)
            txtFieldDob.text    = String.getString(viewModel.person?.dob)
            txtFieldGender.text = String.getString(viewModel.person?.gender)  
        }
    }
    func persistPersonDetails() {
        let validation = AddPersonValidation()
        let person = Person(name: txtFieldName.text, age: txtFieldAge.text, gender: txtFieldGender.text, dob: txtFieldDob.text, id: viewModel.isUpdate ? viewModel.person!.id : UUID())
        validation.validateInputPersonData(person: person ) {validationResult in
            if validationResult.success {
                if viewModel.isUpdate {
                    if viewModel.manager.updatePerson(person:person){
                       dismiss(animated: true)
                    }
                }else{
                    if viewModel.manager.createPerson(person:person){
                        dismiss(animated: true)
                    }
                }
            } else if let error = validationResult.error {
                ManagePersonDetailsVC.showOkAlert(on: self, title: CommonStringValue.appName, message: "\(error.localizedDescription)")
            }
        }
    }
    func setGenderOption() {
        let picker = RSPickerView.init(view: self.view, arrayList: Constant.genderTypes, keyValue: nil, handler: {[weak self](selectedIndex:NSInteger,response:Any?) in
            self?.txtFieldGender.text = Constant.genderTypes[selectedIndex]
          })
          picker.viewContainer.backgroundColor = .white
    }
    func handleDateSelectionAndAge(){
        DatePickerHelper.showDatePicker(on: self.view, completion: { [weak self] selectedDate,calculatedAge  in
            self?.txtFieldDob.text = String.getString(selectedDate)
            self?.txtFieldAge.text = String.getString(calculatedAge) + CommonStringValue.year
        })
    }
}
