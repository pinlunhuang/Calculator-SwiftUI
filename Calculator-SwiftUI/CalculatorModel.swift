//
//  CalculatorModel.swift
//  Calculator-SwiftUI
//
//  Created by Pinlun on 2019/11/8.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import Foundation
import Combine

class CalculatorModel: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    var logic: CalculatorLogic = .left("0") {
        willSet {
            objectWillChange.send()
        }
    }
    
}
