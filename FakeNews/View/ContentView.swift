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
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = CGSize(width: 0, height: 0)
    @State private var showAlert = false
    @State private var showNewTaskItem: Bool = false
    
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
            ZStack {
                VStack {
                    LogoView()
                        .padding(.vertical, 20)
                        .background(Color("Color"))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    Spacer()
                    
                    if items.count == 0 {
                        Image("emptyListImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200, alignment: .center)
                        
                        Text("Your List Is Empty")
                            .font(.system(.headline))
                            .padding(.top, 20)
                        
                        Text(" Click on the button to make your query")
                            .font(.system(.headline))
                            .padding(.top, 5)
                        
                        Spacer()
                    } else{
                        List {
                            ForEach(items) { item in
                                NavigationLink {
                                    Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                } label: {
                                    SearchedItemView(item: item)
    
                                    
                                }
                            } //: FOR EACH
                            .onDelete(perform: deleteItems)
                            
                        } //: LIST
                        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 0)
                    }
                    
                    Button(action: {
                        showNewTaskItem = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                        Text("Make Query")
                            .font(.system(size: 22, weight: .black, design: .rounded))
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("ColorRed"), Color("ColorBlue")]), startPoint: .leading, endPoint: .trailing)
                            .clipShape(Capsule())
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
                    )
                    .padding(.bottom, 20)
                    
                } //: VSTACK
                .blur(radius: showNewTaskItem ? 8 : 0, opaque: false)
                .transition(.move(edge: .bottom))
                .animation(.easeOut(duration: 0.5), value: showNewTaskItem)
                
                
                
                if showNewTaskItem {
                    BlankView(
                        backgroundColor: Color.gray,
                        backgroundOpacity: 0.5)
                        .onTapGesture {
                            withAnimation() {
                                showNewTaskItem = false
                            }
                        }
                    
                    NewTaskItemView(isShowing: $showNewTaskItem)
                }
            } //: ZSTACK
            
            
        } //: NAVIGATION
    
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
