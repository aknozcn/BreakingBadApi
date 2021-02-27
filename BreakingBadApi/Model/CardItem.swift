//
//  CardItem.swift
//  BreakingBadApi
//
//  Created by sh3ll on 27.02.2021.
//

import Foundation
import CardSlider

struct Item: CardSliderItem {
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
}
