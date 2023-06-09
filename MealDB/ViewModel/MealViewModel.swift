//
//  MealViewModel.swift
//  MealDB
//
//  Created by Baturay Koç on 6/4/23.
//

import SwiftUI

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var selectedMeal: Meal?
    @Published var mealDetails: MealDetails?
    @Published var fetched: Bool = false
    
    func fetchMeals() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("Data not found")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(MealsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.meals = decodedData.meals
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func fetchMealDetails(for meal: Meal) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(meal.idMeal)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(MealDetailsResponse.self, from: data)
                    if let mealDetails = response.meals.first {
                        DispatchQueue.main.async {
                            self.mealDetails = mealDetails
                            self.fetched = true
                        }
                    }
                } catch {
                    print("Error decoding meal details: \(error)")
                }
            }
        }.resume()
    }
}
