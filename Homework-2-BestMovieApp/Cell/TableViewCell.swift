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
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}