import Foundation
import FoursquareAPIClient

class DataService {
    static let shared = DataService()
    
    
    private let baseURL = "https://api.foursquare.com/v2"
    

}

struct Places: Codable {
    let response: Response
   
}
struct Response: Codable {
    let venues: [Venues]
    let distance: Int
    let categories: [Categories]
    
}
struct Venues: Codable {
 //   let id: String
    let name: String
  //  let location: Location
    let image: String
    
    func getVenue()->Venues{
        let venue = Venues(name: "", image: "")
        return venue
    }
    
}

struct Location: Codable {
    let address: String
    let ll: String
    let lat: Double
    let lng: Double
}
struct Categories: Codable {
    let id: String
    let icon: Icon
}
struct Icon: Codable {
    let prefix: String
    let suffix: String
}
