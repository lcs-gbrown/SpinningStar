//
//  ContentView.swift
//  SpinningStar
//
//  Created by gabi brown on 2022-04-27.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Stored Properties
   
    //1. Starting position for the star (initial state)
    @State var xOffset = -100.0
    
    // 2. controls rotation of the star
    @State var starRotation = 0.0
    
    //MARK: Computed Properties
    
    var body: some View {
        Image(systemName: "star")
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.yellow)
            .rotation3DEffect(Angle.degrees(starRotation), axis: (x: 0, y: 1, z: 0))
            .offset(x: xOffset, y: 0)
            
            .animation(
                       Animation
                           .easeInOut(duration: 1)
                           .repeatForever(autoreverses: true)
                       )
        // 3. Trigger the animation on a tap
            .onTapGesture {
                // 2. Logic that changes the state
                xOffset = 100
                //SPin the star twice
                starRotation = 360 * 2
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
