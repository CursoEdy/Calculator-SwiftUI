//
//  ButtonView.swift
//  Calculator
//
//  Created by ednardo alves on 11/11/24.
//

import SwiftUI

struct ButtonView: View {
    let calcButton: CalcButton
    
    let fgColor: Color
    let bgColor: Color
    
    var systemImage: String? {
        let value = calcButton.rawValue
        return value.contains("IMG") ? value.replacingOccurrences(of: "IMG", with: "") : nil
    }
    
    var text: String? {
        let value = calcButton.rawValue
        
        return value.contains("IMG") ? nil : value
    }
    
    let buttonDim: CGFloat = UIScreen.main.bounds.width / 5
    
    var body: some View {
        ZStack {
            Text(text ?? "")
            Image(systemName: systemImage ?? "")
        }
        .font(.title)
        .fontWeight(.semibold)
        .frame(width: buttonDim, height: buttonDim)
        .foregroundColor(fgColor)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: bgColor.opacity(0.6), radius: 5, x: 5, y: 5)
//        .overlay(RoundedRectangle(cornerRadius: 15).stroke(primaryBackgroundColor, lineWidth: 1))
    }
}

#Preview {
    VStack {
        ButtonView(calcButton: .undo, fgColor: foregroundDigitsColor, bgColor: buttonBackgroundColor)
//        ButtonView(calcButton: .negative, fgColor: foregroundDigitsColor, bgColor: buttonBackgroundColor)
//        ButtonView(calcButton: .one, fgColor: foregroundDigitsColor, bgColor: buttonBackgroundColor)
//        ButtonView(calcButton: .add, fgColor: foregroundRightButtonsColor, bgColor: buttonBackgroundColor)
//        ButtonView(calcButton: .percent, fgColor: foregroundTopButtonsColor, bgColor: buttonBackgroundColor)
    }
}
