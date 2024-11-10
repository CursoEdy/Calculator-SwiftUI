//
//  CalcButtonView.swift
//  Calculator
//
//  Created by ednardo alves on 10/11/24.
//

import SwiftUI

struct CalcButtonView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    var body: some View {
        Text("Calc Buttons")
    }
}

#Preview {
    CalcButtonView(currentComputation: .constant("5+4"), mainResult: .constant("9"))
}
