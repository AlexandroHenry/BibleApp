//
//  HomeViewModel.swift
//  BibleApp
//
//  Created by Seungchul Ha on 2022/11/26.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var selectedMainTab = "Home"
    @Published var selectedHomeTab = "오늘"
    
    @Published var selectBookSearch = ""
    @Published var books: [BookName] = niv_books
    @Published var selectedBook: String? = niv_books.first?.id

    // Expanded View
    @Published var isExpanded = false
    @Published var pickedTab = "Chapter"
}
