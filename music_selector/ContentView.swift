//
//  ContentView.swift
//  music_selector
//
//  Created by Michelle Duque on 1/28/24.
//

import SwiftUI

var fullMoon: Bool = false
var displayFullMoon: Bool = false


struct ContentView: View {
    
    var body: some View {
        ZStack {
            Image("full_moon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 700, minHeight: 100)
            
            VStack {
                Button(action: {
                    displayFullMoon.toggle()
                    }, label: {
                        Text("IS IT THE FULL MOON YET?")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: 400)
                            .foregroundColor(Color.black)
                            .background(Color.red)
                            .cornerRadius(10)
                            .padding(70)
                })
                if displayFullMoon {
                    if fullMoon {
                        Text("OH YEAH ITS THE FULL MOON")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(4)
                    }
                    else {
                        Text("NOOOOO ITS NOT THE FULL MOON YET")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(4)
                    }
                }
            }
            .foregroundColor(.accentColor)
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
