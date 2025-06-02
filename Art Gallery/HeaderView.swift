//
//  HeaderView.swift
//  Image Gallery
//
//  Created by Michael Hunt on 5/22/25.
//

//  TODO: Set up dynamic title corresponding to the galleryImage displayed
//  This Text displays the title of the selected artwork, returned from the API
import SwiftUI

struct HeaderView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title)
    }
}
