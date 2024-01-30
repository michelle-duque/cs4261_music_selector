//
//  UserProfileView.swift
//  music_selector
//
//  Created by Michelle Duque on 1/29/24.
//

import SwiftUI


struct UserProfileView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    @State var presentingConfirmationDialog = false

    private func deleteAccount() {
        Task {
            if await viewModel.deleteAccount() == true {
                dismiss()
            }
        }
    }

    private func signOut() {
        viewModel.signOut()
    }

    var body: some View {
        ZStack {
            Image("profile_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 700, minHeight: 100)
            
            Form {
                Section {
                    VStack {
                        HStack {
                            Spacer()
                            Image("default_profile_pic")
                                .resizable()
                                .frame(width: 100 , height: 100)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .clipped()
                                .padding(4)
                                .overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
                                Spacer()
                        }
                    }
                }
                .listRowBackground(Color(UIColor.systemGroupedBackground))
                Section("Email") {
                    Text(viewModel.displayName)
                }
                Section {
                    Button(role: .cancel, action: signOut) {
                        HStack {
                            Spacer()
                            Text("Sign out")
                            Spacer()
                        }
                    }
                }
                Section {
                    Button(role: .destructive, action: { presentingConfirmationDialog.toggle() }) {
                        HStack {
                            Spacer()
                            Text("Delete Account")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .confirmationDialog("Deleting your account is permanent. Do you want to delete your account?",
                            isPresented: $presentingConfirmationDialog, titleVisibility: .visible) {
                Button("Delete Account", role: .destructive, action: deleteAccount)
                Button("Cancel", role: .cancel, action: { })
            }
        }
        }
        
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UserProfileView()
                .environmentObject(AuthenticationViewModel())
        }
    }
}
