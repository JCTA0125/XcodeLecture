//
//  Movie.swift
//  Movie
//
//  Created by dheum on 2021/05/10.
//  Copyright © 2021 dheum. All rights reserved.
//

import UIKit

class Meal {
    var title: String?
    var description: String?
    var image: UIImage?
    var price:Int?
}

let dataset = [
    ("Caprese Salad", "a simple Italian salad, made of sliced fresh mozzarella, tomatoes, and sweet basil", "meal1.png", 9000),
    ("Chicken and Potatoes", "an Italian-American dish made from chicken and wedges of potato", "meal2.png", 13000),
    ("Pasta with Meatballs", "an Italian-American dish consisting of spaghetti, tomato sauce and meatballs", "meal3.png", 11000),
]

var meals: [Meal] = []

