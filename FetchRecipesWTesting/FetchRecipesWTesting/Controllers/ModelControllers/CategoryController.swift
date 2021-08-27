//
//  CategoryController.swift
//  FetchRecipesWTesting
//
//  Created by James Lea on 8/27/21.
//

import Foundation

class CategoryController {
    static let shared = CategoryController()
    
    var categories: [Category] = []
    
    func fetchCategories(completion: @escaping (Result<[Category], CategoryError>) -> Void){
        let baseUrl = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        var components = URLComponents(string: baseUrl)
        
        guard let finalUrl = components?.url else {return completion(.failure(.invalidURL))}
        
        URLSession.shared.dataTask(with: finalUrl) { data, response, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("Fetched Categories status code: \(response.statusCode)")
            }
            guard let data = data else {return completion(.failure(.noData))}
            do {
                let topLevelObj = try JSONDecoder().decode(TopLevelCategories.self, from: data)
                
                let categories = topLevelObj.categories
                
                completion(.success(categories))
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    
}//End of class
