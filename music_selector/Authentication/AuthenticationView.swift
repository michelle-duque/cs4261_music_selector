//
//  AuthenticationView.swift
//  music_selector
//
//  Created by Michelle Duque on 1/29/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack {
            NavigationLink {
                Text("hello")
            } label: {
                Text("Sign up with Email")
            }
        }
        .navigationTitle("Sign In")
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AuthenticationView()
        }
    }
}
