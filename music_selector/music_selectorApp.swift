//
//  music_selectorApp.swift
//  music_selector
//
//  Created by Michelle Duque on 1/28/24.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
//    Auth.auth().useEmulator(withHost: "localhost", port: 9099)
    return true
  }
}

@main
struct music_selectorApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AuthenticatedView {
                    ZStack {
                        Image("opening_image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 400, minHeight: 100)

                        VStack {
                            VStack {
                                Text("Is it the full moon?")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    
                                Text("(You need to be logged in to use this app.)")
                                    .foregroundColor(Color.black)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                    }
                    
                } content: {
                    ContentView()
                    Spacer()
                }
            }
        }
    }
}
