//
//  SecondVC.swift
//  Homework-2-BestMovieApp
//
//  Created by Hakan Baran on 7.01.2023.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondMovieName: UILabel!
    @IBOutlet weak var secondMovieDate: UILabel!
    @IBOutlet weak var secondMovieOverview: UILabel!
    
    var viewModel : SecondVCViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        secondMovieName.text = viewModel?.movieName
        secondMovieOverview.text = viewModel?.movieOverView
        
        let date = viewModel?.date
        let index = date!.firstIndex(of: "-") ?? date!.endIndex
        let year = date![..<index]
        let yearResult = "(\(year))"
        secondMovieDate.text = yearResult
        
        
    }
    

    

}
