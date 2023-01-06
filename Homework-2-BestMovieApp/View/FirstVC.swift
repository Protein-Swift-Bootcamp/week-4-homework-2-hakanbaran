//
//  ViewController.swift
//  Homework-2-BestMovieApp
//
//  Created by Hakan Baran on 6.01.2023.
//

import UIKit
import SDWebImage

class FirstVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var movieListViewModel : MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellID")
        tableView.separatorStyle = .none
        
        navigationController?.navigationBar.topItem?.title = "BEST MOVİES"
        
        getData()
    }
    
    
    func getData() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=3eb740bc8fc93686e023441eb0718ab1&language=en-US&page=1")!
        
        WebService().downloadMovie(url: url) { movies in
            if let movies = movies {
                self.movieListViewModel = MovieListViewModel(movieList: movies)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension FirstVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
extension FirstVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieListViewModel == nil ? 0 : self.movieListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
        
        let movieViewModel = self.movieListViewModel.movieAtIndex(indexPath.row)
        
        // Film çıkış tarihinin sadece yılını almak için
        let date = movieViewModel.movieDate
        let index = date.firstIndex(of: "-") ?? date.endIndex
        let year = date[..<index]
        let yearResult = String(year)
        let cellNumber = indexPath.row + 1
        cell.cellMovieName.text = "\(cellNumber).  \(movieViewModel.name) (\(yearResult))"
        cell.cellRating.text = "⭐️\(movieViewModel.movieVoteAverage)"
        
        
        let posterURL = URL(string: "https://image.tmdb.org/t/p/w500/\(movieViewModel.poster)")
        
        cell.cellImageView.sd_setImage(with: posterURL)
        
        
        return cell
    }
}

