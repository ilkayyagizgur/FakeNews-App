//
//  Constant.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI


let colorBackground: Color = Color("Color")

let fakesWeb: [SlideNews] = Bundle.main.decode("csvjsonWeb.json")
let fakesWebFull: [WebNews] = Bundle.main.decode("csvjsonWebFull.json")


let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

