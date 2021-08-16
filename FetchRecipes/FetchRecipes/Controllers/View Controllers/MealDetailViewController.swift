//
//  MealDetailViewController.swift
//  FetchRecipes
//
//  Created by James Lea on 8/15/21.
//

import UIKit

class MealDetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var mealThumbnailImageView: UIImageView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Properties
    var mealId: String?
    var meal: Meal? {
        didSet {
            updateViews()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let mealId = mealId else {return}
        MealController.shared.fetchDetailedMeal(mealId: mealId) { result in
            switch result {
            case .success(let meal):
                self.meal = meal
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
    func updateViews(){
        guard let meal = meal else {return}
        GlobalFns.displayPicture(url: meal.strMealThumb, UIImageView: self.mealThumbnailImageView)
        
        
        
        
        
    }

}//End of class
