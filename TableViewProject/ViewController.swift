//
//  ViewController.swift
//  TableViewProject
//
//  Created by Okhaifo Oikeh on 10/16/18.
//  Copyright © 2018 Okhaifo Oikeh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

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
        self.sendRequest()
    }
    
    
    
    func sendRequest(){
        
        //fetching data from web api
        Alamofire.request(ViewController.DATA_URL).responseJSON { response in
            
            //getting json
            if let json = response.result.value {
                
                //converting json to NSArray
                let totalData : NSDictionary  = json as! NSDictionary
                let feed : NSDictionary =  totalData["feed"] as! NSDictionary
                let resultsArray : NSArray = feed.mutableArrayValue(forKey: "results")
                
                print(resultsArray)
                //traversing through all elements of the array
              for i in 0..<resultsArray.count{
                
                let genres : NSArray = ((resultsArray[i] as AnyObject).value(forKey: "genres") as? NSArray)!
                
                var allgenre = ""
                for j in 0..<genres.count{
                    let gname = (genres[j] as AnyObject).value(forKey: "name") as? String
                    allgenre += " "+gname!
                }
                
                    //adding values to the list container
                
                    self.ItunesModelContainer.append(ItunesModel(
                        id: (resultsArray[i] as AnyObject).value(forKey: "id") as? Int,
                        albumName: (resultsArray[i] as AnyObject).value(forKey: "name") as? String,
                        artistName: (resultsArray[i] as AnyObject).value(forKey: "artistName") as? String,
                        genre: allgenre,
                        releaseDate: (resultsArray[i] as AnyObject).value(forKey: "releaseDate") as? String,
                        albumUrl: (resultsArray[i] as AnyObject).value(forKey: "url") as? String,
                        artistUrl:(resultsArray[i] as AnyObject).value(forKey: "artistUrl") as? String,
                        imageUrl: (resultsArray[i] as AnyObject).value(forKey: "artworkUrl100") as? String))
                
            
            
                
            }
                
                //displaying data in tableview
                self.tableViewItunes.reloadData()
            }
            
        }
        
        
        
          self.tableViewItunes.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //getting the item count in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItunesModelContainer.count
    }
    
    
    //getting the view for the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! TableViewCellController
        
        let contained: ItunesModel
        contained = ItunesModelContainer[indexPath.row]
        
        //displaying values
        cell.albumNameLabel.text = contained.albumName
        cell.artistNameLabel.text = contained.artistName
        cell.genreLabel.text = contained.genre
        cell.releaseDateLabel.text = contained.releaseDate
        cell.viewArtistButton.tag = indexPath.row
        
        
        
        //displaying cell image
        Alamofire.request(contained.imageUrl!).responseImage { response in
            
            if let image = response.result.value {
                cell.albumImage.image = image
            }
        }
        
        
      return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   


}

