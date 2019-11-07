//
//  CalculatorButtonItem.swift
//  Calculator-SwiftUI
//
//  Created by Pinlun on 2019/11/7.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import Foundation
import SwiftUI

enum CalculatorButtonItem: Hashable {
    
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case multiply = "×"
        case divide = "÷"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)

}

extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var size: CGSize {
        CGSize(width: 88, height: 88)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot:
            return "digitBackground"
        case .op:
            return "operatorBackground"
        case .command:
            return "commandBackground"
        }
    }
}
