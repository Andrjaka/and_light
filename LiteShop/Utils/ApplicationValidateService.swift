//
//  ApplicationValidateService.swift
//  ios-prodd
//
//  Created by Oleh Kulakevych on 22.01.2023.
//

import Foundation

final class ApplicationValidateService {
    
    private init() {}
    
    static var shared = ApplicationValidateService()
    
    public func validate(email: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive) else {
            return false
        }
        return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
    }
    
    public func validate(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    
    func isContainsDigitOrSpecialSymb(string: String) -> Bool {
        
        let hasSpecialCharacters = string.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) != nil
        guard !hasSpecialCharacters else { return true }
        
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = string.rangeOfCharacter(from: decimalCharacters)
        
        if decimalRange != nil {
            return false
        } else {
            return true
        }
    }
    
    func isContainsOnlyDigit(string: String) -> Bool {
        return string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    func isEqualStrings(string1: String, string2: String) -> Bool {
        return string1 == string2
    }
}



