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
            calcButtonModel(calcButton: .subtract, color: foregroundRightButtonsColor)
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
                            buttonPressed(calcButton: calcbuttonModel.calcButton)
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
    
    func buttonPressed(calcButton: CalcButton){
        //logica
        switch calcButton {
        case .clear:
            currentComputation = ""
            mainResult = "0"
        case .decimal:
            print("decimal")
        case .equal, .negative:
            if !currentComputation.isEmpty {
                if !lastCharacterIsAnOperator(str: currentComputation) {
                    let sign = calcButton == .negative ? -1.0 : 1.0
                    
                    mainResult = formatResult(val: sign * calculateResults())
                    
                    if calcButton == .negative {
                        currentComputation = mainResult
                    }
                }
                print()
            }
        case .undo:
            //remove o ultimo caracter da string
            currentComputation = String(currentComputation.dropLast())
        case .add, .multiply, .subtract, .divide:
            if lastCharIsDigitOrPercent(str: currentComputation){
                appendToCurrentComputation(calcButton: calcButton)
            }
        case .percent:
            if lastCharIsDigit(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
        default:
            appendToCurrentComputation(calcButton: calcButton)
        }
        
        
    }
    
    func calculateResults() -> Double {
        let visibleWorkings: String = currentComputation
        var workings = visibleWorkings.replacingOccurrences(of: "%", with: "*0.01")
        workings = workings.replacingOccurrences(of: multiplySymbol, with: "*")
//        workings = workings.replacingOccurrences(of: divisionSymbol, with: "/")
        
        // if we have "45."this will br replaced
        //by ""45.0"
        if getLastChar(str: visibleWorkings) == "." {
            workings += "0"
        }
        
        let expr = NSExpression(format: workings)
        let exprValue = expr.expressionValue(with: nil, context: nil) as! Double
        
        return exprValue
    }
    
    func appendToCurrentComputation(calcButton: CalcButton){
        currentComputation += calcButton.rawValue
    }
}

#Preview {
    CalcButtonView(currentComputation: .constant("5+4"), mainResult: .constant("9"))
}
