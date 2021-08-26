//
//  CategoriesViewModel.swift
//  FetchRecipesWTesting
//
//  Created by James Lea on 8/26/21.
//

import Foundation

class CategoriesViewModel {
    static func fetchCategories(completion: @escaping (Bool) -> Void){
        DispatchQueue.main.async {
            CategoryController.shared.fetchCategories { result in
                switch result {
                case .success(let categories):
                    CategoryController.shared.categories = categories
                    completion(true)
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                    completion(false)
                }
            }
        }
    }
    
    static func fetchMeals(categoryStr: String){
        MealController.shared.fetchMeals(categoryStr: categoryStr) { result in
            switch result {
            case .success(let meals):
                MealController.shared.meals = meals
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
}//End of class
