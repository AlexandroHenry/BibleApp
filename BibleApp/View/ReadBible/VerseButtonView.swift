//
//  VerseButtonView.swift
//  BibleApp
//
//  Created by Seungchul Ha on 2022/11/26.
//

import SwiftUI

struct VerseButtonView: View {
    @EnvironmentObject var modelData: ModelData
    var verse: Bible
    @State var isMarked: Bool = false
    
    var body: some View {
        Button {
            isMarked.toggle()
//            modelData.pasted.append(verse.word)
        } label: {
            HStack(spacing: 20) {
                VStack {
                    Text("\(verse.verse)")
                    Spacer()
                }
                VStack {
                    if isMarked {
                        Text(verse.word)
                            .underline()
                            .lineSpacing(20)
                    } else {
                        Text(verse.word)
                            .lineSpacing(20)
                    }
                    Spacer()
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

//struct VerseButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        VerseButtonView()
//    }
//}
