//
//  ContentView.swift
//  Drawing
//
//  Created by 김종원 on 2020/10/26.
//

import SwiftUI

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    public var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        for row in 0..<rows {
            for col in 0..<columns {
                if (row + col).isMultiple(of: 2) {
                    let startX = columnSize * CGFloat(col)
                    let startY = rowSize * CGFloat(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}

struct ContentView: View {
    @State private var rows = 4
    @State private var columns = 4
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture(count: 1, perform: {
                withAnimation(.linear(duration: 0.1)) {
                    self.rows = 8
                    self.columns = 16
                }
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
