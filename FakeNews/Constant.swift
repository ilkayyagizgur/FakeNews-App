//
//  Constant.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI


let colorBackground: Color = Color("Color")

let fakes: [News] = Bundle.main.decode("csvjson.json")


let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

