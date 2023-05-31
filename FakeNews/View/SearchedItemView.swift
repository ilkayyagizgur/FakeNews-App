//
//  SearchedItemView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct SearchedItemView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    @State private var offset = CGSize.zero
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = CGSize(width: 0, height: 0)
    @State private var showAlert = false
    
    let responseData: NewTaskItemView.ResponseData // Add this property
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                    Button(action: {
                        //showAlert = true
                       
                       
                    }, label: {
                        if responseData.label == 1 {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("ColorBlue"))
                        } else {
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
                Text("Probability: \(responseData.prob)") // Use the responseData.label here
                
            } //: HSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            
            
            
        } //: VSTACK
        .frame(width: 350)
        .cornerRadius(12)
        
        
        
       
    }
}

//struct SearchedItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchedItemView(item: item)
//            .previewLayout(.sizeThatFits)
//    }
//}
