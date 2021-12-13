//
//  ContentView.swift
//  RegistrationSwiftUI
//
//  Created by Кристина Максимова on 09.12.2021.
//

import SwiftUI

struct RegistrationView: View {
    
    @ObservedObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Регистрация")
                    .padding(.vertical, 12.0)
                    .font(.system(size: 22))
                
                TextField("Имя", text: $viewModel.name)
                    .overlay(RoundedRectangle(cornerRadius: 2)
                                .stroke(viewModel.nameFieldBorder, lineWidth:  1))
                    .padding(.horizontal, 10.0)
                    .padding(.bottom, 12.0)
                
                TextField("Номер телефона", text: $viewModel.phone)
                    .overlay(RoundedRectangle(cornerRadius: 2)
                                .stroke(viewModel.phoneFieldBorder, lineWidth:  1))
                    .padding(.horizontal, 10.0)
                    .padding(.bottom, 12.0)
                
                HStack {
                    Text("Возраст: \(Int(viewModel.age))")
                        .padding(.leading, 10.0)
                    Spacer()
                }
                
                Slider(value: $viewModel.age, in: 6...99)
                    .padding(.horizontal, 10.0)
                    .padding(.bottom, 12.0)
                Picker("Gender", selection: $viewModel.gender, content: {
                    Text("Мужской").tag(Gender.man)
                    Text("Женский").tag(Gender.woman)
                    Text("Другое").tag(Gender.other)
                })
                    .padding(.horizontal, 10.0)
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 12.0)
                Toggle("Получать уведомления по смс", isOn: $viewModel.showNotifications)
                    .padding(.horizontal, 10.0)
                    .padding(.bottom, 12.0)
                Button("Зарегистировать") {
                    viewModel.madeValidityChanges()
                    
                }.alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text("Ошибка"), message: Text("Неверный логин или пароль"), dismissButton: .cancel())
                }.font(.system(size: 18))
                Spacer()
            }.navigationBarTitle("", displayMode: .inline)
        }
    }
}
