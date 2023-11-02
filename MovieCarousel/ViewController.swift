//
//  ViewController.swift
//  MovieCarousel
//
//  Created by Vikram Kunwar on 25/08/23.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var carouselCollection: UICollectionView!
    
    
    var moviesImages = ["man","avatar","blackpanther","blackwidow","captainamerica","hulk","spiderman3","thor","wonderwomen","angrybirds","bighero","despicable","dragon","flash","frozen","incredibles","nemo","shrek"]
    
    
    var moviesName =  ["Iron Man","Avatar","Black Panther","Black Widow","Captain America","Hulk","Spiderman3","Thor","Wonderwomen","Angry Birds","Big hero","Despicable","Dragon","Flash","Frozen","Incredibles","Nemo","Shrek"]
    
    
    @IBOutlet weak var changeMovieImage: UIImageView!
    
    var lastVisibleIndex: Int?

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        if let layout = carouselCollection.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.minimumInteritemSpacing = 1  // Adjust the value as needed
                      // Adjust the value as needed
            
            layout.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 30)

                }
        
        carouselCollection.reloadData()
        
    }
    
    


}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carouselCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MoviesCVC
        
        cell.moviesImg.image = UIImage(named: moviesImages[indexPath.row])
        
        cell.moviesLbl.text = moviesName[indexPath.row]
        
        cell.moviesView.clipsToBounds = true
        
        var recommendedTitle: String = ""
           
           switch indexPath.row {
           case 0:
               recommendedTitle = "Vikram Kunwar"
           case 3:
               recommendedTitle = "Bharat Jalora"
           case 6:
               recommendedTitle = "Kishor Mane"
           case 7:
               recommendedTitle = "Vikas Sapkota"
           case 11:
               recommendedTitle = "Jamal Manihar"
           case 14:
               recommendedTitle = "Sairaj Brid"
           case 17:
               recommendedTitle = "Bhavya Goyal"
           default:
               break
           }
           
           cell.setRecommendedTitle(recommendedTitle)
        
        
        
        if indexPath.row == 0 || indexPath.row == 3 ||  indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 11 || indexPath.row == 14 || indexPath.row == 17{
                cell.showOnlineBTN()
            } else {
                // Hide the button for other cells
                cell.hideOnlineBTN()
            }
        
        
        
        
        return cell
    }
    
    func applyParallaxAnd3DZoomEffect(to cell: MoviesCVC, xOffset: CGFloat) {
            let parallaxOffset = xOffset * 150  // Adjust the parallax factor as needed
            
            // Calculate zoom scale based on the parallaxOffset
        let zoomScale = 1.0 - abs(parallaxOffset) / 230.0
            
            // Apply the parallax effect using CGAffineTransform
            cell.transform = CGAffineTransform(translationX: parallaxOffset, y: 0)
            
            // Apply 3D-like zoom effect
            let rotation = CATransform3DMakeRotation(-parallaxOffset / 1000.0, 0, 1, 0)
            let scale = CATransform3DMakeScale(zoomScale, zoomScale, 1.0)
            cell.layer.transform = CATransform3DConcat(rotation, scale)
        }
        
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for case let cell as MoviesCVC in carouselCollection.visibleCells {
                let xOffset = (cell.center.x - carouselCollection.contentOffset.x - carouselCollection.bounds.width / 2) / carouselCollection.bounds.width
                applyParallaxAnd3DZoomEffect(to: cell, xOffset: xOffset)
            }

            // Get the current center cell
            let center = CGPoint(x: scrollView.contentOffset.x + (scrollView.frame.width / 2), y: (scrollView.frame.height / 2))
            guard let centerIndexPath = carouselCollection.indexPathForItem(at: center) else { return }

            // Set background color of foodView in center cell
            guard let centerCell = carouselCollection.cellForItem(at: centerIndexPath) as? MoviesCVC else { return }
            
            // Update the logo image if needed
            changeMovieImage.image = UIImage(named: moviesImages[centerIndexPath.row])
        
        
    }
    

    
}



