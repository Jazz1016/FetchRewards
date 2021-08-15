//
//  CategoriesViewController.swift
//  FetchRecipes
//
//  Created by James Lea on 8/15/21.
//

import UIKit

class CategoriesViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var CategoriesTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fetchCategories()
//        fetchMeals()
        fetchMeal()
    }
    
    // MARK: - Actions
    
    
    // MARK: - FNs
    func fetchCategories(){
        CategoryController.shared.fetchCategories { result in
            switch result {
            case .success(let categories):
                print(categories)
                CategoryController.shared.categories = categories
                
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
    func fetchMeals(){
        MealController.shared.fetchMeals(categoryStr: "Chicken") { result in
            switch result {
            case .success(let meals):
                print(meals)
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
    func fetchMeal(){
        MealController.shared.fetchDetailedMeal(mealId: "52874") { result in
            switch result {
            case .success(let meal):
                print(meal)
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
    
    
}//End of class

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoryController.shared.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        
        
        return cell
    }
    
    
}//End of extension
