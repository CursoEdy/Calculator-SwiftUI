//
//  ContentView.swift
//  Calculator
//
//  Created by ednardo alves on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            MainCalculator()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
