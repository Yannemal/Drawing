//
//  FlowerView.swift
//  Drawing
//  Day43 #100DaysOfSwiftUI by Paul Hudson @TwoStraws
//  Created by yannemal on 24/08/2023.

import SwiftUI

// MARK: - other View / Structs

struct Flower: Shape {
    var petalOffset = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            // stride is the range  the steps (by:) are radians
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
            // go outside of this for loop and add it to the whole path
        }
        
        return path
    }
}

struct FlowerView: View {
    
    // MARK: - DATA Content
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
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
            }
            VStack {
                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                    .fill(.orange, style: FillStyle(eoFill: true))
                
                Text("Offset")
                Slider(value: $petalOffset, in: -80...500)
                    .padding([.horizontal, .bottom])
                
                Text("Width")
                Slider(value: $petalWidth, in: 2...600)
                    .padding([.horizontal, .bottom])
            }
            // navigation link top right
        } // nav title appears in cmd-build
        .navigationTitle("Flower")
        .navigationBarTitleDisplayMode(.inline)
    } //end someView
    
    /* ***************************************************** */
    /*                                                       */
    /*                      MARK: - METHOD                   */
    /*                                                       */
    /* ***************************************************** */
    
    
} // end FlowerView

struct FlowerView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerView()
    }
}
