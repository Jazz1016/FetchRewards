//
//  MealTableViewCell.swift
//  FetchRecipesWTesting
//
//  Created by James Lea on 8/27/21.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealLabel: UILabel!
    
    var meal: Meal? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews(){
        guard let meal = meal else {return}
        GlobalFns.displayPicture(url: meal.strMealThumb, UIImageView: mealImageView)
        mealLabel.text = meal.strMeal
    }
    
}//End of class
