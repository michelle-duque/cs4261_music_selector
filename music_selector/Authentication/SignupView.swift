//
//  SignupView.swift
//  music_selector
//
//  Created by Michelle Duque on 1/29/24.
//

import SwiftUI
import Combine

private enum FocusableField: Hashable {
    case email
    case password
    case confirmPassword
}

struct SignupView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss

    @FocusState private var focus: FocusableField?

    private func signUpWithEmailPassword() {
        Task {
            if await viewModel.signUpWithEmailPassword() == true {
            dismiss()
            }
        }
    }

    var body: some View {
    VStack {
        Image("my_true_form")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(maxWidth: 400, minHeight: 100)
        
        Text("Sign up")
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity, alignment: .leading)
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
            .submitLabel(.next)
            .onSubmit {
                self.focus = .confirmPassword
            }
    }
    .padding()
    .background(Color.white)
    .cornerRadius(10)

    HStack {
        Image(systemName: "key.horizontal")
        SecureField("Confirm password", text: $viewModel.confirmPassword)
          .focused($focus, equals: .confirmPassword)
          .submitLabel(.go)
          .onSubmit {
            signUpWithEmailPassword()
          }
    }
    .padding()
    .background(Color.white)
    .cornerRadius(10)
    


    if !viewModel.errorMessage.isEmpty {
        VStack {
            Text(viewModel.errorMessage)
                .foregroundColor(Color(UIColor.systemRed))
        }
    }

    Button(action: signUpWithEmailPassword) {
        if viewModel.authenticationState != .authenticating {
            Text("Sign up")
                .frame(maxWidth: .infinity)
                .padding()
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
    .padding()

    HStack {
        Text("Already have an account?")
        Button(action: { viewModel.switchFlow() }) {
            Text("Log in")
                .fontWeight(.semibold)
                .foregroundColor(.blue)
        }
    }
    .foregroundColor(Color.white)
    .padding()
    }
    .padding()
    .background(Color.black)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
    Group {
        SignupView()
        SignupView()
            .preferredColorScheme(.dark)
    }
    .environmentObject(AuthenticationViewModel())
    }
}
