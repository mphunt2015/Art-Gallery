//
//  ImageView.swift
//  Image Gallery
//
//  Created by Michael Hunt on 5/22/25.
//

//  This is the image from the pictureCollection that is displayed for the user. Its width and height are all set to the same values.

import SwiftUI

struct ImageView: View {
    
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 300, height: 300)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(15)
            .padding()
    }
}
