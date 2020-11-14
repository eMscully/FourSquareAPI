
import UIKit
import FoursquareAPIClient

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var venues = [Venues]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
getTrendingPlaces()

    }
    
    func getTrendingPlaces(){
        let client = FoursquareAPIClient(clientId: "RKDJQWQAVCIU1DTLOPTBKWWXFEFBMRADHQBE4QZ510HNOXRH", clientSecret: "FH3AOWQL5ZMMB04ONR1JS2EMIOHFELZ0GPOYLWH4KJKPLCEL", version: "20201114")
        
        let parameter = ["ll" : "51.5074,-0.1278", "limit" : "10"]
        
        client.request(path: "venues/search", parameter: parameter) { (result) in
            switch result {
            case let .failure(error):
                    switch error {
                        case let .connectionError(connectionError):
                            print(connectionError)
                     
                        case let .responseParseError(responseParseError):
                            print(responseParseError)
                       
                        case let .apiError(apiError):
                            print(apiError.errorType)
                            print(apiError.errorDetail)
                 }
            case let .success(data):
           
    
                guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] else {return}
                
                guard let response = json["response"] as? [String:Any] else { return  }
                guard let venues = response["venues"] as? [[String:Any]] else { return }
                guard let name = venues.first!["name"] as? String else { return }
                
                
                
            }
        }
        
    }


}
//MARK: - Table View Methods

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
       
        
        return cell
    }
    
}
//MARK: - Collection View Methods
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCell", for: indexPath) as! PlaceCell
        
        let venue = venues[indexPath.row]
        
    
        
        return cell
    }
    
}
