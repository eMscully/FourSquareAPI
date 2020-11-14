import Foundation
import FoursquareAPIClient

class DataService {
    static let shared = DataService()
    
    let client = FoursquareAPIClient(clientId: "RKDJQWQAVCIU1DTLOPTBKWWXFEFBMRADHQBE4QZ510HNOXRH", clientSecret: "FH3AOWQL5ZMMB04ONR1JS2EMIOHFELZ0GPOYLWH4KJKPLCEL", version: "20201114")
    
}
