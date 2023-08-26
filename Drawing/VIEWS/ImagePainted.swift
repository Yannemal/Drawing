//
//  ImagePainted.swift
//  Drawing
//
//  Created by yannemal on 26/08/2023.
//

import SwiftUI

struct ImagePainted: View {
    
    //Data
    let gradient = LinearGradient(colors: [Color.indigo ,Color.black],
                                  startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        
        ZStack {
            
            gradient
            .opacity(0.45)
            .ignoresSafeArea()
            
            VStack {
                // BIG MOUNTAIN customised NavStack example doesnt work here
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 10)
                    .background(LinearGradient(colors: [.black.opacity(0.3), .blue.opacity(0.5)],
                                               startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                
                Text("☺️")
                    .padding()
                // spacer pushes it into top safeArea
                Spacer()
            }
                        Image("Piixel__418")
                .resizable(resizingMode: .tile)
                .scaleEffect(5.0)
                .frame(width: 190, height: 190)
                .border(ImagePaint(image: Image("brok_grey_9"), scale: 3.0), width: 50)
        } // end ZStack
        .navigationTitle("ImagePaint for Border and resizingMode: tiling for View")
        .background(.black)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct ImagePainted_Previews: PreviewProvider {
    static var previews: some View {
        ImagePainted()
    }
}
