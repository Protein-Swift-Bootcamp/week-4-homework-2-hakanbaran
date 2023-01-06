//
//  ViewController.swift
//  Homework-2-BestMovieApp
//
//  Created by Hakan Baran on 6.01.2023.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellID")
        tableView.separatorStyle = .none
        
        getData()
    }
    
    
    func getData() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=3eb740bc8fc93686e023441eb0718ab1&language=en-US&page=1")!
        
        WebService().downloadMovie(url: url) { movies in
            if let movies = movies {
                print(movies)
            }
        }
    }
}

extension FirstVC: UITableViewDelegate {
    
}
extension FirstVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
        return cell
    }
}

