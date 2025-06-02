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
                .scaledToFit()
                .frame(width: 30, height: 30)
        } placeholder: {
            Text("")
        }
    }
}
