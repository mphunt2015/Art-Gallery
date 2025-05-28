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
    @State var images: [ImageModel]
    @State var headerTitle: String
    
    var body: some View {
        ScrollView {
            List(images, id: \.title) {
                image in Text(image.title)
            }
            .task {
                fetchImages()
            }
            
            HeaderView(title: headerTitle)
            
            //        ImageView(image: galleryImage)
            //
            //        AddDeleteButtonView()
            UrUrlImageView()
            
            //        TODO: Ensure buttons are scrollable if there are more than 4 in a row
            //        This HStack dynamically displays buttons corresponding to each picture in the pictureCollection
            HStack {
                ForEach(pictureCollection.indices, id: \.self) { index in
                    Button("\(pictureCollection[index])") {
                        changeImage(index: index)
                    }
                }
            }
            VStack {
                ForEach(images.indices, id: \.self) { index in
                    Button("\(images[index].title)") {
                        changeImage(index: index)
                    }
                }
            }
        }
    }
}


extension ContentView {
//  changeImage is called when the user selects an image from the gallery. It identifies the index of the button selected, and then sets the displayed image to the corresponding painting in the pictureCollection with the same index
    func changeImage(index: Int) {
        self.galleryImage = "\(pictureCollection[index])"
        print("\(pictureCollection[index]) selected")
    }
    func fetchImages() {
        guard let url = URL(string: "http://localhost:8080/api/images") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let dynamicImages = try JSONDecoder().decode([ImageModel].self, from: data)
                print("Fetched images: \(dynamicImages)")
                self.headerTitle = dynamicImages[0].title
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }
        task.resume()
    }
}


extension String {
    
    func addNumber(num: String) {
    }
}

#Preview {
    ContentView(galleryImage: "Picture1", images: [], headerTitle: "Image Gallery Test")
}

