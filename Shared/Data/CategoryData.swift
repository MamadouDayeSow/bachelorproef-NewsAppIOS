//
//  CategoryData.swift
//  NewsAppSwiftUI (iOS)
//
//  Created by Daye Sow on 04/05/2022.
//

import Foundation

struct CategoryData {
    func getCategories() -> [CategoryModel] {
        var category: [CategoryModel] = []
        
        category = [
            CategoryModel(categoryName: "Business", imageUrl: "Business"),
            CategoryModel(categoryName: "Entertainment", imageUrl: "Entertainment"),
            CategoryModel(categoryName: "General", imageUrl:        "General"),
            CategoryModel(categoryName: "Health", imageUrl:            "Health"),
            CategoryModel(categoryName: "Science", imageUrl:            "Science"),
            CategoryModel(categoryName: "Sports", imageUrl:              "Sports"),
            CategoryModel(categoryName: "Technology", imageUrl:               "Technology")
        ]


        return category
    }

}

