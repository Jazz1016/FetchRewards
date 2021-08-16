//
//  MealsTableViewModel.swift
//  FetchRecipes
//
//  Created by James Lea on 8/15/21.
//

import Foundation

class MealsTableViewModel {
    static func fetchMeal(mealId: String, completion: @escaping (Result<Meal, MealError>) -> Void){
        MealController.shared.fetchDetailedMeal(mealId: mealId) { result in
            switch result {
            case .success(let meal):
                completion(.success(meal))
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(.failure(.thrownError(error)))
            }
        }
    }
    
}
