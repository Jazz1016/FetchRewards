//
//  MealController.swift
//  FetchRecipesWTesting
//
//  Created by James Lea on 8/27/21.
//

import Foundation

class MealController {
    static let shared = MealController()
    
    var meals: [Meal] = []
    
    
    func fetchMeals(categoryStr: String, completion: @escaping (Result <[Meal], MealError>) -> Void){
        var baseURL = "https://www.themealdb.com/api/json/v1/1/filter.php?"
        var components = URLComponents(string: baseURL)
        let apiQuery = URLQueryItem(name: "c", value: categoryStr)
        
        components?.queryItems = [apiQuery]
        
        guard let finalUrl = components?.url else {return completion(.failure(.invalidURL))}
        
        URLSession.shared.dataTask(with: finalUrl) { data, response, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("Fetched Meals status code: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelObj = try JSONDecoder().decode(TopLevelMeals.self, from: data)
                
                let meals = topLevelObj.meals
                
                completion(.success(meals))
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    func fetchDetailedMeal(mealId: String, completion: @escaping (Result <Meal, MealError>) -> Void){
        var baseURL = "https://www.themealdb.com/api/json/v1/1/lookup.php?"
        var components = URLComponents(string: baseURL)
        let apiQuery = URLQueryItem(name: "i", value: mealId)
        
        components?.queryItems = [apiQuery]
        
        guard let finalUrl = components?.url else {return completion(.failure(.invalidURL))}
        
        URLSession.shared.dataTask(with: finalUrl) { data, response, error in
            //            if let error = error {
            //                return completion(.failure(.thrownError(error)))
            //            }
            
            if let response = response as? HTTPURLResponse {
                print("Fetched single meal status code: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelObj = try JSONDecoder().decode(TopLevelMeals.self, from: data)
                
                let meal = topLevelObj.meals[0]
                
                completion(.success(meal))
            } catch {
                completion(.failure(.thrownError(error)))
            }
            
        }.resume()
    }
    
    
    
}//End of class
