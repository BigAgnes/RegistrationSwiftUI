//
//  RegistrationModel.swift
//  RegistrationSwiftUI
//
//  Created by Кристина Максимова on 10.12.2021.
//

import Foundation
import SwiftUI

enum Gender: Int {
    case man, woman, other
}

struct RegistrationModel {
    
    var name: String = ""
    var phone: String = ""
    var age: Float = 0
    var gender: Gender = .man
    var showNotifications = false
    
    var isValid = false
    var isPhoneValid = false
    var isNameValid = false
    
    var nameFieldBorder = Color.fieldBorder
    var phoneFieldBorder = Color.fieldBorder
    
    mutating func validate() {
        
        let isPhoneValid1 =
            phone.count == 11 &&
            phone.first == "8" &&
            !phone.containsOtherThan(.nums)
            
        let isPhoneValid2 =
        phone.count == 12 &&
        phone.prefix(2) == "+7" &&
            !String(phone.suffix(10)).containsOtherThan(.nums)
        
        isPhoneValid = isPhoneValid1 || isPhoneValid2
        
        isNameValid =
        name.count > 0 &&
        name.isCapitalized() &&
        !name.containsOtherThan(.letters)
        
        isValid = isNameValid && (isPhoneValid1 || isPhoneValid2)
        
        phoneFieldBorder = isPhoneValid ? Color.valid : Color.invalid
        nameFieldBorder = isNameValid ? Color.valid : Color.invalid
    }
}