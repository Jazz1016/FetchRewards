//
//  CategoriesTableViewCell.swift
//  FetchRecipesWTesting
//
//  Created by James Lea on 8/26/21.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    // MARK: - Properties
    var category: Category? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews(){
        guard let category = category else {return}
        GlobalFns.displayPicture(url: category.imageStr, UIImageView: categoryImageView)
        categoryLabel.text = category.name
    }
    
}//End of class
