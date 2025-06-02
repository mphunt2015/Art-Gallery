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
                .scaledToFit()
                .frame(width: 300, height: 300)
        } placeholder: {
            Text("")
        }
    }
}
