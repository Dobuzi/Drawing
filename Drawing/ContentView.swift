//
//  ContentView.swift
//  Drawing
//
//  Created by 김종원 on 2020/10/26.
//

import SwiftUI

struct Arrow: Shape {
    let thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addRect(CGRect(x: rect.midX - thickness * 2, y: rect.midY - thickness/2, width: thickness * 2, height: thickness))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY + thickness))
        path.addLine(to: CGPoint(x: rect.midX + 1.5 * thickness, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - thickness))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + thickness))
        
        return path
    }
}

struct ContentView: View {
    @State private var thickness: CGFloat = 50.0
    var body: some View {
        VStack {
            Arrow(thickness: thickness)
            Spacer()
            HStack {
                Text("Thickness")
                Slider(value: $thickness, in: 5...100)
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
