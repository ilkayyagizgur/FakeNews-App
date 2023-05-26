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
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Task", text: $textEditorText)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                
                Button(action: {
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

