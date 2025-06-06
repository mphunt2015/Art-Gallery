//
//  ContentView.swift
//  Art Gallery
//
//  Updated by Michael Hunt on 6/5/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        HomeView()
    }
}

extension ContentView {
    
}

//#Preview {
//    ContentView()
//}
