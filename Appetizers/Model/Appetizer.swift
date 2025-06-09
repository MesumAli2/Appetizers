//
//  Appetizer.swift
//  Appetizers
//
//  Created by Mesum Syed on 28/05/2025.
//

import Foundation

struct Appetizer : Decodable, Identifiable {
    let id: Int
    let description: String
    let price: Double
    let imageURL: String
    let name: String
    let protein: Int
    let calories: Int
    let carbs: Int

}

struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}

struct MOCKDATA {
    static let sampleAppetizer = Appetizer(
        id: 123,
        description: "Seasoned shrimp from the depths of the Atlantic Ocean.",
        price: 6.99,
        imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
        name: "Asian Flank Steak",
        protein: 14,
        calories: 300,
        carbs: 0
    )
    
    static let appetizers: [Appetizer] = (0..<5).map { offset in
        Appetizer(
            id: sampleAppetizer.id + offset,
            description: sampleAppetizer.description,
            price: sampleAppetizer.price,
            imageURL: sampleAppetizer.imageURL,
            name: sampleAppetizer.name,
            protein: sampleAppetizer.protein,
            calories: sampleAppetizer.calories,
            carbs: sampleAppetizer.carbs
        )
    }
}


