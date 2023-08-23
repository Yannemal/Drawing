//
//  ContentView.swift
//  Drawing
//
//  Created by yann guyt on 22/08/2023.


import SwiftUI

// MARK: - other View / Structs
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // starting point > top-mid  0.0 being top left ?
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        // go to bottom left:
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        // from here draw to bottom right of rect
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        // and back to top-mid  - cant I just close loop ?
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct ContentView: View {
    // MARK: - DATA Content
    
    // init Class here :
    
    
    var body: some View {
        
        ZStack {
            Color.gray
                .ignoresSafeArea()
            .opacity(0.7)
            
                Path { path in
                    path.move(to: CGPoint(x: 200, y: 100))
                    path.addLine(to: CGPoint(x: 100, y: 300))
                    path.addLine(to: CGPoint(x: 300, y: 300))
                    path.addLine(to: CGPoint(x: 200, y: 100))
                }
                .stroke(.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
               
            
            Text("global x and y pos 👆🏼")
                .offset(y: -100)
            // now I can instance the struct Triangle: in the ZStack
            Triangle()
                .stroke(.blue, style: StrokeStyle(lineWidth: 15, lineCap: .square, lineJoin: .round ))
                .frame(width: 300, height: 300)
            Text("shape within a frame")
                .offset(y: 130)
            
        }
        
    } // end body some view THEN
    
    /* ************************************************************* */
    /*                                                               */
    /*                      MARK: - METHOD                           */
    /*                                                               */
    /* ************************************************************* */
    
} // endContentView


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

