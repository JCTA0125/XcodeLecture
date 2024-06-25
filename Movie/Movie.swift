//
//  Movie.swift
//  Movie
//
//  Created by mac12 on 5/20/24.
//

import UIKit

class Movie {
    var title: String?
    var description: String?
    var image: UIImage?
}

let dataset = [
    ("Chasing Amy", "1997 American romantic comedy-drama film", "0.jpg"),
    ("Mallrats", "1995 American romantic buddy comedy film", "1.jpg"),
    ("Dogma", "1999 American fantasy comedy film", "2.jpg"),
    ("Clerks", "1994 American independent black-and-white buddy comedy film", "3.jpg"),
    ("Jay & Silent Bob Strike Back", "2001 American comedy film", "4.jpg"),
    ("Red State", "2011 American independent horror thriller film", "5.jpg"),
    ("Cop Out", "2010 American buddy cop action-comedy film", "6.jpg"),
    ("Jersey Girl", "2004 American comedy-drama film", "7.jpg")
]

var movies: [Movie] = []
