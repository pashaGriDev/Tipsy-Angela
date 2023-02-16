//
//  Brain.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import Foundation

struct Brain {
    
    func isValidCharacter(_ string: String) -> Bool {
        var isValid = false
        
        if let numder = Int(string) {
            switch numder {
            case 0..<10 : isValid = true
            default: isValid = false
            }
        }
        
        return isValid
    }
    
}
