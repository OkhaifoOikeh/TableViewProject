//
//  ViewController.swift
//  TableViewProject
//
//  Created by Okhaifo Oikeh on 10/16/18.
//  Copyright © 2018 Okhaifo Oikeh. All rights reserved.
//

import UIKit

//adding class DataSource and Delegate for our TableView
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //url for request
     static let DATA_URL = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    
    
    //table view outlet
    @IBOutlet weak var tableViewItunes: UITableView!
    
    //container of model data as array
    var ItunesModelContainer = [ItunesModel]()
    
    
    //view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    //getting the item count in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItunesModelContainer.count
    }
    
    
    //getting the view for the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! TableViewCellController
        
        //getting the hero for the specified position
        let contained: ItunesModel
        contained = ItunesModelContainer[indexPath.row]
        
        //displaying values
        cell.albumNameLabel.text = contained.albumName
        cell.artistNameLabel.text = contained.artistName
        cell.genreLabel.text = contained.genre
        cell.releaseDateLabel.text = contained.releaseDate
        cell.viewArtistButton.tag = indexPath.row
        // cell.albumImage.image = contained.al
        
        
        
      return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   


}

