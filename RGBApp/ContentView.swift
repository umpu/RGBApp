//
//  ContentView.swift
//  RGBApp
//
//  Created by Andrew Gorbunov on 28.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var red = 0.9
    @State var green = 0.9
    @State var blue = 0.9
    
    
    var body: some View {
        var colors = [red, green, blue]
        var primaryColor = Color(red: red, green: green, blue: blue)
        var secondaryColor = Color(red: 1 - red, green: 1 - green, blue: 1 - blue)
        
        ZStack {
            Color(primaryColor).border(.black.opacity(0.1)).ignoresSafeArea()
            VStack {
                Spacer()
                ForEach(colors, id: \.self) {color in
                    Text("\(color * 100, specifier: "%.0f") %")
                }
                .font(.largeTitle)
                .fontWeight(.black)
                .fontDesign(.rounded)
                .foregroundStyle(secondaryColor)
                
                Spacer()
                Slider(value: $red).tint(.red).padding()
                Slider(value: $green).tint(.green).padding()
                Slider(value: $blue).tint(.blue).padding()
                
                Button("Randomize") {
                    withAnimation {
                        red = Double.random(in: 0...1)
                        green = Double.random(in: 0...1)
                        blue = Double.random(in: 0...1)
                    }
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(secondaryColor)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
