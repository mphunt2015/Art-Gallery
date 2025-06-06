//
//  HomeView.swift
//  Art Gallery
//
//  Created by Michael Hunt on 6/4/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            Text("Art Gallery Home")
            NavigationLink("Go to Gallery Info View", value: "GalleryInfoView")
            NavigationLink("Go to Gallery", value: "GalleryView")
                .navigationTitle("Main Menu")
                .navigationDestination(for: String.self) { value in
                    if value == "GalleryInfoView" {
                        GalleryInfoView()
                    }
                    else if value == "GalleryView" {
                        GalleryView()
                    }
                }
        }
    }
}

#Preview {
    HomeView()
}
