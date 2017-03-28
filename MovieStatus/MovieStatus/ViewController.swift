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
