//
//  SunMoonView.swift
//  Calculator
//
//  Created by ednardo alves on 10/11/24.
//

import SwiftUI

struct SunMoonView: View {
    
    var lightMode: Bool
    
    var body: some View {
        HStack (spacing: 30) {
//            Image(systemName: "moon")
            Image(systemName: "sun.min")
                .imageScale(.large)
                .foregroundStyle(lightMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor)
            Image(systemName: "moon")
                .imageScale(.large)
                .foregroundStyle(lightMode ? sunOrMoonNotSelectedColor : sunOrMoonSelectedColor)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(secondaryBackgroundColor)
        .cornerRadius(20)
    }
}

#Preview {
    VStack {
        SunMoonView(lightMode: true)
        SunMoonView(lightMode: false)
    }
}
