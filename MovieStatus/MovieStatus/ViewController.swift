//
//  ViewController.swift
//  MovieStatus
//
//  Created by xszhao on 2017-03-25.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var videos: [Video] = []
    var model: [DetailModel] = []
    
    var basePhotoUrl = "https://image.tmdb.org/t/p/w500"
    var baseUrl = "https://api.themoviedb.org/3/movie/"
    var apiKey = "3a4bf77e064186e7170196ff7fb1519e"
    var movieStart = 100
    var movieEnd = 996
    var apiURL = "?api_key=3a4bf77e064186e7170196ff7fb1519e"
    var appendixURL = "&language=en-US"
    
    let samplePath = "/pIUvQ9Ed35wlWhY2oU6OmwEsmzG.jpg"
    
    func fetchVideos() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/100?api_key=3a4bf77e064186e7170196ff7fb1519e&language=en-US")
        
        self.videos = [Video]()
        
        for i in 100...120 {
            let url = baseUrl + String(i) + apiURL + appendixURL
            print("url: ")
            print(url)
            let updateUrl = NSURL(string: url)
            let request2 = URLRequest(url: updateUrl as! URL)
            let task2 = URLSession.shared.dataTask(with: request2) { (data, response, error) in
                if let data = data {
                    do {
                        let video = Video()
                        let detail = DetailModel()
                        
                        if let dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            if let budget = dictionary["budget"] as? Double {
                                detail.budget = budget
                            }
                            else {
                                detail.budget = 0
                            }
                        
                            if let belongsToCollection = dictionary["belongs_to_collection"] as? NSDictionary {
                                if belongsToCollection.count != 0 {
                                    for i in 0..<belongsToCollection.count {
                                        //print(belongsToCollection["backdrop_path"] as? String)
                                        //print(belongsToCollection["id"] as? Double)
                                        //print(belongsToCollection["name"] as? String)
                                        //print(belongsToCollection["poster_path"] as? String)
                                        
                                        //print("backdrop_path")
                                        //print(belongsToCollection["backdrop_path"])
                                        
                                        detail.backdrop_path = String(describing: belongsToCollection["backdrop_path"])
                                        print("backdrop_path")
                                        print(detail.backdrop_path!)
                                        detail.poster_id = belongsToCollection["id"] as? Double
                                        print("poster_id")
                                        print(detail.poster_id!)
                                        detail.collection_name = String(describing: belongsToCollection["name"])
                                        print("collection_name")
                                        print(detail.collection_name!)
                                        detail.poster_path = String(describing: belongsToCollection["poster_path"])
                                        print("poster_path")
                                        print(detail.poster_path!)
                                    }
                                }
                            }
                            else {
                                detail.backdrop_path = ""
                                detail.poster_id = 0
                                detail.collection_name = ""
                                detail.poster_path = ""
                            }
                            
                            if let genres = dictionary["genres"] as? NSArray {
                                if genres.count != 0 {
                                    for i in 0..<genres.count {
                                        if let temp = genres[i] as? NSDictionary {
                                            detail.genre?.append((temp["name"] as? String)!)
                                        }
                                        else {
                                            print("failure")
                                        }
                                    }
                                }
                            }
                            else {
                                detail.genre = []
                            }
                            
                            if let homepage = dictionary["homepage"] as? String {
                                detail.homepage = homepage
                            }
                            else {
                                detail.homepage = ""
                            }
                            
                            if let imdb = dictionary["imdb_id"] as? String {
                                detail.imdb = imdb
                            }
                            else {
                                detail.imdb = ""
                            }
                            
                            if let original_language = dictionary["original_language"] as? String {
                                detail.original_language = original_language
                            }
                            else {
                                detail.original_language = ""
                            }
                            
                            if let popularity = dictionary["popularity"] as? String {
                                detail.popularity = popularity
                            }
                            else {
                                detail.popularity = ""
                            }
                            
                            detail.production_companies = []
                            
                            if let productionCompany = dictionary["production_companies"] as? NSArray {
                                if productionCompany.count != 0 {
                                    for i in 0..<productionCompany.count {
                                        if let temp = productionCompany[i] as? NSDictionary {
                                            var production_company_name = temp["name"] as? String
                                            detail.production_companies?.append(production_company_name!)
                                        }
                                        else {
                                            print("failure")
                                        }
                                    }
                                }
                            }
                            else {
                                detail.production_companies = []
                            }
                            
                            if let release_date = dictionary["release_date"] as? String {
                                detail.release_date = release_date
                            }
                            else {
                                detail.release_date = ""
                            }

                            if let revenue = dictionary["revenue"] as? Double {
                                detail.revenue = revenue
                            }
                            else {
                                detail.revenue = 0
                            }
                            
                            if let runtime = dictionary["runtime"] as? Double {
                                detail.runtime = runtime
                            }
                            else {
                                detail.runtime = -1
                            }
                            
                            detail.spoken_languages = []
                            
                            if let productionCompany = dictionary["spoken_languages"] as? NSArray {
                                if productionCompany.count != 0 {
                                    for i in 0..<productionCompany.count {
                                        if let temp = productionCompany[i] as? NSDictionary {
                                            var language_name = temp["name"]
                                            detail.spoken_languages?.append(language_name as! String)
                                        }
                                        else {
                                            print("failure")
                                        }
                                    }
                                }
                            }
                            else {
                                detail.spoken_languages = []
                            }
                            
                            if let status = dictionary["status"] as? String {
                                detail.status = status
                            }
                            else {
                                detail.status = ""
                            }
                            
                            if let tagline = dictionary["tagline"] as? String {
                                detail.tagline = tagline
                            }
                            else {
                                detail.tagline = ""
                            }
                            
                            if let title = dictionary["title"] as? String {
                                detail.title = title
                            }
                            else {
                                detail.title = ""
                            }
                            
                            if let avg_vote = dictionary["vote_average"] as? Double {
                                detail.average_vote = avg_vote
                            }
                            else {
                                detail.average_vote = -1
                            }
                            
                            if let avg_cnt = dictionary["vote_count"] as? Double {
                                detail.average_cnt = avg_cnt
                            }
                            else {
                                detail.average_cnt = -1
                            }
                            
                            if let id = dictionary["id"] as? String {
                                detail.id = id
                            }
                            else {
                                detail.id = ""
                            }
                            
                            print("budget")
                            print(detail.budget!)
                            print("backdrop_path")
                            print(detail.backdrop_path!)
                            print("poster_id")
                            print(detail.poster_id!)
                            print("collection_name")
                            print(detail.collection_name!)
                            print("poster_path")
                            print(detail.poster_path!)
                            //print("genre")
                            //print(detail.genre!)
                            print("homepage")
                            print(detail.homepage!)
                            print("imdb")
                            print(detail.imdb!)
                            print("original_language")
                            print(detail.original_language!)
                            print("popularity")
                            print(detail.popularity!)
                            print("production companies")
                            print(detail.production_companies!)
                            print("release_date")
                            print(detail.release_date!)
                            print("revenue")
                            print(detail.revenue!)
                            print("runtime")
                            print(detail.runtime!)
                            print("spoken_languages")
                            print(detail.spoken_languages!)
                            print("status")
                            print(detail.status!)
                            print("tagline")
                            print(detail.tagline!)
                            print("title")
                            print(detail.title!)
                            print("average cnt")
                            print(detail.average_cnt!)
                            print("id")
                            print(detail.id!)
                            print("average_vote")
                            print(detail.average_vote!)
                        
                        }
                        
                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                }
            }
            task2.resume()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        fetchVideos()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

