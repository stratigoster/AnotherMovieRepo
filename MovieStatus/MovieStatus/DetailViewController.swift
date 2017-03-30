//
//  DetailViewController.swift
//  MovieStatus
//
//  Created by xszhao on 2017-03-25.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var images:[String] = []
    var labels:[String] = []
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        collectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: "foodCell")
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        //TODO: add layout code here
        view.addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        view.addConstraintsWithFormat("V:|[v0]|", views: collectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //Specifying the number of cells in the given section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCollectionViewCell
        cell.awakeFromNib()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let foodCell = cell as! FoodCollectionViewCell
        
        if images[indexPath.row] != nil {
            foodCell.input.text = labels[indexPath.row] + images[indexPath.row]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
}
