//
//  HomeView.swift
//  BibleApp
//
//  Created by Seungchul Ha on 2022/11/26.
//

import SwiftUI

struct HomeView: View {
    
    // Screen...
    var screen = NSScreen.main!.visibleFrame
    
    @StateObject var homeData = HomeViewModel()
    
    @State var selectedHome = "오늘"
    @Namespace var animation
    
    var body: some View {
        
        VStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                HStack {
                    
                    Text("Lets Bible")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.primary)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        Image("ariana_grande2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.vertical)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 5)
                
                // TabView
                HStack(spacing: 20) {
                    HomeTabButton(image: "hourglass", tabname: "오늘", selectedTabHome: $homeData.selectedHomeTab, animation: animation)
                    
                    HomeTabButton(image: "person.3", tabname: "공동체", selectedTabHome: $homeData.selectedHomeTab, animation: animation)
                }
            }
            
            ZStack {
                switch homeData.selectedHomeTab {
                case "오늘": Text("오늘")
                case "공동체": Text("공동체")
                default: Text("")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen.width / 1.4, height: screen.height - 60)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeTabButton: View {
    var image: String
    var tabname: String
    
    @Binding var selectedTabHome: String
    var animation: Namespace.ID
    
    var body: some View {
        
        Button{
            withAnimation {
                selectedTabHome = tabname
            }
        } label: {
            
            VStack(spacing: 0) {
                
                HStack {
                    
                    Image(systemName: image)
                        .font(.title)
                        .foregroundColor(selectedTabHome == tabname ? Color.blue : Color.gray.opacity(0.7))
                        .frame(height: 40)
                    
                    Text(tabname)
                        .font(.title)
                        .foregroundColor(selectedTabHome == tabname ? Color.blue : Color.gray.opacity(0.7))
                }
                
                ZStack {
                    
                    Capsule()
                        .fill(Color.clear)
                        .frame(width: 65, height: 3)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                    
                    if selectedTabHome == tabname {
                        
                        Capsule()
                            .fill(Color.blue)
                            .frame(width: 65, height: 3)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
