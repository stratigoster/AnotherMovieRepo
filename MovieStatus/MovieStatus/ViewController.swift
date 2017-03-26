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
            let updateUrl = NSURL(string: url)
            let request2 = URLRequest(url: updateUrl as! URL)
            let task2 = URLSession.shared.dataTask(with: request2) { (data, response, error) in
                print("Task completed")
                if let data = data {
                    do {
                        if let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            print("result")
                            print(jsonResult)
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

