//
//  StartApp.swift

//  Drawing
//  Day43 #100DaysOfSwiftUI by Paul Hudson @TwoStraws
//  Created by yannemal on 22/08/2023.

import SwiftUI

// MARK: - other View / Structs

struct StartApp: View {
    
    // MARK: - DATA Content
    @State private var centre : Double = 400
    
    var body: some View {
    
        NavigationStack {
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                    .opacity(0.7)
                
                NavigationLink("Simple Beginnings", destination: {
                    TriangleView()
                })
                .foregroundColor(.white)
                .font(.largeTitle)
                //.padding([.horizontal, .vertical])
                .frame(width: 380, height: 250)
                .border(.black, width: 50)
                
                .offset(x: centre, y: -100)
                .animation(.easeIn(duration: 1.6), value: centre)
                
                
                .navigationTitle("Day 43")
            } // end ZStack
            .onAppear {
                centre = 0
            }
        } // end NavStack
    } //end someView
     
    
    /* ***************************************************** */
    /*                                                       */
    /*                      MARK: - METHOD                   */
    /*                                                       */
    /* ***************************************************** */
    
    
} //end start app view

struct StartApp_Previews: PreviewProvider {
    static var previews: some View {
        StartApp()
    }
}
