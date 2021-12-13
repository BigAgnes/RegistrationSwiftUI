//
//  String+Extensions.swift
//  RegistrationSwiftUI
//
//  Created by Кристина Максимова on 10.12.2021.
//

import Foundation

extension String {
    
    enum Chars: String {
        case letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        case nums = "0123456789"
    }
    
    func containsOtherThan(_ chars: Chars) -> Bool {
        let set = CharacterSet(charactersIn: chars.rawValue)
        return self.rangeOfCharacter(from: set.inverted) != nil
    }
    
    func isCapitalized() -> Bool {
        return self == self.capitalized
    }
}
