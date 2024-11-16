//
//  StringHelperFunctions.swift
//  Calculator
//
//  Created by ednardo alves on 15/11/24.
//

import Foundation


//retorna ultimo caracter se existir
func getLastChar(str: String) -> String{
//    if str.isEmpty {
//        return ""
//    }else {
//        return String(str.last!)
//    }
    
    return str.isEmpty ? "" : String(str.last!)
}

//retorna verdadeiro se um caracter str for igual a char
func lastCharacterIsEqualTo(str: String, char: String) -> Bool{
    return getLastChar(str: str) == char
}

func formatResult(val: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    
    return numberFormatter.string(from: NSNumber(value: val)) ?? "0"
}

func lastCharIsDigit(str: String) -> Bool {
    return "0123456789".contains(getLastChar(str: str))
}

func lastCharIsDigitOrPercent(str: String) -> Bool {
    return "0123456789%".contains(getLastChar(str: str))
}

func lastCharacterIsAnOperator(str: String) -> Bool {
    let last = getLastChar(str: str)
    return operators.contains(last)
}
