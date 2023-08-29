//
//  blurred.swift
//  Drawing
//
//  Created by yannemal on 26/08/2023.
//

import SwiftUI

struct Blurred: View {
    // DATA
    let gradient = LinearGradient(colors: [Color.indigo ,Color.black],
                                  startPoint: .top, endPoint: .bottom)
    @State private var amount = 0.0
    
    var body: some View {
        // someView
        
        ZStack {
            
            gradient
            // .opacity(0.45)
            .ignoresSafeArea()
            
            Image("paperstraw")
              .resizable()
              .scaledToFit()
           .frame(width: 400, height: 1200)
              .colorMultiply(.indigo)
          
//                Rectangle()
//              .fill(.green)
//              .blendMode(.darken)
//              .opacity(0.3)

            VStack {
                ZStack {
                    Circle()
                        .fill(Color(red: 1, green: 0, blue: 0))
                        .frame(width: 200 * amount)
                        .animation(.easeInOut(duration: 1.0), value: amount)
                        .offset(x: -50, y: -80)
                        .blendMode(.screen)
                    
                    Circle()
                        .fill(Color(red: 0, green: 1, blue: 0))
                        .frame(width: 200 * amount)
                        .offset(x: 50, y: -80)
                        .animation(.easeInOut(duration: 2.0), value: amount)
                        .blendMode(.screen)
                    
                    Circle()
                        .fill(Color(red: 0, green: 0, blue: 1 ))
                        .frame(width: 200 * amount)
                        .blendMode(.screen)
                        .animation(.easeInOut(duration: 4.0), value: amount)

                }
                .frame(width: 300, height: 300)
                
               Slider(value: $amount)
                        .padding()
                        .offset(y: 120)
                
            }
            
            
            Text("blurred")
                .foregroundColor(.accentColor)
                .font(.system(size: 80))
            .padding()
            .offset(y: 200)
            .blur(radius: amount * 5.9)
            .animation(.easeInOut(duration: 3.0), value: amount)
    
            
        } // end ZStack
        
    } // end someView
    
} // end struct

struct blurred_Previews: PreviewProvider {
    static var previews: some View {
        Blurred()
    }
}
