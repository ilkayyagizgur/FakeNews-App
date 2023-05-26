//
//  HomeView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct HomeView: View {
    
    let fakes: [News] = Bundle.main.decode("csvjson.json")
    @State var allButtonClicked: Bool = false
    
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
        static var buttonDisabled: Bool = true
        static var clickedBackground: Color = Color.clear
    }
    
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
                                    
                                    HStack{
                                        
                                        Button(action: {
                                            allButtonClicked.toggle()
                                            
                                            if allButtonClicked {
                                                Constants.clickedBackground = Color("ColorRed")
                                            } else {
                                                Constants.clickedBackground = Color.clear
                                            }
                                            
                                        }, label: {
                                            
                                            Text("All")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(allButtonClicked ? Color.black : Color("ColorRed"))
                                            
                                            
                                        })//: BUTTON
                                        .frame(width: 50)
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                        .padding(.horizontal, 10)
                                        .frame(minWidth: 40, minHeight: 35)
                                        .background(Constants.clickedBackground)
                                        
                                        
                                        
                                        Button(action: {
                                            
                                        }, label: {
                                            Text("True")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("ColorRed"))
                                            
                                        })//: BUTTON
                                        .frame(width: 50)
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                        .padding(.horizontal, 10)
                                        .frame(minWidth: 40, minHeight: 35)
                                        .background(
                                            Capsule().stroke(Color.red, lineWidth: 2))
                                        
                                        
                                        Button(action: {
                                            
                                        }, label: {
                                            
                                            
                                            Text("Fake")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("ColorRed"))
                                            
                                        })//: BUTTON
                                        .frame(width: 50)
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                        .padding(.horizontal, 10)
                                        .frame(minWidth: 40, minHeight: 35)
                                        .background(
                                            Capsule().stroke(Color.red, lineWidth: 2))
                                    } //: HSTACK
                                    .padding()
                                    
                                    
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
