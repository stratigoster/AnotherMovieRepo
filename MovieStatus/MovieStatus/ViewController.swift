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
        //let url = URL(string: "https://api.themoviedb.org/3/movie/100?api_key=3a4bf77e064186e7170196ff7fb1519e&language=en-US")
        
        for i in 100...120 {
            let url = baseUrl + String(i) + apiURL + appendixURL
            let updateUrl = NSURL(string: url)
            URLSession.shared.dataTask(with: updateUrl as! URL) { (data, response, error) in
                print("successfully added network connection code")
                if error != nil {
                    print(error)
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    print(json)
                    let video = Video()
                    let detail = DetailModel()
                    
                    let dictionary = json as? NSDictionary
                    print("dictionary: ")
                    print(dictionary)
                    
                    if let budget = dictionary?["budget"] as? String {
                        detail.budget = budget
                    }
                    else {
                        detail.budget = ""
                    }
                    
                    detail.genre = []
                    
                    if let genres = dictionary?["genres"] as? NSArray {
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
                    
                    if let homepage = dictionary?["homepage"] as? String {
                        detail.homepage = homepage
                    }
                    else {
                        detail.homepage = ""
                    }
                    
                    if let imdb = dictionary?["imdb_id"] as? String {
                        detail.imdb = imdb
                    }
                    else {
                        detail.imdb = ""
                    }
                    
                    if let original_language = dictionary?["original_language"] as? String {
                        detail.original_language = original_language
                    }
                    else {
                        detail.original_language = ""
                    }
                    
                    if let popularity = dictionary?["popularity"] as? String {
                        detail.popularity = popularity
                    }
                    else {
                        detail.popularity = ""
                    }
                    
                    detail.production_companies = []
                    
                    if let productionCompany = dictionary?["production_companies"] as? NSArray {
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

                    if let release_date = dictionary?["release_date"] as? String {
                        detail.release_date = release_date
                    }
                    else {
                        detail.release_date = ""
                    }
                    
                    if let revenue = dictionary?["revenue"] as? Double {
                        detail.revenue = revenue
                    }
                    else {
                        detail.revenue = -1
                    }
                    
                    if let runtime = dictionary?["runtime"] as? Double {
                        detail.runtime = runtime
                    }
                    else {
                        detail.runtime = -1
                    }
                    
                    if let productionCompany = dictionary?["spoken_languages"] as? NSArray {
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
                    
                    if let status = dictionary?["status"] as? String {
                        detail.status = status
                    }
                    else {
                        detail.status = ""
                    }
                    
                    if let tagline = dictionary?["tagline"] as? String {
                        detail.tagline = tagline
                    }
                    else {
                        detail.tagline = ""
                    }
                    
                    if let title = dictionary?["title"] as? String {
                        detail.title = title
                    }
                    else {
                        detail.title = ""
                    }
                    
                    if let avg_vote = dictionary?["vote_average"] as? Double {
                        detail.average_vote = avg_vote
                    }
                    else {
                        detail.average_vote = -1
                    }
                    
                    if let avg_cnt = dictionary?["vote_count"] as? Double {
                        detail.average_cnt = avg_cnt
                    }
                    else {
                        detail.average_cnt = -1
                    }
                    
                    if let id = dictionary?["id"] as? String {
                        detail.id = id
                    }
                    else {
                        detail.id = ""
                    }
                    
                    print("detail: ")
                    print("id")
                    print(detail.id)
                    print("average cnt")
                    print(detail.average_cnt)
                    print("average_vote")
                    print(detail.average_vote)
                    print("title")
                    print(detail.title)
                    print("tagline")
                    print(detail.tagline)
                    print("status")
                    print(detail.status)
                    print("spoken_languages")
                    print(detail.spoken_languages)
                    print("runtime")
                    print(detail.runtime)
                    print("revenue")
                    print(detail.revenue)
                    print("release_date")
                    print(detail.release_date)
                    print("production companies")
                    print(detail.production_companies)
                    print("popularity")
                    print(detail.popularity)
                    print("original_language")
                    print(detail.original_language)
                    print("budget")
                    print(detail.budget)
                    print("genre")
                    print(detail.genre)
                    print("homepage")
                    print(detail.homepage)
                    print("imdb")
                    print(detail.imdb)
                    
                    print("----------------------------------------------------------------------------")
                    
                    if let avg_cnt = dictionary?["vote_count"] as? Double {
                        detail.average_cnt = avg_cnt
                    }
                    else {
                        detail.average_cnt = -1
                    }
                    
                    if let title = dictionary?["title"] as? String {
                        detail.title = title
                    }
                    else {
                        detail.title = ""
                    }
                    
                    video.title = dictionary?["title"] as? String
                    
                    //var backdrop_total = self.basePhotoUrl + self.samplePath
                    
                    
                    DispatchQueue.main.async(execute: {
                        self.collectionView?.reloadData()
                    })
                    
                }
                catch let jsonError {
                    print(jsonError)
                }
            }.resume()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        fetchVideos()
        // Do any additional setup after loading the view, typically from a nib.
        //set up the collectionView
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.allowsMultipleSelection = true
        collectionView?.allowsSelection = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentPerson: Video = self.videos[indexPath.row]
        let detailVC: DetailViewController = DetailViewController(nibName: nil, bundle: nil)
        
        /*
        let m = model[indexPath.row]
        
        print("DetailModel: ")
        print(m.average_cnt!)
        print(m.average_vote!)
        print(m.backdrop_path!)
        print(m.budget!)
        //print(m.cnt!)
        print(m.collection_name!)
        print(m.homepage!)
        print(m.id!)
        print(m.imdb!)
        print(m.original_language!)
        print(m.popularity!)
        print(m.poster_id!)
        print(m.poster_path!)
        print(m.release_date!)
        */
        
        //detailVC.labels = ["average_cnt: " , "average_vote: ", "budget: ", "genre: ", "homepage: ", "id: ", "imdb: ", "detail homepage: ", "original language: ", "popularity: ", "production_companies: ", "release_date: ", "revenue: ", "runtime: ", "status: ", "tagline: "]
        
        
        //detailVC.images = [, avg_vote, budget, detailVC.homepage!, detailVC.id, detailVC.imdb, detailVC.detail_homepage, detailVC.original_language!, detailVC.popularity!, detailVC.production_companies, detailVC.release_date, detailVC.revenue, detailVC.runtime, detailVC.status, detailVC.tagline]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9/16
        return CGSize(width: view.frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
