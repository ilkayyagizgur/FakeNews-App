//
//  DetailItemView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct DetailItemView: View {
    
//    let fake: News
    let fake : WebNews
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
                    
//                    Button(action: {
//                    }, label: {
//                        Image(systemName: "bookmark")
//                            .font(.system(size: 22, weight: .regular))
//                            .foregroundColor(Color("ColorRed"))
//                    })//: BUTTON
                    
                    Button(action: {
                        //showWebView.toggle()
//                        openURL(URL(string: fake.DocumentIdentifier)!)
                    }, label: {
                        Image(systemName: "bookmark")
                            .font(.system(size: 22, weight: .regular))
                            .foregroundColor(Color("ColorRed"))
                    })//: BUTTON
                   // .sheet(isPresented: $showWebView) {
                      //  WebView(url: URL(string: fake.DocumentIdentifier)!)}
                    
                    
                    
                } //: HSTACK
                .padding(.horizontal, 20)
                .padding(.vertical, 19)
                .background(Color("Color"))
//                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    AsyncImage(url: URL(string: fake.Image_URL), scale: 2, content: { image in
                        image.resizable()
                    }, placeholder: {
                        ProgressView()
                    })
                    .scaledToFit()
                    .overlay(
                        VStack {
                            
                           Spacer()
                            
                            HStack{
                        if (fake.label == 0) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding(.leading, 10)
                                .padding(.bottom, 10)
                                .foregroundColor(Color("ColorRed"))
                                .background(
                                    Circle()
                                        .fill(Color("Color"))
                                        .frame(width: 40, height: 40, alignment: .center)
                                )
//                                .shadow(color: Color.black, radius: 4, x: 0, y: 0)
                        } else {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("ColorBlue"))
                                .background(
                                    Circle()
                                        .fill(Color("Color"))
                                        .frame(width: 50, height: 50, alignment: .center)
                                )
//                                    .shadow(color: Color.black, radius: 4, x: 0, y: 0)
                                .padding(.leading)
                                .padding(.bottom)
                                
//                                .shadow(color: Color.black, radius: 4, x: 0, y: 0)
                        }
                            
                            
                        Spacer()
                            } //: hstack
                        } //: vstack
                    )
                        
                        Text(fake.Title)
                            .font(.system(size: 30, design: .serif))
                            .fontWeight(.semibold)
                            .lineLimit(4)
                            .padding(.horizontal, 20)
                            .multilineTextAlignment(.center)
                    
                
//                Divider()
//                    .padding(.horizontal, 10)
                
                
                    
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
    static let fakes: [WebNews] = Bundle.main.decode("csvjsonWebFull.json")
    
    static var previews: some View {
        DetailItemView(fake: fakes[1])
            .previewLayout(.sizeThatFits)
    }
}
