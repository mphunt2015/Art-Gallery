//
//  GalleryView.swift
//  Art Gallery
//
//  Updated by Michael Hunt on 6/6/25.
//

import SwiftUI

struct GalleryView: View {
    @StateObject var galleryViewModel: GalleryViewModel = GalleryViewModel()
    var body: some View {
        ScrollView {
            List(galleryViewModel.artworks, id: \.title) {
                image in Text(image.title)
            }
            .task {
                await galleryViewModel.fetchImages()
            }
            
            HeaderView(title: galleryViewModel.headerTitle)
//          TODO: Incorporate AddDeleteButtonView and functionality
//          AddDeleteButtonView()
    
            UrlImageView(imageUrl: galleryViewModel.imageUrl)
            
//          This HStack dynamically displays buttons corresponding to each artwork retrieved from the API
            ScrollView(.horizontal) {
                HStack {
                    ForEach(galleryViewModel.imageUrls.indices, id: \.self) {
                        index in
                        Button {
                            galleryViewModel.changeImage(index: index)
                        } label: {
                            UrlImageButtonView(imageUrl: "\(galleryViewModel.imageUrls[index])")
                        }
                        
                    }
                }
            }
        }
    }
}

//#Preview {
//    GalleryView()
//}
