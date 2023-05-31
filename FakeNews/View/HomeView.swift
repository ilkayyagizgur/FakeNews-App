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
        static var allclickedBackground: Color = Color.clear
        static var trueclickedBackground: Color = Color.clear
        static var fakeclickedBackground: Color = Color.clear
        
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
                                    
//                                    HStack{
//
//                                        Button(action: {
//                                            allButtonClicked.toggle()
//                                            
//                                            if allButtonClicked {
//                                                Constants.allclickedBackground = Color("ColorRed")
//                                            } else {
//                                                Constants.allclickedBackground = Color.clear
//                                            }
//
//                                        }, label: {
//
//                                            Text("All")
//                                                .font(.title2)
//                                                .fontWeight(.bold)
//                                                .foregroundColor(allButtonClicked ? Color.white : Color("ColorRed"))
//
//
//                                        })//: BUTTON
//                                        .frame(width: 50)
//                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
//                                        .padding(.horizontal, 10)
//                                        .frame(minWidth: 40, minHeight: 35)
//                                        .background(
//                                            Capsule().stroke(Color.red, lineWidth: 2))
//                                        .background(
//                                            Constants.allclickedBackground.clipShape(Capsule()))
//
//
//
//
//                                        Button(action: {
//
//                                        }, label: {
//                                            Text("True")
//                                                .font(.title2)
//                                                .fontWeight(.bold)
//                                                .foregroundColor(allButtonClicked ? Color.white : Color("ColorRed"))
//
//                                        })//: BUTTON
//                                        .frame(width: 50)
//                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
//                                        .padding(.horizontal, 10)
//                                        .frame(minWidth: 40, minHeight: 35)
//                                        .background(
//                                            Capsule().stroke(Color.red, lineWidth: 2))
//                                        .background(
//                                            Constants.trueclickedBackground.clipShape(Capsule()))
//
//
//                                        Button(action: {
//
//                                        }, label: {
//
//
//                                            Text("Fake")
//                                                .font(.title2)
//                                                .fontWeight(.bold)
//                                                .foregroundColor(allButtonClicked ? Color.white : Color("ColorRed"))
//
//                                        })//: BUTTON
//                                        .frame(width: 50)
//                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
//                                        .padding(.horizontal, 10)
//                                        .frame(minWidth: 40, minHeight: 35)
//                                        .background(
//                                            Capsule().stroke(Color.red, lineWidth: 2))
//                                        .background(
//                                            Color.white.clipShape(Capsule()))
//                                    } //: HSTACK
//                                    .padding()
                                    
                                    
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
