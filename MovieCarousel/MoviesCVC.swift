//
//  MoviesCVC.swift
//  MovieCarousel
//
//  Created by Vikram Kunwar on 25/08/23.
//

import UIKit

class MoviesCVC: UICollectionViewCell {
    
    @IBOutlet weak var moviesImg : UIImageView!
    
    @IBOutlet weak var moviesLbl: UILabel!
  
    
    @IBOutlet weak var moviesView: UIView!
    
    
    @IBOutlet weak var recommedBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recommedBtn.isHidden = true
        
    }
    
    func showOnlineBTN() {
            // Show Button for the different cell
        recommedBtn.isHidden = false
        
    }
    
    func hideOnlineBTN() {
        recommedBtn.isHidden = true
    }
    
    
    func setRecommendedTitle(_ title: String) {
        recommedBtn.setTitle("Recommended by \(title)", for: .normal)
    }
    
}
