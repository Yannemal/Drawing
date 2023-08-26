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
    
    let gradient = LinearGradient(colors: [Color.indigo ,Color.black],
                                  startPoint: .top, endPoint: .bottom)
    
    var body: some View {
    
        NavigationStack {
            
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
                    
                    
                    // spacer pushes it into top safeArea
                    Spacer()
                    
                    Text(".stroke with ImagePaint and customised NavStack")
                        .foregroundColor(.gray)
                        .padding()
                }
                VStack {
                    Text("@yannemal - 100DaysOfSwiftUI - ")
                        .padding()
                    
                    NavigationLink("Simple Beginnings", destination: {
                        TriangleView()
                    })
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    //.padding([.horizontal, .vertical])
                    .frame(width: 380, height: 250)
                    .border(ImagePaint(image: Image("brok_grey_9"), scale: 3.0), width: 50)
                    
                    .offset(x: centre, y: -100)
                    .animation(.easeIn(duration: 1.6), value: centre)
                
                    HStack {
                        // mini menu to go directly to pages
                       Spacer()
                        NavigationLink("▲") {
                            TriangleView()
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 70))
                       
                        NavigationLink("⚘") {
                            FlowerView()
                            }
                        .foregroundColor(.white)
                            .font(.system(size: 80))
                        
                        NavigationLink("🔘") {
                            ColorCycle()
                        }
                        .font(.system(size: 60))
                        
                        NavigationLink("🔲") {
                            ImagePainted()
                        }
                        .font(.system(size: 60))
                        
                        NavigationLink("🪿") {
                            importedPaths()
                        }
                        .font(.system(size: 60))
                        .shadow(radius: 5.0)
                    }
                }
                
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
