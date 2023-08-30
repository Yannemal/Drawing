//
//  SpiroTwo.swift
//  Drawing 10 /10 video
//  100DaysOFSwiftUI
//  Created by yannemal on 30/08/2023.
//

import SwiftUI

struct SpiroTwo: View {
    // data:
    @State private var innerRadius = 56.0
    @State private var outerRadius = 61.0
    @State private var distance = 80.0
    @State private var amount = 0.5
    @State private var hue = 0.6
    
    @State private var rotation = 0.0
    
    var body: some View {
    // MARK: - someView:
        
        VStack(spacing: 0) {
            Spacer()
            
            Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
                .stroke(Color(hue: hue, saturation: 1, brightness: 0.5), lineWidth: 2)
                //.animation(.easeOut(duration: 4.0))
                .frame(width: 100, height: 100)
                // changing size frame has no effect ?
                .rotationEffect(.degrees(rotation))
            
            Spacer()
            // push it up a little bit
           
            }
        .onAppear {
            withAnimation(.easeInOut(duration: 8.0)
                .repeatForever(autoreverses: true)) {
                   innerRadius = 116.0
                   outerRadius = 46.0
                   distance = 124.0
                   amount = 0.86
                    // why do only hue and rotation animate ?
                   hue = 0.8
                   rotation = 360
                }
         }
        
    } // end someView
    
} // end struct


// MARK: - PREVIEWS:
struct SpiroTwo_Previews: PreviewProvider {
    static var previews: some View {
        SpiroTwo()
    }
}

