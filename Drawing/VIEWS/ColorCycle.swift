//
//  ColorCycle.swift
//  Drawing
//  Day44 #100DaysOfSwiftUI by Paul Hudson @TwoStraws
//  Created by yannemal on 24/08/2023.

import SwiftUI

// MARK: - other View / Structs
struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
                
            }
        } // endZstack
    }        // methods struct ColorCyclingCircle:
        func color(for value: Int, brightness: Double) -> Color {
            var targetHue = Double(value) / Double(steps) + amount
            
            if targetHue > 1 {
                targetHue -= 1
            }
            
            return Color(hue: targetHue, saturation: 1, brightness: brightness)
        }
        
    }


struct ColorCycle: View {
    // MARK: - DATA Content
    let gradient = LinearGradient(colors: [Color.indigo ,Color.black],
                                  startPoint: .top, endPoint: .bottom)
    
    @State private var colorCycle = 0.0
    
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
                
                Text("ColorCyclingCircle")
                    .padding()
                // spacer pushes it into top safeArea
                Spacer()
            }
            // instance struct  here
            VStack {
                ColorCyclingCircle(amount: colorCycle)
                    .frame(width: 300, height: 300)
                
                Slider(value: $colorCycle)
                    .padding([.horizontal, .vertical])
                    .offset(y: 160)
            }
            
            
        } // end ZStack
    } // endView
    
    
    
    /* ***************************************************** */
    /*                                                       */
    /*                      MARK: - METHOD                   */
    /*                                                       */
    /* ***************************************************** */
    
    
    
}

// MARK: - PREVIEWS

struct ColorCycle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCycle()
    }
}
