//
//  Home.swift
//  BibleApp
//
//  Created by Seungchul Ha on 2022/11/26.
//

import SwiftUI

// Screen...
var screen = NSScreen.main!.visibleFrame

struct MainView: View {
    
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 0) {
                
                VStack {
                    
                    MainTabButton(image: "house", title: "Home", selectedTab: $homeData.selectedMainTab)
                    
                    MainTabButton(image: "book", title: "Read Bible", selectedTab: $homeData.selectedMainTab)
                    
                    Spacer()
                    
                    MainTabButton(image: "gear", title: "Settings", selectedTab: $homeData.selectedMainTab)
                }
                .padding()
                .padding(.top, 35)
                .background(BlurView())
                
                // Tab Content...
                ZStack {
                    
                    switch homeData.selectedMainTab {
                        
                    case "Home": HomeView()
                    case "Read Bible": NavigationView {
                        ReadBibleView()
                    }
                    case "Settings": Text("Settings")
                    default: Text("")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea(.all, edges: .all)
            .frame(width: screen.width, height: screen.height - 60)
//            .frame(width: proxy.frame(in: .global).width, height: proxy.frame(in: .global).height - 60)
            .environmentObject(homeData)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
