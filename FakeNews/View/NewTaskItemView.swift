//
//  NewTaskItemView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 26.05.2023.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTY
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    @State private var textEditorText: String = ""
    @Binding var isShowing: Bool
    
    
    private var isButtonDisabled: Bool {
        textEditorText.isEmpty
    }
    
    // MARK: - FUNCTION
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.orj_text = textEditorText
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            textEditorText = ""
            isShowing = false
        }
    }
    
    func postRequest() async {
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("\(textEditorText)", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
    }
    
    func jsonpost() async {
        //Request Body
        let json: [String: Any] = ["orj_Text": textEditorText]
         
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
         
        // create post request
        let url = URL(string: "http://httpbin.org/post")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
         
        // insert json data to the request
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextEditor(text: $textEditorText)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                
                Button(action: {
//                    Task {
//                            await jsonpost()
//                        }
                    addItem()
                }, label: {
                    Spacer()
                    Text("Make Query")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                .disabled(isButtonDisabled)
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.gray : Color.pink)
                .cornerRadius(10)
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                 Color.white
            )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }//: VSTACK
        .padding()
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}

