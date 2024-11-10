//
//  ComputationView.swift
//  Calculator
//
//  Created by ednardo alves on 10/11/24.
//

import SwiftUI

struct ComputationView: View {
    
    let currentComputation: String
    let mainResult: String
    
    var body: some View {
        VStack (spacing: 15){
            HStack {
                Spacer()
                Text(currentComputation)
                    .foregroundStyle(foregroundDigitsColor)
                    .lineLimit(1)
            }
            .minimumScaleFactor(0.1)
            HStack {
                Spacer()
                Text(mainResult)
                    .foregroundStyle(foregroundDigitsColor)
                    .lineLimit(1)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .minimumScaleFactor(0.1)
        }.padding(.horizontal)
    }
}

#Preview {
    VStack {
        ComputationView(currentComputation: "5+1", mainResult: "6")
    }
}
