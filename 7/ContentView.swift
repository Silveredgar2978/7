//
//  ContentView.swift
//  7
//
//  Created by TEC on 20/04/26.
//  This is just the first screen of my app
// Differences with python
// python      |         swift

// x = 5       |        var x = 5
//   -         |        let x = 5 //Constant variable (never changes)
//def greet()  |     func greet() {}
//"hello"      |        "hello"
//print("hi")  |         print("hi")
//if x > 0:    |         if x > 0 {}
// [1,2,3]     |         [1,2,3]
//{"key": "val"}|        ["key": "val"]

// variables have types and don't change
// swift uses curly braces instead of indentations to define blocks

import SwiftUI
//same import as python
// SwiftUI is Apple's toolkit for building bisual iPhone interfaces
// without this nothing visual works

struct ContentView: View {
    //'struct' is like a class in python - a blueprint
    // 'ContentView' is the name of the screen
    // ': View' means this scrren follows SwiftUI's rules for being a screen
    // every screen in SwiftUI is a struct that says ': View'
    
    @State private var isVisible = false
    // @State - swiftUI- specific keyword. when this variable changes aurtomatically rebuild screen
    // In SwiftUI @State is a type of variable that connect to what the user sees
    // private means only this struct (class in python) can use this variable
    // var is a changing variable just like in python
    // isVisible starts as false - the "7" starts invisible
    
    @State private var scale: CGFloat = 0.8
    // another @State variable
    // 'CGFloat' is Swift number type for visual measurements
    // like float in python, but for graphics
    // scale starts at 0.8 (the 7 starts at 80% of real size)
    
    var body: some View {
        //Every SwiftUI screen must have a property called 'body'
        // This is where you describe what the screen looks like
        // 'some View' means " this returns something visual"
        // Think of body like a __str__ method in python it defines what gets shown
        
        ZStack {
            //ZStack layers things on top of each other- like PHotoshop Layers
            // Z = depth axis (front to back)
            // Things listed later in the ZStack appear in Front
            // We use it to put "7" on top of the black backround
            
            Color.black
                .ignoresSafeArea()
            // color.black fills the screen with black
            // .ignoresSafeArea() makes it go behind the camera notch and home bar
            // without this you'd see white edges at top and bottom
            
            Text("7")
            // Text() displays string "7" on the iphone screen.  print() is for the terminal
            
                .font(.system(size: 120, weight: .ultraLight, design: .serif))
                //.font() sets the typography
                //.system() uses apples built in system font - to not import new font
                // weight: .ultralight - thinnest possible stroke very elegant
                // design: .serif - adds small decorative strokes on letters
            
                .foregroundColor(.white)
                // Sets text color to white
                // white on black
            
                .opacity(isVisible ? 1 : 0)
                // this basically just says that if the isVisible variable is true then opacity is 1, else 0
                // opacity: 1 = fully visible, 0 = invisible
                // isVisible ? 1 : 0 is Swift's ternary operator
            
                .scaleEffect(scale)
                // scales the elemt by the value of 'scale'
                // Starts at 0.8 will grow to 1
                // creates a subtle zoom-in effect
            
                .animation(.easeOut(duration: 1.2), value: isVisible)
                // Smooth animation whenever isVisible changes
                // easeOut = starts fast, slows down at the end. Feels natural
                // duration: 1.2second
        }
        .onAppear {
            isVisible = true
            scale = 1.0
        }
        // .onAppear runs the moment this screen appears on screen
        // Like a setup blocok that fires automatically
        // isVisible = true > triggers the fade-in animation
        // scale = 1.0 > triggers teh grow-in animation
        // Both fire at the same time > the 7 fades in while growing slightly
    }
}

#Preview {
    ContentView()
}
