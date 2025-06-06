//
//  HeaderView.swift
//  Image Gallery
//
//  Updated by Michael Hunt on 6/6/25.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    
    var body: some View {
//      This Text displays the title of the selected artwork, returned from the API
        Text(title)
//          Defines the font style for the artwork title
            .font(.title)
//          Limits the title to one line for cleaner user experience
            .lineLimit(1)
//          Allows title to be scaled down by a factor of 0.5 for responsive display for longer titles
            .minimumScaleFactor(0.5)
    }
}
