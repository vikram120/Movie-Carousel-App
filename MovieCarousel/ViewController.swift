//
//  ViewController.swift
//  MovieCarousel
//
//  Created by Vikram Kunwar on 25/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var carouselCollection: UICollectionView!
    
    
    var moviesImages = ["ironman","avatar","blackpanther","blackwidow","captainamerica","hulk","spiderman3","thor","wonderwomen"]
    
    var moviesName = ["IronMan","Avatar","Black Panther","Black Widow","Captain America","Hulk","Spiderman3","Thor","Wonder Women"]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carouselCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MoviesCVC
        
        cell.moviesImg.image = UIImage(named: moviesImages[indexPath.row])
        cell.moviesView.layer.cornerRadius = 15
        cell.moviesView.clipsToBounds = true
        
      
        
        
        
        
        cell.moviesLbl.text = moviesName[indexPath.row]
        return cell
    }
    
    func applyParallaxAnd3DZoomEffect(to cell: MoviesCVC, xOffset: CGFloat) {
            let parallaxOffset = xOffset * 150  // Adjust the parallax factor as needed
            
            // Calculate zoom scale based on the parallaxOffset
            let zoomScale = 1.0 - abs(parallaxOffset) / 200.0
            
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
        }
    
}

