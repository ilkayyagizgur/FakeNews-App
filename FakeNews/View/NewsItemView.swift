//
//  NewsItemView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct NewsItemView: View {
    
//    let fake: News
    let fake : WebNews
    @State private var showAlert = false
    @State private var bookmark: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: fake.Image_URL), scale: 2, content: { image in
                image.resizable()
            }, placeholder: {
                ProgressView()
            })
            .scaledToFit()
            .overlay{
            
                VStack {
                    HStack {
                        Spacer()
                        if bookmark {
                            Image(systemName: "bookmark.fill")
                                .foregroundColor(Color.yellow)
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
                                .font(.system(size: 30, weight: .regular))
                                .padding(.trailing)
                                .padding(.top)
                        }
                    }
                    Spacer()
                }
            }
            
            
            
            HStack(spacing: 10) {
                   
                        if (fake.label == 0) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("ColorRed"))
                                .padding(.horizontal, 7)
                        } else {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("ColorBlue"))
                                .padding(.horizontal, 7)
                        }
                 
                
                Text(fake.Title)
                    .font(.system(.title2, design: .serif))
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .foregroundColor(Color("TextColor"))
                    .multilineTextAlignment(.leading)
                
                
                
                
            } //: HSTACK
            .padding(.horizontal, 10)
            .padding(.top, 10)
            Divider()
                .padding(.horizontal, 10)

        } //: VSTACK
        .frame(width: 350)
        .background(Color("Color 1"))
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.8), radius: 5, x: 0, y: 0)
        
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static let fakes: [WebNews] = Bundle.main.decode("csvjsonWebFull.json")
    
    static var previews: some View {
        NewsItemView(fake: fakes[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
