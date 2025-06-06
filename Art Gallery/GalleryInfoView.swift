//
//  GalleryInfoView.swift
//  Art Gallery
//
//  Updated by Michael Hunt on 6/5/25.
//

import SwiftUI

struct GalleryInfoView: View {
    @StateObject var galleryInfoViewModel: GalleryInfoViewModel = GalleryInfoViewModel()
    
    var body: some View {
        Text(galleryInfoViewModel.galleryName ?? "Loading...")
        Text("Open Monday - Friday from \(galleryInfoViewModel.galleryOpenTime ?? "Loading...")")
        Text("To \(galleryInfoViewModel.galleryCloseTime ?? "Loading...")")
        Text("Located at \(galleryInfoViewModel.galleryAddress ?? "Loading...")")
            .onAppear {
                galleryInfoViewModel.fetchGalleryInfo()
            }
    }
}

//#Preview {
//    GalleryInfoView()
//}
