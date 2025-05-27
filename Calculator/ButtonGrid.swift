//
//  ButtonGrid.swift
//  First App
//
//  Created by Tejas Naik on 5/10/25.
//

import SwiftUI

enum CalculatorMode {
    case notSet
    case addition
    case subtraction
    case multiplication
    case division
}

struct ButtonGrid: View {
    @Binding var total: String
    @State var currentMode: CalculatorMode = .notSet
    @State var lastButtonWasMode = false
    @State var savedInt = 0
    @State var currentInt = 0
    var body: some View {
        Grid {
            GridRow {
                CalculatorButton(buttonText: "AC", color: .gray, action: clearWasPressed)
                CalculatorButton(buttonText: "+/-", color: .gray)
                CalculatorButton(buttonText: "%", color: .gray)
                CalculatorImageButton(buttonText: "divide", color: .orange, action: modeWasPressed, mode: CalculatorMode.division)
            }
            GridRow {
                CalculatorButton(buttonText: "1", action: numberWasPressed)
                CalculatorButton(buttonText: "2", action: numberWasPressed)
                CalculatorButton(buttonText: "3", action: numberWasPressed)
                CalculatorImageButton(buttonText: "plus", color: .orange, action: modeWasPressed, mode: CalculatorMode.addition)
            }
            GridRow {
                CalculatorButton(buttonText: "4", action: numberWasPressed)
                CalculatorButton(buttonText: "5", action: numberWasPressed)
                CalculatorButton(buttonText: "6", action: numberWasPressed)
                CalculatorImageButton(buttonText: "minus", color: .orange, action: modeWasPressed, mode: CalculatorMode.subtraction)
            }
            GridRow {
                CalculatorButton(buttonText: "7", action: numberWasPressed)
                CalculatorButton(buttonText: "8", action: numberWasPressed)
                CalculatorButton(buttonText: "9", action: numberWasPressed)
                CalculatorImageButton(buttonText: "multiply", color: .orange, action: modeWasPressed, mode: CalculatorMode.multiplication)
            }
            GridRow {
                CalculatorButton(buttonText: "0", width: 147, action: numberWasPressed)
                    .gridCellColumns(2)
                CalculatorButton(buttonText: ".")
                CalculatorImageButton(buttonText: "equal", color: .orange, action: equalWasPressed)
            }
        }
    }
    
    func numberWasPressed(button: CalculatorButton) {
        if lastButtonWasMode {
            lastButtonWasMode = false
            currentInt = 0
        }
        if let totalInt = Int("\(currentInt)" + button.buttonText) {
            currentInt = totalInt
            updateText()
        } else {
            total = "Error"
            currentInt = 0
        }
    }
    
    func modeWasPressed(button: CalculatorImageButton) {
        currentMode = button.mode
        lastButtonWasMode = true
    }
    
    func clearWasPressed(button: CalculatorButton) {
         total = "0"
         currentMode = .notSet
         lastButtonWasMode = false
         savedInt = 0
         currentInt = 0
    }
    
    func equalWasPressed(button: CalculatorImageButton) {
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
        
        if currentMode == .division && savedInt == 0 && currentInt == 0 {
                total = "Indeterminate"
                return
            }
            // Check for division by zero
            else if currentMode == .division && currentInt == 0 {
                total = "Undefined"
                return
            }
        
        if currentMode == .addition {
            savedInt += currentInt
        } else if currentMode == .subtraction {
            savedInt -= currentInt
        } else if currentMode == .multiplication {
            savedInt *= currentInt
        } else if currentMode == .division {
            savedInt /= currentInt
        }
        
        currentInt = savedInt
        updateText()
        lastButtonWasMode = true
    }
    
    func updateText() {
        if currentMode == .notSet {
            savedInt = currentInt
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        total = formatter.string(for: currentInt) ?? "Error"
    }
    
}

#Preview {
    ButtonGrid(total: .constant("1"))
}
