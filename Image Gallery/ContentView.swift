//
//  ContentView.swift
//  Image Gallery
//
//  Created by Michael Hunt on 5/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

//    TODO: Retrieve the pictureCollection value from an API
//    pictureCollection is an array of all images in the gallery.
    let pictureCollection = ["Picture1", "Picture2", "Picture3", "Picture4"]
    
//    @State is a property wrapper that you use to read and write a value that SwiftUI manages.
    @State var galleryImage: String

//    changeImage is called when the user selects an image from the gallery. It identifies the index of the button selected, and then sets the displayed image to the corresponding painting in the pictureCollection with the same index.
    func changeImage(index: Int) {
        self.galleryImage = "\(pictureCollection[index])"
        print("\(pictureCollection[index]) selected")
    }
    
    var body: some View {
        
//        TODO: Set up dynamic title corresponding to the galleryImage displayed
//        This Text displays the title of the selected artwork, returned from the API
        Text("Image Gallery").font(.title)
        
//        This is the image from the pictureCollection that is displayed for the user. Its width and height are all set to the same values.
            Image(galleryImage)
                .resizable()
                .frame(width: 300, height: 300)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .padding()
        
//        TODO: Set up Add button functionality
//        The Add button will allow the user to upload images from the Photo app on their phone.
            Button("Add") {
                print("ADD BUTTON PRESSED")
            }
            .buttonStyle(.borderedProminent)
        
//        TODO: Set up Delete button functionality
//        The Delete button will allow the user to delete images from the Image Gallery.
            Button("Delete") {
                print("DELETE BUTTON PRESSED")
            }
            .buttonStyle(.borderless)
        
//        TODO: Ensure buttons are scrollable if there are more than 4 in a row
//        This HStack dynamically displays buttons corresponding to each picture in the pictureCollection
        HStack {
            ForEach(pictureCollection.indices, id: \.self) { index in
                Button("\(pictureCollection[index])") {
                    changeImage(index: index)
                }
            }
        }
    }
}

#Preview {
    ContentView(galleryImage: "Picture1")
}
