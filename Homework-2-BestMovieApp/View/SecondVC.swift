//
//  SecondVC.swift
//  Homework-2-BestMovieApp
//
//  Created by Hakan Baran on 7.01.2023.
//

import UIKit
import SDWebImage
import WebKit

class SecondVC: UIViewController {

    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondMovieName: UILabel!
    @IBOutlet weak var secondMovieDate: UILabel!
    @IBOutlet weak var secondMovieOverview: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var overviewTitleLabel: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var viewModel : SecondVCViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        spinner.startAnimating()
        
        secondImageView.isHidden = true
        secondMovieName.isHidden = true
        secondMovieDate.isHidden = true
        secondMovieOverview.isHidden = true
        webView.isHidden = true
        overviewTitleLabel.isHidden = true
        
        
        let seconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.secondVCLoadData()
        }
        
        
        
    }
    
    func secondVCLoadData() {
        
        secondMovieName.text = viewModel?.movieName
        secondMovieOverview.text = viewModel?.movieOverView
        
        let date = viewModel?.date
        let index = date!.firstIndex(of: "-") ?? date!.endIndex
        let year = date![..<index]
        let yearResult = "(\(year))"
        secondMovieDate.text = yearResult
        
        let url = viewModel?.imageUrl
        secondImageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(url ?? "")"))
        
        let youtubeVideoID = viewModel?.youtubeView.id.videoId
        guard let youtubeUrl = URL(string: "https://www.youtube.com/embed/\(youtubeVideoID ?? "")") else {
            return
        }
        webView.load(URLRequest(url: youtubeUrl))
        
    }
    

    

}
