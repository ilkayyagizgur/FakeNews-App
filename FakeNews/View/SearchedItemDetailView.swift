//
//  SearchedItemDetailView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 30.05.2023.
//

import SwiftUI

struct SearchedItemDetailView: View {
    
    @ObservedObject var item: Item
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
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
                    
                   
                    
                } //: HSTACK
                .padding(.horizontal, 20)
                .padding(.vertical, 19)
                .background(Color("Color"))
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false) {
//                    if (fake.label == 0) {
//                        Image(systemName: "exclamationmark.triangle.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 150, height: 150)
//                            .padding(.vertical, 20)
//                            .foregroundColor(Color("ColorRed"))
//                    } else {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding(.vertical, 20)
                            .foregroundColor(Color("ColorBlue"))
//                    }
                
                Text(item.orj_text ?? "not found")
                    .font(.system(size: 30, design: .serif))
                    .fontWeight(.semibold)
                    .lineLimit(4)
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.leading)
                    
                
                Divider()
                    .padding(.horizontal, 10)
                
                
                    
                    Text(item.orj_text ?? "not found")
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

//struct SearchedItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchedItemDetailView()
//    }
//}
