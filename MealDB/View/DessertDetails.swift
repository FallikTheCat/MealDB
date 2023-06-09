//
//  DesertDetails.swift
//  MealDB
//
//  Created by Baturay Koç on 6/4/23.
//

import SwiftUI

struct DessertDetails: View {
    @ObservedObject var mealViewModel = MealViewModel()
    @State var meal: Meal
    @State var mealDetails: MealDetails?
    @State private var ingredients: [String] = []
    
    func getIngredients() {
        if let mealDetails = mealDetails {
            if !mealDetails.strIngredient1.isEmpty {
                ingredients.append(mealDetails.strIngredient1 + " - " + mealDetails.strMeasure1)
            }
            if !mealDetails.strIngredient2.isEmpty {
                ingredients.append(mealDetails.strIngredient2 + " - " + mealDetails.strMeasure2)
            }
            if !mealDetails.strIngredient3.isEmpty {
                ingredients.append(mealDetails.strIngredient3 + " - " + mealDetails.strMeasure3)
            }
            if !mealDetails.strIngredient4.isEmpty {
                ingredients.append(mealDetails.strIngredient4 + " - " + mealDetails.strMeasure4)
            }
            if !mealDetails.strIngredient5.isEmpty {
                ingredients.append(mealDetails.strIngredient5 + " - " + mealDetails.strMeasure5)
            }
            if !mealDetails.strIngredient6.isEmpty {
                ingredients.append(mealDetails.strIngredient6 + " - " + mealDetails.strMeasure6)
            }
            if !mealDetails.strIngredient7.isEmpty {
                ingredients.append(mealDetails.strIngredient7 + " - " + mealDetails.strMeasure7)
            }
            if !mealDetails.strIngredient8.isEmpty {
                ingredients.append(mealDetails.strIngredient8 + " - " + mealDetails.strMeasure8)
            }
            if !mealDetails.strIngredient9.isEmpty {
                ingredients.append(mealDetails.strIngredient9 + " - " + mealDetails.strMeasure9)
            }
            if !mealDetails.strIngredient10.isEmpty {
                ingredients.append(mealDetails.strIngredient10 + " - " + mealDetails.strMeasure10)
            }
            if !mealDetails.strIngredient11.isEmpty {
                ingredients.append(mealDetails.strIngredient11 + " - " + mealDetails.strMeasure11)
            }
            if !mealDetails.strIngredient12.isEmpty {
                ingredients.append(mealDetails.strIngredient12 + " - " + mealDetails.strMeasure12)
            }
            if !mealDetails.strIngredient13.isEmpty {
                ingredients.append(mealDetails.strIngredient13 + " - " + mealDetails.strMeasure13)
            }
            if !mealDetails.strIngredient14.isEmpty {
                ingredients.append(mealDetails.strIngredient14 + " - " + mealDetails.strMeasure14)
            }
            if !mealDetails.strIngredient15.isEmpty {
                ingredients.append(mealDetails.strIngredient15 + " - " + mealDetails.strMeasure15)
            }
            if !mealDetails.strIngredient16.isEmpty {
                ingredients.append(mealDetails.strIngredient16 + " - " + mealDetails.strMeasure16)
            }
            if !mealDetails.strIngredient17.isEmpty {
                ingredients.append(mealDetails.strIngredient17 + " - " + mealDetails.strMeasure17)
            }
            if !mealDetails.strIngredient18.isEmpty {
                ingredients.append(mealDetails.strIngredient18 + " - " + mealDetails.strMeasure18)
            }
            if !mealDetails.strIngredient19.isEmpty {
                ingredients.append(mealDetails.strIngredient19 + " - " + mealDetails.strMeasure19)
            }
            if !mealDetails.strIngredient20.isEmpty {
                ingredients.append(mealDetails.strIngredient20 + " - " + mealDetails.strMeasure20)
            }
        }
    }
    
    var body: some View {
        VStack {
            if let mealDetails = mealDetails {
                ScrollView {
                    RemoteImage(url: meal.strMealThumb)
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.9)

                    Text("Ingredients:")
                        .font(.headline)
                        .padding()
                    
                    ForEach(ingredients, id: \.self) { ing in
                        Text(ing)
                    }

                    Text("Instructions:")
                        .font(.headline)
                        .padding(.top)

                    Text(mealDetails.strInstructions)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                .onAppear{
                    getIngredients()
                }
            } else {
                ProgressView()
            }
        }
        .onAppear{
            mealViewModel.selectedMeal = meal
            mealViewModel.fetchMealDetails(for: meal)
        }
        .onChange(of: mealViewModel.fetched) { _ in
            mealDetails = mealViewModel.mealDetails
            if mealViewModel.fetched {
                mealViewModel.fetched = false
            }
        }
        .navigationTitle(meal.strMeal)
        .background{
            ZStack{
                VStack{
                    Circle()
                        .fill(Color.yellow)
                        .scaleEffect(0.6)
                        .offset(x:80)
                        .blur(radius: 120)
                    Circle()
                        .fill(Color.orange)
                        .scaleEffect(0.6, anchor: .leading)
                        .offset(y: -10)
                        .blur(radius: 120)
                }
            }
        }
    }
}
