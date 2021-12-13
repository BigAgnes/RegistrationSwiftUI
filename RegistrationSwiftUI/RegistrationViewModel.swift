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
    @Published var name: String = ""
    @Published var phone: String = ""
    @Published var age: Float = 34.0
    @Published var gender: Gender = .man
    @Published var showNotifications = true
    
    @Published var nameFieldBorder = Color.fieldBorder
    @Published var phoneFieldBorder = Color.fieldBorder

    func madeValidityChanges() {
        modelData.name = name
        modelData.phone = phone
        modelData.age = age
        modelData.gender = gender
        modelData.showNotifications = showNotifications
        
        modelData.validate()
        
        nameFieldBorder = modelData.nameFieldBorder
        phoneFieldBorder = modelData.phoneFieldBorder
        
        if modelData.isValid {
            print("Имя: \(modelData.name)\nТелефон: \(modelData.phone)\nВозраст: \(Int(modelData.age))\nПол: \(modelData.gender)\nСмс-оповещение: \(modelData.showNotifications)")
        } else {
            showingAlert.toggle()
        }
    }
}
