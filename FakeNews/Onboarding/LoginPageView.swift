//
//  LoginPageView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 27.06.2023.
//

import SwiftUI
import Firebase

struct LoginPageView: View {
    
    class LoginCoordinator: ObservableObject {
        @Published var showMainView = false
    }
    
    

    
    @StateObject private var coordinator = LoginCoordinator()
    @EnvironmentObject var userData: UserData
    
    @State private var showRegister = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var screenWidth: CGFloat {
            UIScreen.main.bounds.width
        }
        
        var screenHeight: CGFloat {
            UIScreen.main.bounds.height
        }
    
    func login() {
        if username != "" && password != "" {
            Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
                
            } else {
                print("success")
                coordinator.showMainView = true

                username = ""
                password = ""
                }
            }
        }
    }
    
    var body: some View {
        NavigationView{
            VStack {
                HStack(spacing: 0){
                    
                    ZStack {
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("ColorRed"), Color("ColorBlue")]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 300, height: 300)
                        
                        
                        Image("HeaderFakeIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250, alignment: .leading)
                    }
                
                    
                    Spacer()
                } //: HSTACK
                .padding(.top, 40)
                .shadow(color: Color.gray.opacity(0.7), radius: 5, x: 0, y: 0)
                Spacer()
                
                
                VStack{
                    
                    HStack {
                        Text("Login")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(.black)
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
                                .stroke(LinearGradient(gradient: Gradient(colors: [Color("ColorRed"), Color("ColorBlue")]), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                        )
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocapitalization(.none)
                        .padding(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(LinearGradient(gradient: Gradient(colors: [Color("ColorRed"), Color("ColorBlue")]), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                        )
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            login()
                        }) {
                            
                            HStack {
                                Text("Login".uppercased())
                                    .font(Font.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.white)
                                    .font(Font.system(size: 20, weight: .bold))
                                
                            }
                            
                        } //: LOGINBUTTON
                        .padding(.vertical, 18)
                        .padding(.horizontal, 28)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("ColorRed"), Color("ColorBlue")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .frame(width: 170)
                        .padding(.vertical, 20)
                        .padding(.trailing, 20)
                        .shadow(color: Color.gray.opacity(0.7), radius: 5, x: 0, y: 0)
                    }
                    
                    ZStack(alignment: .center) {
                        Divider()
                            .frame(height: 1)
                            .padding(.horizontal)
                        Text("OR".uppercased())
                            .font(.headline)
                            .background(Color.white)
                            .padding(.horizontal, 10)
                    }
                    .padding(.vertical, 8)
                    
                    
                    Button(action: {
                        // go to signup page
                        
                        showRegister.toggle()
                       
                    }) {
                        HStack {
                            Text("Don't have an account?")
                                .font(.callout)
                                .foregroundColor(.black)
                            
                            Text("Register")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(Color("ColorBlue"))
                            
                        }
                    } //: REGISTER BUTTON
                    .padding()
                    .sheet(isPresented: $showRegister) {
                                RegisterPageView()
                            }
                }
                
                Spacer()
                
            } //: VSTACK
            
        }
        .fullScreenCover(isPresented: $coordinator.showMainView) {
                    MainView()
                        .environmentObject(userData)
                }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
        }
    }


struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
