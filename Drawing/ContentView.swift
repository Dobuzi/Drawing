//
//  ContentView.swift
//  Drawing
//
//  Created by 김종원 on 2020/10/26.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 150
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    self.color(for: value, brightness: 1),
                                    self.color(for: value, brightness: 0)
                                ]
                            ),
                            startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth:2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var amount = 0.0
    var body: some View {
        VStack {
            Spacer()
            ColorCyclingRectangle(amount: amount)
                .frame(width: 300, height: 300)
            Spacer()
            HStack {
                Text("Amount: \(amount, specifier: "%.2f")")
                Slider(value: $amount, in: 0...1)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
