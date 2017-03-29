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
    
    func parseData() {
        for i in 100...116 {
        let url = baseUrl + String(i) + apiURL + appendixURL
        let updateUrl = NSURL(string: url)
        URLSession.shared.dataTask(with: updateUrl as! URL) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                let video = Video()
                let detail = DetailModel()
                
                let dictionary = json as? NSDictionary
                
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
                
                var backdrop_total = self.basePhotoUrl + self.samplePath
                
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
                print("video.title: ")
                print(video.title)
                
                var content = "No content available"
                
                if let overView = dictionary?["overview"] as? String {
                    content = overView
                }
                else {
                    content = ""
                }
                
                if let popularity = dictionary?["popularity"] as? String {
                    video.popularity = popularity
                }
                else {
                    video.popularity = ""
                }
                
                if let overView = dictionary?["overview"] as? String {
                    content = overView
                }
                else {
                    content = ""
                }
                
                if let popularity = dictionary?["popularity"] as? String {
                    video.popularity = popularity
                }
                else {
                    video.popularity = ""
                }
                
                if let backdrop_url = dictionary?["backdrop_path"] as? String {
                    backdrop_total = self.basePhotoUrl + backdrop_url
                }
                else {
                    backdrop_total = ""
                }
                
                video.thumbnailImageName = backdrop_total
                print("video.thumbnailImageName:" + video.thumbnailImageName!)
                
                //creates the images of the profile list
                let channel = Channel()
                
                if let name = dictionary?["releaseData"] as? String {
                    channel.name = name
                }
                else {
                    channel.name = ""
                }
                
                var outputTotal = self.basePhotoUrl + self.samplePath
                print("outputTotal: ")
                print(outputTotal)
                
                if let output:String = dictionary?["poster_path"] as? String {
                    outputTotal = self.basePhotoUrl + output
                }
                else {
                    outputTotal = ""
                }
                
                channel.profileImageName = outputTotal
                
                print("channel.profileImageName:" + channel.profileImageName!)
                
                video.channel = channel
                
                print(self.videos)
                self.videos.append(video)
                print(self.model)
                self.model.append(detail)
                
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
    
    func fetchVideos() {
        //let url = URL(string: "https://api.themoviedb.org/3/movie/100?api_key=3a4bf77e064186e7170196ff7fb1519e&language=en-US")
        
        parseData()
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
        
        let htmlSource = "Questions? Corrections? <a href=\"https://twitter.com/NSHipster\">@NSHipster</a> or <a href=\"https://github.com/NSHipster/articles\">on GitHub</a>."
        
        let linkRegexPattern = "<a\\s+[^>]*href=\"([^\"]*)\"[^>]*>"
        let linkRegex = try! NSRegularExpression(pattern: linkRegexPattern,
                                                 options: .caseInsensitive)
        let matches = linkRegex.matches(in: htmlSource,
                                        range: NSMakeRange(0, htmlSource.utf16.count))
        
        let links = matches.map { result -> String in
            let hrefRange = result.rangeAt(1)
            let start = String.UTF16Index(hrefRange.location)
            let end = String.UTF16Index(hrefRange.location + hrefRange.length)
            
            return String(htmlSource.utf16[start..<end])!
        }
        print(links)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("item selected")
        print("at index:")
        print(indexPath.row)
        
        let currentPerson: Video = self.videos[indexPath.row]
        let detailVC: DetailViewController = DetailViewController(nibName: nil, bundle: nil)
        
        
        let m = model[indexPath.row]
        print(m)
        
        
        print("DetailModel: ")
        print("---------------")
        print("average cnt: ")
        print(m.average_cnt!)
        print("average vote: ")
        print(m.average_vote!)
        print("budget: ")
        print(m.budget!)
        print("homepage: ")
        print(m.homepage!)
        print("id: ")
        print(m.id!)
        print("imdb: ")
        print(m.imdb!)
        print("original_language: ")
        print(m.original_language!)
        print("popularity: ")
        print(m.popularity!)
        print("release_date: ")
        print(m.release_date!)
        
        
        detailVC.labels = ["budget: ", "homepage: ", "id: ", "imdb: ", "original language: ", "popularity: ", "release_date: "]
        
        
        detailVC.images = [m.budget!, m.homepage!, m.id!, m.imdb!, m.original_language!, m.popularity!, m.release_date!]
        self.navigationController?.pushViewController(detailVC, animated: true)
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
