//
//  CalcButtonView.swift
//  Calculator
//
//  Created by ednardo alves on 10/11/24.
//

import SwiftUI

struct calcButtonModel: Identifiable {
    let id = UUID()
    let calcButton: CalcButton
    var color: Color = foregroundDigitsColor
}

struct RowOfCalcButtonModel: Identifiable {
    let id = UUID()
    let row: [calcButtonModel]
}

struct CalcButtonView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttonData: [RowOfCalcButtonModel] = [
        RowOfCalcButtonModel(row: [
            calcButtonModel(calcButton: .clear, color: foregroundTopButtonsColor),
            calcButtonModel(calcButton: .negative, color: foregroundTopButtonsColor),
            calcButtonModel(calcButton: .percent, color: foregroundTopButtonsColor),
            calcButtonModel(calcButton: .divide, color: foregroundRightButtonsColor)
        ]),
        RowOfCalcButtonModel(row: [
            calcButtonModel(calcButton: .seven),
            calcButtonModel(calcButton: .eight),
            calcButtonModel(calcButton: .nine),
            calcButtonModel(calcButton: .multiply, color: foregroundRightButtonsColor)
        ]),
        RowOfCalcButtonModel(row: [
            calcButtonModel(calcButton: .four),
            calcButtonModel(calcButton: .five),
            calcButtonModel(calcButton: .six),
            calcButtonModel(calcButton: .divide, color: foregroundRightButtonsColor)
        ]),
        RowOfCalcButtonModel(row: [
            calcButtonModel(calcButton: .one),
            calcButtonModel(calcButton: .two),
            calcButtonModel(calcButton: .three),
            calcButtonModel(calcButton: .add, color: foregroundRightButtonsColor)
        ]),
        RowOfCalcButtonModel(row: [
            calcButtonModel(calcButton: .undo),
            calcButtonModel(calcButton: .zero),
            calcButtonModel(calcButton: .decimal),
            calcButtonModel(calcButton: .equal, color: foregroundRightButtonsColor)
        ])
    ]
    
    var body: some View {
        Grid {
            ForEach (buttonData) { rowOfCalcButtonModel in
                GridRow {
                    ForEach(rowOfCalcButtonModel.row) {
                        calcbuttonModel in
                        Button (action: {
                            //logic takes place here
                            print("Button pressed")
                        }, label: {
                            ButtonView(
                                calcButton: calcbuttonModel.calcButton,
                                fgColor: calcbuttonModel.color,
                                bgColor: buttonBackgroundColor)
                        })
                    }
                }
            }
        }
        .padding()
        .background(secondaryBackgroundColor.cornerRadius(20))
    }
}

#Preview {
    CalcButtonView(currentComputation: .constant("5+4"), mainResult: .constant("9"))
}
