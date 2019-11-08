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
    
    @Published var logic: CalculatorLogic = .left("0")
    
    @Published var history: [CalculatorButtonItem] = []
    
    var historyDetail:String {
        history.map{ $0.description }.joined()
    }
    
    var temporaryKept: [CalculatorButtonItem] = []
    
    var totalCount: Int{
        history.count + temporaryKept.count
    }
    
    var slidingIndex: Float = 0 {
        didSet {
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    
    func keepHistory(upTo index: Int) {
        precondition(index <= totalCount, "Out of index")
        
        let total = history + temporaryKept
        
        history = Array(total[..<index])
        temporaryKept = Array(total[index...])
        
        logic = history.reduce(CalculatorLogic.left("0")) {
            result, item in
            result.apply(item: item)
        }
    }
    
    
    func apply(_ item: CalculatorButtonItem) {
        logic = logic.apply(item: item)
        history.append(item)
        
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
}
