//
//  ContentView.swift
//  SwiftUI_ReusableViews
//
//  Created by Siddharth sen on 2/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20){
            MainButtonView(title: "Got it",type: .primary(withArrow: true)) {
                print("Got it!!")
            }
            MainButtonView(title: "Clear All",type: .secondary(withArrow: true)) {
                print("yes cleared")
            }
            MainButtonView(title: "Cancel", type: .destructive(withArrow: false)) {
                print("Cancel!!")
            }
        }
        .padding(20)
        .background(Color.backgroundColor)
    }
} 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
