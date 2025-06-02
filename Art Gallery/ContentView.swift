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
        
//        @State is a property wrapper that you use to read and write a value that SwiftUI manages.
    @State var artworks: [ArtworkModel]
    @State var headerTitle: String
    @State var titles: [String] = []
    @State var imageUrls: [String] = []
    @State var imageUrl: String = ""
    
    var body: some View {
        ScrollView {
            List(artworks, id: \.title) {
                image in Text(image.title)
            }
            .task {
                fetchImages()
            }
            
            HeaderView(title: headerTitle)
//                    AddDeleteButtonView()
    
            \UrlImageView(imageUrl: imageUrl)
            
//                    TODO: Ensure buttons are scrollable if there are more than 4 in a row
//                    This HStack dynamically displays buttons corresponding to each artwork retrieved from the API
            HStack {
                ForEach(imageUrls.indices, id: \.self) {
                    index in
                    Button("\(titles[index])") {
                        changeImage(index: index)
                    }
                }
            }
                }
            }
        }

extension ContentView {
//  changeImage is called when the user selects an image from the gallery. It identifies the index of the button selected, and then sets the displayed image to the corresponding artwork retrieved from the API with the same index
    
    func changeImage(index: Int) {
//        Set artwork image to corresponding selection
        self.imageUrl = "\(imageUrls[index])"
        print("\(imageUrls[index]) selected")
//        Set title to corresponding selection
        self.headerTitle = "\(titles[index])"
        print("\(titles[index]) selected")
    }
    
//    Retrieves artwork from API. Note: Imagegallery API must be running
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
//                Use JSONDecoder to decode the actual image from the URL
                let artworkRetrievedFromApi = try JSONDecoder().decode([ArtworkModel].self, from: data)
                print("Fetched images: \(artworkRetrievedFromApi)")
//                Set the headerTitle to the first title retrieved from API
                self.headerTitle = artworkRetrievedFromApi[0].title
//                Iterate through titles, create an array for reference when setting the title after the corresponding button is selected
                for title in artworkRetrievedFromApi {
                    print(title.title)
                    self.titles.append(title.title)
                    print(self.titles)
                }
//                Iterate through imageUrls, create an array for reference when setting the image after the corresponding button is selected
                for imageUrl in artworkRetrievedFromApi {
                    print(imageUrl.imageUrl)
                    self.imageUrls.append(imageUrl.imageUrl)
                    print(self.imageUrls)
                }
//                Set the initial image to the first artwork retrieved from API
                self.imageUrl = imageUrls[0]
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }
        task.resume()
    }
}

#Preview {
    ContentView(artworks: [], headerTitle: "Image Gallery Test")
}

