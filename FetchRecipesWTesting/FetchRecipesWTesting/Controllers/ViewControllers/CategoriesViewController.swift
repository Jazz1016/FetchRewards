//
//  CategoriesViewController.swift
//  FetchRecipesWTesting
//
//  Created by James Lea on 8/26/21.
//

import UIKit

class CategoriesViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var CategoriesTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriesTableView.delegate = self
        CategoriesTableView.dataSource = self
        fetchCategories()
    }
    
    // MARK: - Actions
    
    
    // MARK: - FNs
    func fetchCategories(){
        CategoriesViewModel.fetchCategories { result in
            if result {
                DispatchQueue.main.async {
                    self.CategoriesTableView.reloadData()
                }
            }
        }
    }
    
    func fetchMeals(categoryStr: String){
        CategoriesViewModel.fetchMeals(categoryStr: categoryStr)
    }
    
}//End of class

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoryController.shared.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoriesTableViewCell
        
        let category = CategoryController.shared.categories[indexPath.row]
        
        cell?.category = category
        
        return cell ?? UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMealsVC" {
            guard let destination = segue.destination as? MealsTableViewController,
                  let indexPath = CategoriesTableView.indexPathForSelectedRow else {return}
            let categoryName = CategoryController.shared.categories[indexPath.row].name
            fetchMeals(categoryStr: categoryName)
        }
    }
    
    
}//End of extension
