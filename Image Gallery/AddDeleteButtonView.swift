//
//  AddDeleteButtonView.swift
//  Image Gallery
//
//  Created by Michael Hunt on 5/22/25.
//

import SwiftUI

struct AddDeleteButtonView: View {
        
    var body: some View {
        
//  TODO: Set up Add button functionality
//  The Add button will allow the user to upload images from the Photo app on their phone.
        Button("Add") {
            print("ADD BUTTON PRESSED")
        }
        .buttonStyle(.borderedProminent)
        
//  TODO: Set up Delete button functionality
//  The Delete button will allow the user to delete images from the Image Gallery.
        Button("Delete") {
            print("DELETE BUTTON PRESSED")
        }
        .buttonStyle(.borderless)
    }
}
