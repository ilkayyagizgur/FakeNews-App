//
//  SearchView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var insertNews: String = ""
    @State private var textEditorText: String = ""
    @State private var label: Int = 1
    
    @State var askedNews: [String] = []
    
    private var isButtonDisabled: Bool {
        textEditorText.isEmpty
    }
    
    var body: some View {
        VStack{
            LogoView()
                .padding(.vertical, 20)
                .background(Color("Color"))
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            
            Spacer()
            
            VStack(spacing: 20){
                
//                List{
//                    ForEach(askedNews, id: \.self) { news in
//                        Text(news)
//                    }
//                }
                
                
                
                Spacer()
            
//            TextField("Write Here", text: $insertNews)
//                .padding()
//                .foregroundColor(Color("ColorRed"))
//                .font(.system(size: 24, weight: .semibold, design: .default))
//                .background(colorBackground)
//                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
//                .padding()
                
                TextEditor(text: $textEditorText)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                    .padding()

            
                
            Button(action: {
                //askedNews.append(textEditorText)
            }, label: {
                Spacer()
                Text("SAVE")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                Spacer()
            })
            .disabled(isButtonDisabled)
            .padding()
            .foregroundColor(.white)
            .background(isButtonDisabled ? Color.gray : Color("ColorRed"))
            .cornerRadius(10)
            .padding(.horizontal, 50)
            .padding(.vertical)
            
            } //: VSTACK
            Spacer()
        } //: VSTACK
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
