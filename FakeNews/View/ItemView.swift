//
//  ItemView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 5.06.2023.
//

import SwiftUI

struct ItemView: View {
    // MARK: - PROPERTY
    
    let item: Item
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Text(item.orj_text ?? "")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(item.completion ? .green : .primary)
            
            Text("Label: \(String(item.label))")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(item.timestamp ?? Date(), style: .date)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

