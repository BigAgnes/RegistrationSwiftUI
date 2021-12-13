//
//  ViewModel.swift
//  RegistrationSwiftUI
//
//  Created by Кристина Максимова on 09.12.2021.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    
    @Published private var modelData = RegistrationModel()
    @Published var showingAlert = false
    var nameFieldBorder = Color.fieldBorder
    var phoneFieldBorder = Color.fieldBorder
    
    var name: String {
        get {
            modelData.name
        }
        set {
            modelData.name = newValue
        }
    }
    var phone: String {
        get {
            modelData.phone
        }
        set {
            modelData.phone = newValue
        }
    }
    var age: Float {
        get {
            modelData.age
        }
        set {
            modelData.age = newValue
        }
    }
    var gender: Gender {
        get {
            modelData.gender
        }
        set {
            modelData.gender = newValue
        }
    }
    var showNotifications: Bool {
        get {
            modelData.showNotifications
        }
        set {
            modelData.showNotifications = newValue
        }
    }

    func madeValidityChanges() {
    
        modelData.validate()
        
        if modelData.isValid {
            print("Имя: \(modelData.name)\nТелефон: \(modelData.phone)\nВозраст: \(Int(modelData.age))\nПол: \(modelData.gender)\nСмс-оповещение: \(modelData.showNotifications)")
        } else {
            showingAlert.toggle()
        }
        
        phoneFieldBorder = modelData.isPhoneValid ? Color.valid : Color.invalid
        nameFieldBorder = modelData.isNameValid ? Color.valid : Color.invalid
    }
}
