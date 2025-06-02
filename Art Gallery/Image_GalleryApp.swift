//
//  Image_GalleryApp.swift
//  Image Gallery
//
//  Created by Michael Hunt on 5/20/25.
//

import SwiftUI
import SwiftData

@main
struct Image_GalleryApp: App {
    
    init (){
        print("Launching app...")
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView(galleryImage: "Picture1")
            ContentView(artworks: [], headerTitle: "")
        }
    }
}
