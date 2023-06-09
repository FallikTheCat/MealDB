//
//  Deserts.swift
//  MealDB
//
//  Created by Baturay Koç on 6/4/23.
//

import SwiftUI

struct Desserts: View {
    @ObservedObject var mealViewModel = MealViewModel()
    
    var body: some View {
        NavigationView {
            List(mealViewModel.meals.sorted(by: { $0.strMeal < $1.strMeal })) { meal in
                NavigationLink(destination: DessertDetails(meal: meal, mealDetails: mealViewModel.mealDetails)) {
                    VStack(alignment: .leading) {
                        Text(meal.strMeal)
                            .font(.title)
                            .italic()

                        RemoteImage(url: meal.strMealThumb)
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
            .listStyle(.inset)
            .onAppear(perform: mealViewModel.fetchMeals)
            .navigationTitle("Desserts")
            .preferredColorScheme(.dark)
        }
    }
}

struct Deserts_Previews: PreviewProvider {
    static var previews: some View {
        Desserts()
    }
}
