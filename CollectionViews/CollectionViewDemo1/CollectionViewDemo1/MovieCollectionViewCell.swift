//
//  MovieCollectionViewCell.swift
//  CollectionViewDemo1
//
//  Created by Ajay Bandi on 11/10/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    func assignMovie(with movie: Movie){
        imageViewOutlet.image = movie.image
    }
}
