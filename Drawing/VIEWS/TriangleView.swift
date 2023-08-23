//
//  TriangleView.swift
//  Drawing
//  Day43 #100DaysOfSwiftUI by Paul Hudson @TwoStraws
//  Created by yannemal on 22/08/2023.


import SwiftUI

// MARK: - other View / Structs
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // starting point > top-mid  0.0 being top left ?
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        // go to bottom left:
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        // from here draw to bottom right of rect
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        // and back to top-mid  - cant I just close loop ?
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: Shape, InsettableShape {
    // create pre-sets
    let startAngle: Angle
    let endAngle: Angle
    let clockWise: Bool
    //add an easy opt-in for insettable protocol
    var insetAmount = 0.0
    // protocol method:
    func path(in rect: CGRect) -> Path {
        // to ensure 0 degrees is at 12 o'clock and not at maxX, midY
        let rotationAdjustment = Angle.degrees(90) // this is cool: the value is 90degrees
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        //draw path:
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockWise)
        
        return path
    }
    
    // method to enable InsettableShape func w arcs (see radius) and allow strokeBorder to work
    func inset(by amount: CGFloat) -> some InsettableShape {
        // CGFloat > its a double with a different name
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct TriangleView: View {
    // MARK: - DATA Content
    
    // init Class here :
    
    
    var body: some View {
        
        ZStack {
            Color.gray
                .ignoresSafeArea()
                .opacity(0.7)
            
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
            }
            .stroke(.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            
            
            Text("global x and y pos 👆🏼")
                .offset(y: -100)
            // now I can instance the struct Triangle: in the ZStack
            Triangle()
                .stroke(.blue, style: StrokeStyle(lineWidth: 15, lineCap: .square, lineJoin: .round ))
                .frame(width: 300, height: 300)
            Text("shape within a frame")
                .offset(y: 130)
            
            // lets draw the Arc
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockWise: true)
                .stroke(.yellow, lineWidth: 20)
                .frame(width: 300, height: 300)
                .offset(y:240)
            
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockWise: true, insetAmount: 50.0)
                .strokeBorder(.red, lineWidth: 30)
                .offset(y:360)
         
        }
        .navigationTitle("Triangles and Arcs")
        .navigationBarTitleDisplayMode(.inline)
        
        
    } // end body some view THEN

    /* ************************************************************* */
    /*                                                               */
    /*                      MARK: - METHOD                           */
    /*                                                               */
    /* ************************************************************* */
    
} // endContentView


// MARK: - PREVIEW
struct TriangleView_Previews: PreviewProvider {
    static var previews: some View {
      TriangleView()
    }
}

