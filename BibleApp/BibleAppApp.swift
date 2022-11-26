//
//  BibleAppApp.swift
//  BibleApp
//
//  Created by Seungchul Ha on 2022/11/26.
//

import SwiftUI

@main
struct BibleAppApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get{.none}
        set{}
    }
}
