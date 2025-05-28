//
//  UrlImageView.swift
//  Image Gallery
//
//  Created by Michael Hunt on 5/28/25.
//

import SwiftUI

struct UrUrlImageView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://aspph-redesign-wp-production.s3.amazonaws.com/wp-content/uploads/2025/04/54454151678_69e7852494_o-1024x683.jpg")) {
            image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
        } placeholder: {
            Text("Placeholder")
        }
    }
}
