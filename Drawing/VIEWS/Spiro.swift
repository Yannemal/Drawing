//
//  Spiro.swift
//  Drawing 10 /10 video
//  100DaysOFSwiftUI
//  Created by yannemal on 28/08/2023.
//

import SwiftUI
// other structs
struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: Double
    
// calculate the Greatest Common Divider
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            // modulus
            a = temp
        }
        return a
    }
    
    func path(in rect: CGRect) -> Path {
       // var path = Path()
        let divisor = gcd(innerRadius, outerRadius)
        
        let outerRadius = Double(self.outerRadius)
        let innerRadius = Double(self.innerRadius)
        let distance = Double(self.distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil(2 * Double.pi * outerRadius / Double(divisor)) * amount
        
        var path = Path()
       
        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
            var y = difference * cos(theta) + distance * sin(difference / outerRadius * theta)
            
            x += rect.width / 2
            y += rect.height / 2
            
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
}

struct Spiro: View {
    // data:
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount = 1.0
    @State private var hue = 0.6
    
    var body: some View {
    // MARK: - someView:
        
        VStack(spacing: 0) {
            NavigationLink("꩜2") {
                SpiroTwo()
            }
            .foregroundColor(.white)
            .font(.system(size: 60))
            .shadow(radius: 10.0)
        }
            Spacer()
            
            Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
                .stroke(Color(hue: hue, saturation: 1, brightness: 0.5), lineWidth: 2)
                .frame(width: 200, height: 200)
            
            Spacer()
            // push it up a little bit
            Group {
                Text("Inner radius: \(Int(innerRadius))")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                // add padding for the slider
                    .padding([.horizontal, .bottom])
                
                Text("Outer radius: \(Int(outerRadius))")
                Slider(value: $outerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("distance: \(Int(distance))")
                Slider(value: $distance, in: 1...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Amount \(amount, format:  .number.precision(.fractionLength(2)))")
                Slider(value: $amount)
                    .padding([.horizontal, .bottom])

                Text("Color")
                Slider(value: $hue)
                    .padding(.horizontal)

                
            }
        
        
    } // end someView
    
} // end struct


// MARK: - PREVIEWS:
struct Spiro_Previews: PreviewProvider {
    static var previews: some View {
        Spiro()
    }
}
