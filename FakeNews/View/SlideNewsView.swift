//
//  SlideNewsView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 6.06.2023.
//

import SwiftUI

struct SlideNewsView: View {
    
    let fakesWeb: [SlideNews] = Bundle.main.decode("csvjsonWeb.json")
    
    var body: some View {
        TabView {
            ForEach(fakesWeb) { item in
                AsyncImage(url: URL(string: item.Image_URL), scale: 2, content: { image in
                    image.resizable()
                }, placeholder: {
                    ProgressView()
                })
                .scaledToFit()
                .overlay(
                    VStack {
                        HStack {
                            if (item.label == 0) {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color("ColorRed"))
                                    .padding(.leading, 30)
                                    .padding(.top, 30)
                            } else if (item.label == 1) {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Color("ColorBlue"))
//                                    .background(
//                                        Circle()
//                                            .fill(Color.white)
//                                            .frame(width: 50, height: 50, alignment: .center)
//                                    )
                                    .shadow(color: Color.black, radius: 4, x: 0, y: 0)
                                    .padding(.leading, 7)
                                    .padding(.top, 7)
                                    
                            }
                            Spacer()
                        } //: HSTACK
                        
                        Spacer()
                            Text(item.Title)
                               .font(.system(.title3, design: .serif))
                               .padding(1)
                               .foregroundColor(.white)
                               .background(Color.black.opacity(0.6).cornerRadius(8))
                               .padding(.bottom, 30)
                               .padding(.horizontal, 13)
                               .multilineTextAlignment(.center)
                    } //: VSTACK
                        .cornerRadius(12)
                        .padding(.top, 10)
                        .padding(.horizontal, 15)
                )
            } //: LOOP
            .cornerRadius(12)
        }//: TABVIEW
        .padding(.horizontal, 10)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct SlideNewsView_Previews: PreviewProvider {
    static let fakesWeb: [SlideNews] = Bundle.main.decode("csvjsonWeb.json")
    static var previews: some View {
        SlideNewsView()
            .background(.gray)
            .previewLayout(.sizeThatFits)
    }
}
