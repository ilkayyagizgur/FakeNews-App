//
//  DetailItemView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct DetailItemView: View {
    
    let fake: News
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openURL) var openURL
    //@State private var showWebView = false
    
    var body: some View {
        
            VStack {
                // BACK BUTTON
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(Color("ColorRed"))
                    })//: BUTTON
                    
                    LogoView()
                        .padding(.leading, 30)
                    
                    Button(action: {
                    }, label: {
                        Image(systemName: "bookmark")
                            .font(.system(size: 22, weight: .regular))
                            .foregroundColor(Color("ColorRed"))
                    })//: BUTTON
                    
                    Button(action: {
                        //showWebView.toggle()
                        openURL(URL(string: fake.DocumentIdentifier)!)
                    }, label: {
                        Image(systemName: "safari")
                            .font(.system(size: 22, weight: .regular))
                            .foregroundColor(Color("ColorRed"))
                    })//: BUTTON
                   // .sheet(isPresented: $showWebView) {
                      //  WebView(url: URL(string: fake.DocumentIdentifier)!)}
                    
                    
                    
                } //: HSTACK
                .padding(.horizontal, 20)
                .padding(.vertical, 19)
                .background(Color("Color"))
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false) {
                    if (fake.label == 0) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding(.vertical, 20)
                            .foregroundColor(Color("ColorRed"))
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding(.vertical, 20)
                            .foregroundColor(Color("ColorBlue"))
                    }
                
                Text(fake.Orj_Text)
                    .font(.system(size: 30, design: .serif))
                    .fontWeight(.semibold)
                    .lineLimit(4)
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.leading)
                    
                
                Divider()
                    .padding(.horizontal, 10)
                
                
                    
                    Text(fake.Orj_Text)
                        .font(.system(.title3, design: .serif))
                        .fontWeight(.regular)
                        .padding()
                        .padding(.horizontal, 20)
                        .lineSpacing(8)
                        .padding(.bottom, 30)
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar{
//                ToolbarItem(placement: .navigationBarLeading) {
//                    HStack{
//                        Button(action: {
//                            presentationMode.wrappedValue.dismiss()
//                        }, label: {
//                            Image(systemName: "chevron.left")
//                                .font(.title)
//                                .foregroundColor(Color("ColorRed"))
//                        })//: BUTTON
//
//                        LogoView()
//
//                        Button(action: {}, label: {
//                            Image(systemName: "bookmark")
//                                .font(.title)
//                                .foregroundColor(Color("ColorRed"))
//                        })//: BUTTON
//                    }
//
//                } //: TOOLBAR ITEM
//            }
//            .padding(.horizontal, 20)
//            .padding(.top, 40)
//            .padding(.vertical, 20)
//            .background(.white)
//            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            
        } //: VSTACK
        
        
        
    
}

struct DetailItemView_Previews: PreviewProvider {
    static let fakes: [News] = Bundle.main.decode("csvjson.json")
    
    static var previews: some View {
        DetailItemView(fake: fakes[1])
            .previewLayout(.sizeThatFits)
    }
}
