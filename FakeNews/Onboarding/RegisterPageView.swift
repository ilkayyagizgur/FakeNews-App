//
//  RegisterPageView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 19.07.2023.
//

import SwiftUI
import Firebase

struct RegisterPageView: View {
    
    class LoginCoordinator: ObservableObject {
        @Published var showMainView = false
    }
    
    @StateObject private var coordinator = LoginCoordinator()
    
    @Environment(\.dismiss) var dismiss
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    func signUp() {
            if password == confirmPassword {
                Auth.auth().createUser(withEmail: username, password: password) { (result, error) in
                    if let error = error {
                        self.alertMessage = error.localizedDescription
                        self.showAlert = true
                    } else {
                        print("User signed up successfully!")
                        coordinator.showMainView = true
                        username = ""
                        password = ""
                    }
                }
            } else {
                self.alertMessage = "Passwords do not match."
                self.showAlert = true
            }
        }
    
    var body: some View {
        VStack{
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    dismiss()
                }) {
                    
                    Image(systemName: "arrow.down.circle.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.trailing, 30)
                        .padding(.top, 20)
                    
            } //: DISSMIS BUTTON
            }
            
            
            VStack {
                    Image("HeaderFakeIcon")
                            .resizable()
                            .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .leading)
                
            } //: VSTACK
            .padding(.top, 20)
            
            Spacer()
            
                HStack {
                    Text("Register")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                        .padding(.vertical, 8)
                    Spacer()
                }
                .padding(.leading)
                
                TextField("Username", text: $username)
                    .textFieldStyle(PlainTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 1.5)
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 1.5)
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(PlainTextFieldStyle())
                .autocapitalization(.none)
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 1.5)
                )
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    signUp()
                }) {
                    
                    HStack {
                        Text("Sign Up".uppercased())
                            .font(Font.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                            .font(Font.system(size: 20, weight: .bold))
                        
                    }
                    
                } //: LOGINBUTTON
                .padding(.vertical, 18)
                .padding(.horizontal, 28)
                .cornerRadius(12)
                .frame(width: 170)
                .padding(.vertical, 20)
                .padding(.trailing, 20)
                .shadow(color: Color.gray.opacity(0.7), radius: 5, x: 0, y: 0)
            }
            
           Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("ColorRed"), Color("ColorBlue")]), startPoint: .leading, endPoint: .trailing))
        .fullScreenCover(isPresented: $coordinator.showMainView) {
                    MainView()
                }
        .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
    }
}

struct RegisterPageView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPageView()
    }
}
