//
//  MainView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
                .background(Color("Color"))
            
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            ContentView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
        } //: TAB VIEW
        .tint(Color("TextColor"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
