//
//  Trapezoid.swift
//  Drawing
// Day 45
//  Created by yannemal on 27/08/2023.
//

import SwiftUI
// other structs here:
struct TrapezoidB: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
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

struct Trapezoid: View {
    // data :
    @State private var insetAmount = 50.0
    
    let gradient = LinearGradient(colors: [Color.indigo ,Color.black],
                                  startPoint: .top, endPoint: .bottom)
    
    
    var body: some View {
        
        ZStack {
            gradient
                .opacity(0.45)
                .ignoresSafeArea()
            VStack {
                // BIG MOUNTAIN customised NavStack example
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 10)
                    .background(LinearGradient(colors: [.black.opacity(0.3), .blue.opacity(0.5)],
                                               startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                
                Text("CGAffineTransform used in a path")
                    .padding()
                // spacer pushes it into top safeArea
                Spacer()
                
                TrapezoidB(insetAmount: insetAmount)
                    .frame(width: 200, height: 100)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            insetAmount = Double.random(in: 10...90)
                        }
                    
                    }
                
                Spacer()
            }
        }
        // methods :
        
    }
}
struct Trapezoid_Previews: PreviewProvider {
    static var previews: some View {
        Trapezoid()
    }
}
