//
//  UrlImageView.swift
//  Image Gallery
//
//  Created by Michael Hunt on 5/28/25.
//

import SwiftUI

struct UrlImageView: View {
    let imageUrl: String
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) {
            image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .clipped(antialiased: true)
        } placeholder: {
            Text("")
        }
    }
}
