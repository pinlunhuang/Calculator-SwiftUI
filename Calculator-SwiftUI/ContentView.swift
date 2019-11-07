//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by Pinlun on 2019/11/7.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            
            Button(action: {
                print("Button: +")
            }) {
                Text("+")
                    .font(.system(size: 38))
                    .foregroundColor(.white)
                    .frame(width: 88, height: 88)
                    .background(Color("operatorBackground"))
                    .cornerRadius(44)
            }
            
            Button(action: {
                print("Button: +")
            }) {
                Text("+")
                    .font(.system(size: 38))
                    .foregroundColor(.white)
                    .frame(width: 88, height: 88)
                    .background(Color("operatorBackground"))
                    .cornerRadius(44)
            }
            
            Button(action: {
                print("Button: +")
            }) {
                Text("+")
                    .font(.system(size: 38))
                    .foregroundColor(.white)
                    .frame(width: 88, height: 88)
                    .background(Color("operatorBackground"))
                    .cornerRadius(44)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalculatorButton: View {
    
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
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
