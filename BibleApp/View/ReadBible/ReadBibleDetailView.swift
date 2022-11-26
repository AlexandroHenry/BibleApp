//
//  ReadBibleDetailView.swift
//  BibleApp
//
//  Created by Seungchul Ha on 2022/11/26.
//

import SwiftUI

struct ReadBibleDetailView: View {
    
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var homeData: HomeViewModel
    
    var book: BookName
    @State var chapterNumber: Int = 1
    @State var fontSize: CGFloat = 15
    
    var filteredChapter: [Bible] {
        modelData.en_niv.filter { item in
            item.book == book.bookname && item.chapter == chapterNumber
        }
    }
    
    var body: some View {
        VStack {
            
            HStack {
                VStack {
                    
                    HStack {
                        ZStack {
                            Spacer()
                            Text("\(book.bookname) \(chapterNumber)")
                                .font(.largeTitle.bold())
                            Spacer()
                            
                            HStack {
                                Spacer()
                                decreaseFontSize()
                                increaseFontSize()
                                expandViewButton()
                            }
                        }
                    }
                    
                    HStack {
                        
                        VStack {
                            Spacer()
                            chapterChange(action: "prev")
                            Spacer()
                        }
                        
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(filteredChapter, id: \.self) { item in
                                    VerseButtonView(verse: item)
                                        .font(.system(size: fontSize))
                                }
                            }
                            .padding()
                        }
                        
                        VStack {
                            Spacer()
                            chapterChange(action: "next")
                            Spacer()
                        }
                    }
                    .padding()
                }
                
                ExpandedView(currentBook: book, chapterNumber: $chapterNumber)
                    .background(BlurView())
                    .frame(width: homeData.isExpanded ? nil : 0)
                    .opacity(homeData.isExpanded ? 1 : 0)
            }
        }
        .padding()
    }
    
    @ViewBuilder
    func chapterChange(action: String) -> some View {
        Button {
            switch action {
            case "prev":
                if chapterNumber > 1 {
                    chapterNumber -= 1
                }
            case "next":
                if chapterNumber < chapterCounter(currentBook: book.bookname) {
                    chapterNumber += 1
                }
            default:
                print("page not found")
            }
            
        } label: {
            if action == "prev" {
                Image(systemName: "arrow.left")
                    .font(.system(size: 20).bold())
            } else {
                Image(systemName: "arrow.right")
                    .font(.system(size: 20).bold())
            }
        }
        .buttonStyle(magnifyingglassButton())
    }
    
    @ViewBuilder
    func decreaseFontSize() -> some View {
        Button {
            if fontSize > 10 {
                fontSize -= 5
            }
        } label: {
            Image(systemName: "minus.magnifyingglass")
        }
        .buttonStyle(magnifyingglassButton())
    }
    
    @ViewBuilder
    func increaseFontSize() -> some View {
        Button {
            if fontSize < 30 {
                fontSize += 5
            }
        } label: {
            Image(systemName: "plus.magnifyingglass")
        }
        .buttonStyle(magnifyingglassButton())
    }
    
    @ViewBuilder
    func expandViewButton() -> some View {
        Button {
            withAnimation {
                homeData.isExpanded.toggle()
            }
        } label: {
            Image(systemName: "sidebar.right")
                .font(.title2)
                .foregroundColor(homeData.isExpanded ? .blue : .primary)
        }
        .buttonStyle(magnifyingglassButton())
    }
    
    func chapterCounter(currentBook: String) -> Int {
        let book = modelData.en_niv.filter { item in
            item.book == currentBook
        }
        
        var chapterCount = 1
        
        for i in book {
            if i.chapter > chapterCount {
                chapterCount = i.chapter
            }
        }
        return chapterCount
    }
}

struct ReadBibleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReadBibleDetailView(book: BookName(bookname: "Genesis", version: "niv", language: "english", part: "old", koreanName: "창세기"))
    }
}

struct magnifyingglassButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.black.opacity(0.2))
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ExpandedView: View {
    
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var homeData: HomeViewModel
    
    var currentBook: BookName
    
    @Binding var chapterNumber: Int
    
    var body: some View {
        
        VStack {
            
            Picker(selection: $homeData.pickedTab, label: Text("Picker")) {
                Text("Chapter")
                    .tag("Chapter")
                
                Text("Share")
                    .tag("Share")
                
                Text("Note")
                    .tag("Note")
            }
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
            .padding(.vertical)

                
            if homeData.pickedTab == "Chapter" {
                VStack {
                    HStack {
                        Spacer()
                        Text("Chapter")
                            .font(.largeTitle.bold())
                        Spacer()
                    }
                    
                    List {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 5), spacing: 20) {
                            ForEach(1...chapterCounter(currentBook: currentBook.bookname), id: \.self) { index in
                                Button {
                                    withAnimation {
                                        chapterNumber = index
                                    }
                                } label: {
                                    Text("\(index)")
                                }
                                .buttonStyle(GlowingChapterButton())
                            }
                        }
                    }
                    .listStyle(SidebarListStyle())
                    
                    Spacer()
                }
            } else {
                
                VStack {
                    
                    Spacer()
                }
            }
            
            
        }
        .padding(.horizontal)
        .frame(maxWidth: 320, maxHeight: .infinity)
    }
    
    func chapterCounter(currentBook: String) -> Int {
        let book = modelData.en_niv.filter { item in
            item.book == currentBook
        }
    
        var chapterCount = 1
    
        for i in book {
            if i.chapter > chapterCount {
                chapterCount = i.chapter
            }
        }
        return chapterCount
    }
}

struct GlowingChapterButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.black.opacity(0.2))
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .frame(width: 60, height: 60)
    }
}
