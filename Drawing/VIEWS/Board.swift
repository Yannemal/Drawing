//
//  Board.swift
//  Drawing
//  D45 Animatable PAir
//  Created by yannemal on 27/08/2023.
//

import SwiftUI

//other struct that should really be its onw separate file
struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData : AnimatablePair<Double, Double> {
        get {
            AnimatableData(Double(rows), Double(columns))
        }
        set {
            rows =    Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
     
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
    
}

// MARK: - someVIEW
struct Board: View {
//data
    @State private var rows = 4
    @State private var columns = 4
    
    
    var body: some View {
        //someView
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 2)) {
                    rows = 6
                    columns = 12
                }
                
            }
    } // end someView
} // end struct

struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Board()
    }
}
