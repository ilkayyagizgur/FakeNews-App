//
//  ProfilePageView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 19.07.2023.
//

import SwiftUI

struct ProfilePageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button("Logout") {
                   presentationMode.wrappedValue.dismiss()
               }
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
