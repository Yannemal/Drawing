//
//  StartApp.swift

//  Drawing
//  Day43 #100DaysOfSwiftUI by Paul Hudson @TwoStraws
//  Created by yannemal on 22/08/2023.

import SwiftUI

// MARK: - other View / Structs

struct TrapezoidC : Shape {
    var insetAmount: Double
    
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

struct StartApp: View {
    
    // MARK: - DATA Content
    @State private var centre : Double = 400
    
    let gradient = LinearGradient(colors: [Color.indigo ,Color.black],
                                  startPoint: .top, endPoint: .bottom)
    @State private var insetAmount = 25.0
    
    var body: some View {
    // MARK: - someView
    
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
                .offset(y: 90)
                
                VStack {
                    Text("@yannemal - 100DaysOfSwiftUI - ")
                        .padding()
                        .offset(y: 140)
                    
                    NavigationLink("Simple Beginnings", destination: {
                        TriangleView()
                    })
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    //.padding([.horizontal, .vertical])
                    .frame(width: 400, height: 250)
                    .border(ImagePaint(image: Image("brok_grey_9"), scale: 3.0), width: 50)
                    .offset(x: centre, y: 40)
                    .animation(.easeIn(duration: 1.6), value: centre)
                
                    
                        ZStack {
                            
                            HStack {
                                Text("Content :")
                                    .font(.title)
                                .foregroundColor(.white)
                                .offset(x: -80, y: -150)
                                
                                
                            }
                            .frame(width: 400, height: 500)
                            .border(ImagePaint(image: Image("brok_grey_9"), scale: 3.0), width: 50)
                            .offset(y:100)
                            
                            
                     
                            
                            VStack { // two rows
                                
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
                                
                            }
                                .offset(x: -55, y: 10)
                           
                            HStack {
                                Spacer()
                                // next row

                                //can I have an image be the link ?
                                NavigationLink(destination: Blurred()) {
                                    Image("paperstrawPoster")
                                        .resizable()
                                        .scaledToFill()
                                        .shadow(radius: 10)
                                    .frame(width: 60, height: 70)
                                    
                                }
                                
                                NavigationLink("⏢") {
                                    Trapezoid()
                                }
                                .foregroundColor(.white)
                                .font(.system(size: 60))
                                .shadow(radius: 5.0)
                                
                                NavigationLink("🏁") {
                                    Board()
                                }
                                .foregroundColor(.white)
                                .font(.system(size: 60))
                                .shadow(radius: 5.0)
                                
                                NavigationLink("꩜") {
                                    Spiro()
                                }
                                .foregroundColor(.white)
                                .font(.system(size: 60))
                                .shadow(radius: 10.0)
                            }
                            .offset(x: -55, y: -30)
                            
                                HStack {
                                    Spacer()
                                    // next row
                                    
                                    NavigationLink("🪿") {
                                        ImportedPaths()
                                    }
                                    .font(.system(size: 60))
                                    .shadow(radius: 5.0)
                                }
                                .offset(x: -55, y: -50)
                        }
                            .offset(y: 100)
                        
                    }
                    .padding(30)
                    .offset(x: centre)
                    .animation(.easeInOut(duration: 2.6), value: centre)
                } // end VStack
                
                .navigationTitle("Drawing in SwiftUI")
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
