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

