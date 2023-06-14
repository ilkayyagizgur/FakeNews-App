//
//  HomeView.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

struct HomeView: View {
    
    let fakesWeb: [SlideNews] = Bundle.main.decode("csvjsonWeb.json")
    let fakesWebFull: [WebNews] = Bundle.main.decode("csvjsonWebFull.json")
    @State var allButtonClicked: Bool = false
    @State private var refreshNewsData: [refreshNews] = []
    
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
        static var buttonDisabled: Bool = true
        static var allclickedBackground: Color = Color.clear
        static var trueclickedBackground: Color = Color.clear
        static var fakeclickedBackground: Color = Color.clear
        
    }
    
    struct refreshNews: Codable, Identifiable {
        let id: String
        let Orj_Text: String
        let Title: String
        let Image_URL: String
        let label: Int
        let prob: Float
    }
    
    func fetchNews() {
            // 1. Create the URL for the API endpoint
            guard let url = URL(string: "http://localhost:57166/refresh") else {
                return
            }
            
            // 2. Create a URLSession and a data task
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                // 3. Check if there was an error
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                // 4. Check if there is data
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                do {
                    // 5. Decode the JSON data using Codable
                    let decoder = JSONDecoder()
                    let webnewsData = try decoder.decode([refreshNews].self, from: data)
                    if webnewsData.isEmpty {
                        print("empty")
                    }
                    print("printing web data\(webnewsData)")
                   
                    
                    // 6. Update the state variable on the main thread
                    DispatchQueue.main.async {
                        self.refreshNewsData = webnewsData
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }.resume() // 7. Start the data task
        }
    
    
    var body: some View {
        NavigationView{
            Color("Color")
                .ignoresSafeArea()
                .overlay(
                    VStack {
                        LogoView()
                            .padding(.vertical, 20)
                            .background(Color("Color"))
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            
                            withAnimation(.easeIn) {
                                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                                    Section(header:
                                       HStack {
                                        
//                                        Image(systemName: "globe")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 40, height: 40, alignment: .center)
//                                            .padding(.leading)
                                        
                                        Text("Top Stories")
                                            .fontWeight(.heavy)
                                            .font(.largeTitle)
                                            .foregroundColor(Color("ColorRed"))
                                        
                                        Spacer()
                                    } //: HSTACK
                                        .padding(.leading)
                                        .padding(.top)
                                            
                                            
                                    ) {
                                        SlideNewsView()
                                            .padding(.horizontal, 5)
                                            .frame(width: 400, height: 230)
                                    } // SECTION1
                                    Section(header:
                                        HStack {
                                        
                                        Image("HeaderFakeIcon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40, alignment: .center)
                                            .padding(.leading)
                                        
                                       
                                        
                                        Text("News")
                                            .fontWeight(.heavy)
                                            .font(.largeTitle)
                                            .foregroundColor(Color("ColorRed"))
                                        
                                        Spacer()
                                        
                                    } //: HSTACK
                                            
                                    ) {
                                    ForEach(fakesWebFull) { fake in
                                        NavigationLink(destination: DetailItemView(fake: fake)) {
                                            NewsItemView(fake: fake)
                                                .padding(.vertical, 8)
                                        }//:LINK
                                    }//: LOOP
                                }
                                }//: GRID
                            } //: ANIMATION
                        } //: SCROLL
                        .refreshable {
                            fetchNews()
                        }
                    } //: VSTACK
                )
        } //: NAVIGATION
        .frame(maxWidth: 640)
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
