//
//  ViewController.swift
//  CollectionViewDemo1
//
//  Created by Ajay Bandi on 11/10/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "movie", for: indexPath) as! MovieCollectionViewCell
        
        cell.assignMovie(with: movies[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        assignMovieDetails(index: indexPath)
    }
    
    func assignMovieDetails(index: IndexPath){
        titleOutlet.text = "Movie title: \(movies[index.row].title)"
        YearOL.text = "Year Released: \(movies[index.row].releasedYear)"
        RatingOL.text = "Rating: \(movies[index.row].movieRating)"
        RevenueOL.text = "Box Office: \(movies[index.row].boxOffice)"
            }
    
    @IBOutlet weak var YearOL: UILabel!
    
    @IBOutlet weak var CollectionViewOutlet: UICollectionView!
    
    
    @IBOutlet weak var titleOutlet: UILabel!
    
    @IBOutlet weak var RatingOL: UILabel!
    
    @IBOutlet weak var RevenueOL: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CollectionViewOutlet.delegate = self
        CollectionViewOutlet.dataSource = self
    }


}

