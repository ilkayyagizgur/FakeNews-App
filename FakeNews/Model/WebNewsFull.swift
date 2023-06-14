//
//  WebNewsFull.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 6.06.2023.
//

import Foundation

struct WebNews: Codable, Identifiable {
    let id: Int
    let Orj_Text: String
    let Title: String
    let Image_URL: String
    let label: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "index"
        case Orj_Text
        case Title
        case Image_URL
        case label
    }
    
}
