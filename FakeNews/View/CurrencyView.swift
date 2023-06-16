//
//  CurrencyView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 17.06.2023.
//

import SwiftUI

struct CurrencyView: View {
    
    var currencyValue: Double = 23.06
    var labelText: String = "DOLAR"
    var currencyImage: String = "dollarsign"
    
    private let decimalFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 2 // Set the desired number of decimal places
            formatter.maximumFractionDigits = 2
            return formatter
        }()
    
    var body: some View {
        HStack {
                Image(systemName: "\(currencyImage)")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .opacity(0.9)
                
                Text("\(labelText)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .opacity(0.9)
                
                Text(decimalFormatter.string(from: NSNumber(value: currencyValue)) ?? "")
                .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.headline)
            } //: HSTACK
            .padding()
            .background(Color("ColorBlue"))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 0)
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
            .previewLayout(.sizeThatFits)
    }
}
