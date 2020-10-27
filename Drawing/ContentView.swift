//
//  ContentView.swift
//  Drawing
//
//  Created by 김종원 on 2020/10/26.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct ContentView: View {
    @State private var amount: CGFloat = 50
    var body: some View {
        VStack {
            Trapezoid(insetAmount: amount)
                .frame(width: 200, height: 100)
                .onTapGesture(count: 1, perform: {
                    withAnimation {
                        self.amount = CGFloat.random(in: 10...90)
                    }
                })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
