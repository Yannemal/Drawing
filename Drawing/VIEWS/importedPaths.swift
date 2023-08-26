//
//  importedPaths.swift
//  Drawing
//
//  Created by yannemal on 26/08/2023.
// Amos Gyamfi tut to convert SVG to a path and import to XCode

import SwiftUI

struct importedPaths: View {
    // data
    @State private var drawingErasing = false

    var body: some View {
        // UI
        ZStack {
            VStack {
                // BIG MOUNTAIN customised NavStack example
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 10)
                    .background(LinearGradient(colors: [.black.opacity(0.3), .blue.opacity(0.5)],
                                               startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                
                Text("import SVG into a Path")
                    .padding()
                // spacer pushes it into top safeArea
                Spacer()
            }
           // there are several ways to draw a path in SwiftUI but this will use the one with a closure
            // 1. create an empty path
            VStack {
                Path { path in
                    
                    // 2. Move to a starting Position
                    path.move(to: CGPoint(x: 35.8, y: 5))
                   
                    // 3. adds a cubic Bezier curve to the PAth w specified end point and control points.
                    path.addLine(to: CGPoint(x: 14.2, y: 5))
                    path.addCurve(to: CGPoint(x: 5, y: 14.2), control1: CGPoint(x: 9.1, y: 5), control2: CGPoint(x: 5, y: 9.1))
                    path.addLine(to: CGPoint(x: 5, y: 35.8))
                    path.addCurve(to: CGPoint(x: 14.2, y: 45), control1: CGPoint(x: 5, y: 40.9), control2: CGPoint(x: 9.1, y: 45))
                    path.addLine(to: CGPoint(x: 35.8, y: 45))
                    path.addCurve(to: CGPoint(x: 45, y: 35.8), control1: CGPoint(x: 40.9, y: 45), control2: CGPoint(x: 45, y: 40.9))
                    path.addLine(to: CGPoint(x: 45, y: 14.2))
                    path.addCurve(to: CGPoint(x: 35.8, y: 5), control1: CGPoint(x: 45, y: 9.1), control2: CGPoint(x: 40.9, y: 5))
                    path.closeSubpath()
                    path.move(to: CGPoint(x: 35.8, y: 5))

                    path.move(to: CGPoint(x: 36.7, y: 35.9))
                    path.addCurve(to: CGPoint(x: 31.9, y: 34), control1: CGPoint(x: 35.2, y: 33.4), control2: CGPoint(x: 33.6, y: 33.3))
                    path.addCurve(to: CGPoint(x: 25.3, y: 35.8), control1: CGPoint(x: 30.2, y: 34.7), control2: CGPoint(x: 28.3, y: 35.6))
                    path.addCurve(to: CGPoint(x: 11.1, y: 28.1), control1: CGPoint(x: 16.6, y: 36.3), control2: CGPoint(x: 13.1, y: 30.8))
                    path.addCurve(to: CGPoint(x: 25.5, y: 29.5), control1: CGPoint(x: 18.9, y: 32.9), control2: CGPoint(x: 23.4, y: 30.2))
                    path.addCurve(to: CGPoint(x: 13.5, y: 16.3), control1: CGPoint(x: 20, y: 26.1), control2: CGPoint(x: 13.5, y: 16.3))
                    path.addCurve(to: CGPoint(x: 23.5, y: 23.9), control1: CGPoint(x: 13.5, y: 16.3), control2: CGPoint(x: 21.1, y: 22.3))
                    path.addCurve(to: CGPoint(x: 17, y: 15), control1: CGPoint(x: 22.2, y: 22.6), control2: CGPoint(x: 18.3, y: 17.4))
                    path.addCurve(to: CGPoint(x: 29.3, y: 25.3), control1: CGPoint(x: 18.9, y: 17.2), control2: CGPoint(x: 27.1, y: 23.8))
                    path.addCurve(to: CGPoint(x: 27, y: 13), control1: CGPoint(x: 30.3, y: 19.5), control2: CGPoint(x: 29.1, y: 17.2))
                    path.addCurve(to: CGPoint(x: 34.6, y: 29), control1 : CGPoint(x: 37, y: 20.1), control2: CGPoint(x: 34.6, y: 29))
                    path.addCurve(to: CGPoint(x: 36.7, y: 35.9), control1: CGPoint(x: 37, y: 31.5), control2: CGPoint(x: 36.9, y: 33.6))
                    path.closeSubpath()
                    // 4. close and complete current subPath
                    path.move(to: CGPoint(x: 36.7, y: 35.9))
     
                    // Move to start position
                }
                // .stroke(lineWidth: 1)
                 // trim must be used first.
                .trim(from: drawingErasing ? 0 : 1, to: 1)

                .offset(x: 170, y: 180)
                .scale(2.0, anchor: .center)
                // .foregroundColor(.red)
                .fill(.cyan)
                .onAppear{
                    withAnimation(.easeInOut(duration: 4)
                        .delay(1)
                        .repeatForever(autoreverses: true)) {
                            drawingErasing.toggle()
                        }
                    
                }
                
               Text(
"""
🐇  went down rabbit hole on SVG: a standard for vector graphics used online, low on data.

1* found an SVG file to play with on Icons8.com.

2* Opened SVG file with Chrome browser > right-click to 'inspect' opens raw data

3* website: http://svg-converter.kyome.io/  place raw data + box data to convert to Swift.
   use XCode to fix code from controlPoint1 to control1 and control2
or use: https://svg-to-swiftui.quassum.com/

4* Amos Gyamfi https://www.youtube.com/watch?v=lelBu8q-XZk

"""
                     )
            }
        
        } //endZStack
    } // end someView
    
    //methods
    
} //end View

struct importedPaths_Previews: PreviewProvider {
    static var previews: some View {
        importedPaths()
    }
}

/*
 
 // there are several ways to draw a path in SwiftUI but this will use the one with a closure
  Path { path in
      // 1. create an empty path
      
      // 2. Move to a starting Position
      
      // 3. adds a cubic Bezier curve to the PAth w specified end point and control points.
      
      // 4. close and complete current subPath
      
      // Move to start position
  }
 
 
 let path = UIBezierPath()
 path.move(to: CGPoint(x: 35.8, y: 5))
 path.addLine(to: CGPoint(x: 14.2, y: 5))
 path.addCurve(to: CGPoint(x: 5, y: 14.2), controlPoint1: CGPoint(x: 9.1, y: 5), controlPoint2: CGPoint(x: 5, y: 9.1))
 path.addLine(to: CGPoint(x: 5, y: 35.8))
 path.addCurve(to: CGPoint(x: 14.2, y: 45), controlPoint1: CGPoint(x: 5, y: 40.9), controlPoint2: CGPoint(x: 9.1, y: 45))
 path.addLine(to: CGPoint(x: 35.8, y: 45))
 path.addCurve(to: CGPoint(x: 45, y: 35.8), controlPoint1: CGPoint(x: 40.9, y: 45), controlPoint2: CGPoint(x: 45, y: 40.9))
 path.addLine(to: CGPoint(x: 45, y: 14.2))
 path.addCurve(to: CGPoint(x: 35.8, y: 5), controlPoint1: CGPoint(x: 45, y: 9.1), controlPoint2: CGPoint(x: 40.9, y: 5))
 path.close()
 path.move(to: CGPoint(x: 36.7, y: 35.9))
 path.addCurve(to: CGPoint(x: 31.9, y: 34), controlPoint1: CGPoint(x: 35.2, y: 33.4), controlPoint2: CGPoint(x: 33.6, y: 33.3))
 path.addCurve(to: CGPoint(x: 25.3, y: 35.8), controlPoint1: CGPoint(x: 30.2, y: 34.7), controlPoint2: CGPoint(x: 28.3, y: 35.6))
 path.addCurve(to: CGPoint(x: 11.1, y: 28.1), controlPoint1: CGPoint(x: 16.6, y: 36.3), controlPoint2: CGPoint(x: 13.1, y: 30.8))
 path.addCurve(to: CGPoint(x: 25.5, y: 29.5), controlPoint1: CGPoint(x: 18.9, y: 32.9), controlPoint2: CGPoint(x: 23.4, y: 30.2))
 path.addCurve(to: CGPoint(x: 13.5, y: 16.3), controlPoint1: CGPoint(x: 20, y: 26.1), controlPoint2: CGPoint(x: 13.5, y: 16.3))
 path.addCurve(to: CGPoint(x: 23.5, y: 23.9), controlPoint1: CGPoint(x: 13.5, y: 16.3), controlPoint2: CGPoint(x: 21.1, y: 22.3))
 path.addCurve(to: CGPoint(x: 17, y: 15), controlPoint1: CGPoint(x: 22.2, y: 22.6), controlPoint2: CGPoint(x: 18.3, y: 17.4))
 path.addCurve(to: CGPoint(x: 29.3, y: 25.3), controlPoint1: CGPoint(x: 18.9, y: 17.2), controlPoint2: CGPoint(x: 27.1, y: 23.8))
 path.addCurve(to: CGPoint(x: 27, y: 13), controlPoint1: CGPoint(x: 30.3, y: 19.5), controlPoint2: CGPoint(x: 29.1, y: 17.2))
 path.addCurve(to: CGPoint(x: 34.6, y: 29), controlPoint1: CGPoint(x: 37, y: 20.1), controlPoint2: CGPoint(x: 34.6, y: 29))
 path.addCurve(to: CGPoint(x: 36.7, y: 35.9), controlPoint1: CGPoint(x: 37, y: 31.5), controlPoint2: CGPoint(x: 36.9, y: 33.6))
 path.close()
 
 */
