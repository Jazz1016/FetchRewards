//
//  Category.swift
//  FetchRecipesWTesting
//
//  Created by James Lea on 8/27/21.
//

import Foundation

struct TopLevelCategories: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let imageStr: String
    let description: String
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case imageStr = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}//End of struct
