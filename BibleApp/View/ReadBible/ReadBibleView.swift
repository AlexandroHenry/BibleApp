//
//  ReadBibleView.swift
//  BibleApp
//
//  Created by Seungchul Ha on 2022/11/26.
//

import SwiftUI

struct ReadBibleView: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var homeData: HomeViewModel
    
    var body: some View {
        
        // Side Tab View...
        VStack {
            
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search", text: $homeData.selectBookSearch)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            .background(Color.primary.opacity(0.15))
            .cornerRadius(10)
            .padding()
            
            List(selection: $homeData.selectedBook) {
                
                ForEach(homeData.books) { book in
                    
                    VStack {
                        NavigationLink {
                            ReadBibleDetailView(book: book)
                        } label: {
                            Text(book.bookname)
                        }
                    }
                }
            }
            .listStyle(SidebarListStyle())

        }
        
    }
}

struct ReadBibleView_Previews: PreviewProvider {
    static var previews: some View {
        ReadBibleView()
    }
}
