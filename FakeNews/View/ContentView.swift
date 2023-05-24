//
//  ContentView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var textEditorText: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    // MARK: - FUNCTIONS
    
    private var isButtonDisabled: Bool {
        textEditorText.isEmpty
    }
    
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
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
// MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                LogoView()
                    .padding(.vertical, 20)
                    .background(Color("Color"))
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                VStack(spacing: 16) {
                    TextEditor(text: $textEditorText)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                    
                    Button(action: {
                        addItem()
                    }, label: {
                        Spacer()
                        Text("SAVE")
                            .font(.headline)
                        Spacer()
                    }) //: BUTTON
                    .disabled(isButtonDisabled)
                    .padding()
                    .foregroundColor(.white)
                    .background(isButtonDisabled ? Color.gray : Color("ColorRed"))
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
                } //: VSTACK
                .padding()
                if #available(iOS 16.0, *) {
                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                            } label: {
                                SearchedItemView(item: item)
                                    .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 0)
                            }
                            
                        } //: FOR EACH
                        .onDelete(perform: deleteItems)
                    } //: LIST
                    .scrollContentBackground(.hidden)
                } else {
                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                            } label: {
                                SearchedItemView(item: item)
                                    .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 0)
                            }
                        } //: FOR EACH
                        .onDelete(perform: deleteItems)
                    } //: LIST
                } // IF AVAILABLE CHECK
                
            } //: VSTACK
        } //: NAVIGATION
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
