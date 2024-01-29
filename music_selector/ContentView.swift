//
//  ContentView.swift
//  music_selector
//
//  Created by Michelle Duque on 1/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Listen >:)")
            Image(systemName: "arrowshape.right.fill").rotationEffect(.degrees(90))
            Button(action: {
                true
                }, label: {
                    Image(systemName: "music.note")
            })
            .imageScale(.large)
            .foregroundColor(.accentColor)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
