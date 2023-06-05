//
//  LogoView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
            HStack(spacing: 4){
                    Spacer()
                
                Text("Fake".uppercased())
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundColor(Color("ColorRed"))
                        
                Image("HeaderFakeIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28, alignment: .center)
                    .padding(.horizontal, 5)
                
                    
                Text("News".uppercased())
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundColor(.blue)
                    Spacer()
            } //: HSTACK
         
        
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
