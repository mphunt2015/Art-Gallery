//
//  UrlImageView.swift
//  Image Gallery
//
//  Created by Michael Hunt on 5/28/25.
//

import SwiftUI

struct UrlImageButtonView: View {
    let imageUrl: String
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) {
            image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped(antialiased: true)
        } placeholder: {
            Text("")
        }
    }
}
