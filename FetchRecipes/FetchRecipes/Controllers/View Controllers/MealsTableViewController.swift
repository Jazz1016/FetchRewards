//
//  MealsTableViewController.swift
//  FetchRecipes
//
//  Created by James Lea on 8/15/21.
//

import UIKit

class MealsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MealController.shared.meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as? MealTableViewCell
        
        let meal = MealController.shared.meals[indexPath.row]
        
        cell?.meal = meal
        
        return cell ?? UITableViewCell()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMealDetailVC" {
            guard let destination = segue.destination as? MealDetailViewController,
                  let indexPath = self.tableView.indexPathForSelectedRow else {return}
            
            let meal = MealController.shared.meals[indexPath.row]
            
            destination.meal = meal
        }
    }
    

}//End of class
