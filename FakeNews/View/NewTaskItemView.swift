//
//  NewTaskItemView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 26.05.2023.
//

import SwiftUI
import Foundation

struct NewTaskItemView: View {
    // MARK: - PROPERTY
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    @State private var textEditorText: String = ""
    @Binding var isShowing: Bool
    @State private var responseData: ResponseData? = nil
    
    private var isButtonDisabled: Bool {
        textEditorText.isEmpty
    }
    
    
    // MARK: - FUNCTION
    
    private func addItem() {
        guard let responseData = responseData else { return }
        
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.orj_text = responseData.data
            newItem.completion = false
            newItem.label = Double(responseData.label)
            newItem.id = responseData.id
            
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
    
    struct ResponseData: Codable {
        let id: UUID
        let data: String
        let label: Int
        let prob: Float
        // ...
    }
    
    func jsonpost(completion: @escaping (ResponseData?) -> Void) {
        // Request Body
        let json: [String: Any] = ["text": textEditorText]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
            print("Failed to serialize JSON")
            completion(nil)
            return
        }
        
        // Create post request
        let url = URL(string: "http://localhost:58658/predict")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Insert JSON data into the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                // Decode the data into an instance of ResponseData
                let responseData = try decoder.decode(ResponseData.self, from: data)
                completion(responseData)
                print(responseData)
            } catch {
                print("Failed to decode JSON: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
    
    func fetchData() {
        jsonpost { responseData in
            if let responseData = responseData {
                DispatchQueue.main.async {
                    self.responseData = responseData
                    addItem()
                }
            }
        }
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
                    fetchData()

                    
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
                
//                Group {
//                    if let responseData = responseData {
//                        ContentView(responseData: responseData)
//                    } else {
//                        EmptyView() // Placeholder view if responseData is nil
//                    }
//                }
                
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                 Color.white
            )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        } //: VSTACK
        .padding()
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}

