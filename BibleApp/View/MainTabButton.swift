//
//  TabButton.swift
//  BibleApp
//
//  Created by Seungchul Ha on 2022/11/26.
//

import SwiftUI

struct MainTabButton: View {
    var image: String
    var title: String
    @Binding var selectedTab: String
    
    var body: some View {
        
        Button {
            withAnimation {
                selectedTab = title
            }
        } label: {
            
            VStack(spacing: 7){
                
                Image(systemName: image)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(selectedTab == title ? .white : .gray)
                
                Text(title)
                    .fontWeight(.semibold)
                    .font(.system(size: 11))
                    .foregroundColor(selectedTab == title ? .white : .gray)
            }
            .padding(.vertical, 8)
            .frame(width: 70)
            .background(Color.primary.opacity(selectedTab == title ? 0.15 : 0))
            .cornerRadius(10)
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}
