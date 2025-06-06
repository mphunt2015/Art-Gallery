//
//  GalleryInfoViewModel.swift
//  Art Gallery
//
//  Updated by Michael Hunt on 6/5/25.
//

import Foundation
import Combine

class GalleryInfoViewModel: ObservableObject {
    @Published var galleryName: String?
    @Published var galleryOpenTime: String?
    @Published var galleryCloseTime: String?
    @Published var galleryAddress: String?
        
    func fetchGalleryInfo() {
        galleryName = "The Art Gallery"
        galleryOpenTime = "8:00 AM"
        galleryCloseTime = "5:00 PM"
        galleryAddress = "123 Somewhere St. New York, NY"
    }
}



