//
//  MainView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var userData = UserData()
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
                .background(Color("Color"))
            
            ContentView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            ProfilePageView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }
            
        } //: TAB VIEW
        .environmentObject(userData)
        .tint(Color("TextColor"))
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
