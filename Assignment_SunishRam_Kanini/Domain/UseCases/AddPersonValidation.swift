//
//  Validation.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 17/12/24.
//

import Foundation
 
enum ValidationError: Error, LocalizedError {
    case emptyName
    case emptyGender
    case emptyDob
    var errorDescription: String? {
        switch self {
        case .emptyName:
            return "Enter your name"
        case .emptyGender:
            return "Select gender"
        case .emptyDob:
            return "Select date of birth"
        }
    }
}
struct ValidationResult {
    let success: Bool
    let error: ValidationError?
}
struct AddPersonValidation {
    func validateInputPersonData(person: Person, completionHandler: (_ validationResult: ValidationResult) -> Void) {
        if person.name?.isEmpty == true {
            completionHandler(ValidationResult(success: false, error: .emptyName))
        } else if person.gender?.isEmpty == true {
            completionHandler(ValidationResult(success: false, error: .emptyGender))
        } else if person.dob?.isEmpty == true {
            completionHandler(ValidationResult(success: false, error: .emptyDob))
        } else {
            completionHandler(ValidationResult(success: true, error: nil))
        }
    }
}
 
