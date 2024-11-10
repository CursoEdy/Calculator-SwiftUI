
import SwiftUI

struct MainCalculator: View {
    
    @State var lightMode: Bool = true
    
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        ZStack {
            
            primaryBackgroundColor
                .ignoresSafeArea()
            
            VStack {
                
                SunMoonView(lightMode: lightMode)
                    .onTapGesture {
                        withAnimation{
                            lightMode.toggle()
                        }
                    }
                
                Spacer()
                
                ComputationView(
                    currentComputation: currentComputation, mainResult: mainResult)
                
                Spacer()
                
                CalcButtonView(
                    currentComputation: $currentComputation, mainResult: $mainResult)
            }
        }
        .environment(\.colorScheme, lightMode ? .light : .dark)
    }
}

#Preview {
    MainCalculator()
}
