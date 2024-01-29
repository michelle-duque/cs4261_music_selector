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
            Spacer()
            Text("|")
            Text("v")
            Spacer()
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
