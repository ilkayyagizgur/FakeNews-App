//
//  NewsModel.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct News: Codable, Identifiable {
    let id: Int
    let Orj_Text: String
    let Source: String
    let DocumentIdentifier: String
    let label: Int
}
