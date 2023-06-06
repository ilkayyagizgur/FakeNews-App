//
//  SearchedItemView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct SearchedItemView: View {
    
    @Environment(\.managedObjectContext) var viewContext
//    @ObservedObject var item: Item
    @State private var offset = CGSize.zero
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = CGSize(width: 0, height: 0)
    @State private var showAlert = false
    let item: Item
    
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                HStack(spacing: 10) {
                    Button(action: {
                        //showAlert = true
                    }, label: {
                        if item.label == 1 {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("ColorBlue"))
                        } else if item.label == 0{
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("ColorRed"))
                        }
                    })//: BUTTON
                    .padding(.horizontal, 7)
                    
                    Text(item.orj_text ?? "not found")
                        .font(.system(.title2, design: .serif))
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .foregroundColor(Color("TextColor"))
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                } //: HSTACK
                .padding(.horizontal, 10)
                .padding(.top, 10)
                
                Divider()
                    .padding(.horizontal, 10)
                VStack{
                    HStack{
                        Text("Probability: \(item.prob)")
                            .font(.system(size: 15, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 10)
                            .padding(.leading, 7)
                        Spacer()
                    }
                    
                }
                
                
                
            } //: VSTACK
            .frame(width: 350)
            .background(Color("Color 1"))
            .cornerRadius(12)
            
            
            
        } //:ZTACK
//        .onAppear {
//            if responseData.label == 1 {
//                item.completion = true
//            } else if responseData.label == 0 {
//                item.completion = false
//            }
//        }
        
        
       
    }
}

//struct SearchedItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchedItemView(item: item)
//            .previewLayout(.sizeThatFits)
//    }
//}
