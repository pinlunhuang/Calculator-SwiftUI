//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by Pinlun on 2019/11/7.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {

//    @State private var logic: CalculatorLogic = .left(0)
    @ObservedObject var model = CalculatorModel()
    @State private var editingHistory = false
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("History: \(model.history.count)"){
                self.editingHistory = true
            }.sheet(isPresented: self.$editingHistory) {
                HistoryView(model: self.model)
            }
            Text(model.logic.output)
                .font(.system(size: 76.0))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .trailing)
            
            CalculatorButtonPad(model: model)
                .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        Group {
//            ContentView()
//            ContentView().previewDevice("iPhone SE")
//        }
        
    }
}

struct CalculatorButton: View {
    
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let foregroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width/2)
        }
    }
}

struct CalculatorButtonRow: View {
//    @Binding var logic: CalculatorLogic
    let row: [CalculatorButtonItem]
    var model: CalculatorModel
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                title: item.title,
                size: item.size,
                backgroundColorName: item.backgroundColorName,
                foregroundColor: item.foregroundColor)
                {
                    self.model.apply(item)
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
//    @Binding var logic: CalculatorLogic
    var model: CalculatorModel
    
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row, model: self.model)
            }
        }
    }
}

struct HistoryView: View {
    @ObservedObject var model: CalculatorModel
    
    var body: some View {
        VStack {
            if model.totalCount == 0 {
                Text("No History Yet")
            } else {
                HStack {
                    Text("History").font(.headline)
                    Text("\(model.historyDetail)").lineLimit(nil)
                }
                HStack {
                    Text("Shown").font(.headline)
                    Text("\(model.logic.output)")
                }
                Slider(
                    value: $model.slidingIndex,
                    in: 0...Float(model.totalCount),
                    step: 1)
            }
        }.padding()
    }
}
