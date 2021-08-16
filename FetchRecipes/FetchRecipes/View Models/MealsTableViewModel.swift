//
//  MealsTableViewModel.swift
//  FetchRecipes
//
//  Created by James Lea on 8/15/21.
//

import Foundation

class MealsTableViewModel {
    static func fetchMeal(){
        MealController.shared.fetchDetailedMeal(mealId: "53050") { result in
            switch result {
            case .success(let meal):
                print(meal)
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
}
