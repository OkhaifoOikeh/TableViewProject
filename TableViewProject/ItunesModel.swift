//
//  ItunesModel.swift
//  TableViewProject
//
//  Created by Okhaifo Oikeh on 10/16/18.
//  Copyright © 2018 Okhaifo Oikeh. All rights reserved.
//

class ItunesModel {
    
    var id : Int?
    var albumName: String?
    var artistName: String?
    var genre: String?
    var releaseDate: String?
    var albumUrl: String?
    var artistUrl: String?
    var imageUrl: String?
    
    init(id: Int?, albumName: String?, artistName: String?, genre: String?, releaseDate: String?, albumUrl: String?, artistUrl: String?, imageUrl: String?) {
        self.id = id
        self.albumName = albumName
        self.artistName = artistName
        self.genre = genre
        self.releaseDate = releaseDate
        self.albumUrl = albumUrl
        self.artistUrl = artistUrl
        self.imageUrl = imageUrl
    }
}
