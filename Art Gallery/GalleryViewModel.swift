import SwiftUI

//  @MainActor defines the main thread for asynchronous calls to ensure that UI updates happen safely on the main thread
@MainActor
//  The GalleryViewModel defines functionality for the GalleryView
//  The ObservableObject protocol is used to define a class whose state changes can be observed by SwiftUI views
class GalleryViewModel: ObservableObject {
//  Initialize variables to store values retrieved by API
//  @Published marks a properties conforming to ObservableObject protocol for automatic change broadcasting in the GalleryView
    @Published var artworks: [ArtworkModel] = []
    @Published var titles: [String] = []
    @Published var imageUrls: [String] = []
    @Published var headerTitle: String = ""
    @Published var imageUrl: String = ""
    
//  The changeImage function changes the image and title displayed in the gallery based on user selection
    func changeImage(index: Int) {
        self.imageUrl = imageUrls[index]
        self.headerTitle = titles[index]
        print("\(imageUrls[index]) selected")
        print("\(titles[index]) selected")
    }

//  The fetchImages function retrieves title and imageUrl data from API then creates usable arrays for displaying in the UI
    func fetchImages() async {
//      Define the URL from which to fetch the JSON data
        guard let url = URL(string: "http://localhost:8080/api/images") else {
            print("Invalid URL")
            return
        }

        do {
//          Performs an asynchronous API call from the defined URL
            let (data, response) = try await URLSession.shared.data(from: url)
//          JSONDecoder takes raw JSON from the Image Gallery API and turns it into usable Swift objects
            let artworksFromApi = try JSONDecoder().decode([ArtworkModel].self, from: data)
            print("Fetched images: \(artworksFromApi)")

//          Retrieves the entire set of data retrieved from API, including titles and URLs
            self.artworks = artworksFromApi
//          The .map { $0.title } transforms each ArtworkModel in the array into just its title
            self.titles = artworksFromApi.map { $0.title }
//          The .map { $0.imageUrl } transforms each ArtworkModel in the array into just its title
            self.imageUrls = artworksFromApi.map { $0.imageUrl }
//          Sets the initial header title to the first title retrieved from the API, or sets it to an empty string if null
            self.headerTitle = self.titles.first ?? ""
//          Sets the initial image displayed to the first image retrieved from the API, or sets it to an empty string if null
            self.imageUrl = self.imageUrls.first ?? ""
            
        } catch {
            print("Error fetching or decoding data: \(error)")
        }
    }
}

