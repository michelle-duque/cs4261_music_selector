//
//  AuthenticationView.swift
//  music_selector
//
//  Created by Michelle Duque on 1/29/24.
//

import SwiftUI
import Combine

private enum FocusableField: Hashable {
    case email
    case password
}

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss

    @FocusState private var focus: FocusableField?

    private func signInWithEmailPassword() {
    Task {
        if await viewModel.signInWithEmailPassword() == true {
            dismiss()
        }
    }
    }

    var body: some View {
        
    VStack {
        Image("spacing_out_imsocool")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: 400, minHeight: 100)

        Text("Log In")
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.white)
            .padding(4)

        HStack {
            Image(systemName: "envelope")
            TextField("Email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .focused($focus, equals: .email)
                .submitLabel(.next)
                .onSubmit {
                self.focus = .password
          }
      }
      .padding()
      .background(Color.white)
      .cornerRadius(10)

    HStack {
        Image(systemName: "key.horizontal")
        SecureField("Password", text: $viewModel.password)
            .focused($focus, equals: .password)
            .submitLabel(.go)
            .onSubmit {
            signInWithEmailPassword()
          }
    }
    .padding()
    .background(Color.white)
    .cornerRadius(10)
    .padding(.bottom, 8)


    if !viewModel.errorMessage.isEmpty {
        VStack {
            Text(viewModel.errorMessage)
                .foregroundColor(Color.red)
        }
    }

    Button(action: signInWithEmailPassword) {
        if viewModel.authenticationState != .authenticating {
          Text("Login")
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
        }
        else {
            ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
        }
    }
    .disabled(!viewModel.isValid)
    .frame(maxWidth: .infinity)
    .buttonStyle(.borderedProminent)

    HStack {
        Text("Or")
        Button(action: { viewModel.switchFlow() }) {
            Text("create an account")
                .foregroundColor(.blue)
        }
        Text("for free :)")
    }
    .foregroundColor(Color.white)
    .padding()
    }
    .padding()
    .background(Color.black)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(AuthenticationViewModel())
    }
}
