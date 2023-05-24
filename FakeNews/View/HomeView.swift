//
//  HomeView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct HomeView: View {
    
    let fakes: [News] = Bundle.main.decode("csvjson.json")
    
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    
    var body: some View {
        NavigationView{
            Color("Color")
                .ignoresSafeArea()
                .overlay(
                    VStack {
                        LogoView()
                            .padding(.vertical, 20)
                            .background(Color("Color"))
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            withAnimation(.easeIn) {
                                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                                    ForEach(fakes) { fake in
                                        NavigationLink(destination: DetailItemView(fake: fake)) {
                                            NewsItemView(fake: fake)
                                                .padding(.vertical, 8)
                                        }//:LINK
                                    }//: LOOP
                                }//: GRID
                            } //: ANIMATION
                        } //: SCROLL
                    } //: VSTACK
                )
        } //: NAVIGATION
        .frame(maxWidth: 640)
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
