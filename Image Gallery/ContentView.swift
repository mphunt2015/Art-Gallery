//
//  ContentView.swift
//  Image Gallery
//
//  Created by Michael Hunt on 5/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    let picture1 = Image("Picture1")
    let picture2 = Image("Picture2")
    let picture3 = Image("Picture3")
    let picture4 = Image("Picture4")
    
    var body: some View {
        Text("Image Gallery").font(.title)
        VStack(alignment: .leading, spacing: 20.0) {
            picture1.resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
        }
        .padding()
        Button("Add") {
            print("ADD BUTTON PRESSED")
        }
        .buttonStyle(.borderedProminent)
        Button("Delete") {
            print("DELETE BUTTON PRESSED")
        }
        .buttonStyle(.borderless)
        HStack {
            Button("1") {
                
            }.buttonStyle(.borderedProminent)
                .padding()
            Button("2") {
                
            }.buttonStyle(.borderedProminent)
                .padding()
            Button("3") {
                
            }.buttonStyle(.borderedProminent)
                .padding()
            Button("4") {
                
            }.buttonStyle(.borderedProminent)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
