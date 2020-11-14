import UIKit

class PlaceCell: UICollectionViewCell {
    

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    let cell = PlaceCell()
    
    func updateCell(with venue: Venues)-> PlaceCell {
        
        nameLabel.text = venue.name
        imageView.image = UIImage(named: "\(venue.image)")
        return cell
    }
    
    
}
