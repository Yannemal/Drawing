//
//  ContentView.swift
//  Drawing
//
//  Created by yann guyt on 22/08/2023.


import SwiftUI

// MARK: - other View / Structs


struct ContentView: View {
    // MARK: - DATA Content
    
    // init Class here :
    
    
    var body: some View {
        
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            .opacity(0.7)
            
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
            }
            .stroke(.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            
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

