//
//  TableViewCell.swift
//  Homework-2-BestMovieApp
//
//  Created by Hakan Baran on 6.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellMovieName: UILabel!
    @IBOutlet weak var cellRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImageView.image = UIImage(named: "testPoster")
        
        cellImageView.layer.cornerRadius = 10
        cellImageView.layer.borderWidth = 1
        cellImageView.layer.borderColor = UIColor.white.cgColor
        cellImageView.clipsToBounds = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
