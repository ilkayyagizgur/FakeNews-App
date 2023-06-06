//
//  SlideNewsModel.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 6.06.2023.
//

import SwiftUI

struct SlideNews: Codable, Identifiable, Hashable {
    let id: Int
    let Orj_Text: String
    let Title: String
    let Image_URL: String
    let label: Int
}
