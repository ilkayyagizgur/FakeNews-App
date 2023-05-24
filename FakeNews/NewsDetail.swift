//
//  NewsDetail.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import Foundation

class NewsDetail: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: News? = nil
}
