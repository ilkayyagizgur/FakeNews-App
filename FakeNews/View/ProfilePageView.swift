//
//  ProfilePageView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 19.07.2023.
//

import SwiftUI
import Firebase

struct ProfilePageView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        VStack {
            
            Text("Username: \(userData.username)")
            
//            DisclosureGroup("Bookmark"){
//
//            }
//            .padding()
            
            Button("Logout") {
                do {
                    try Auth.auth().signOut()
                    presentationMode.wrappedValue.dismiss()
                } catch {
                    print("logoutClicked error in ProfilePageView")
                }
               
            } //: BUTTON
            
        } //: VSTACK
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
