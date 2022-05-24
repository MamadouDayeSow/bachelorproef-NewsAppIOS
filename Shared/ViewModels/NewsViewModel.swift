//
//  NewsViewModel.swift
//  NewsAppSwiftUI (iOS)
//
//  Created by Daye Sow on 04/05/2022.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles : [Article] = []
    @Published var articlesFromCategory : [Article] = []
    @Published var isLoading: Bool = true
    private var categoryName: String = ""

    var categoryData: CategoryData = CategoryData()
    init(){
        getArticles()
    }

    func getCategories() -> [CategoryModel] {
        categoryData.getCategories()
    }

    func getArticlesFromCategory(categoryName: String) -> [Article]{
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?category=\(categoryName)&country=us&apiKey=f1045f85212d435a855a70e99532b81b") else {
            print("Invalid URL")
            return []
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(NewsAPIResponse.self, from: data)

                    result.articles.forEach { el in
                        if (el.urlToImage == nil || el.description == nil) {

                        } else {

                            DispatchQueue.main.async { [self] in
                                self.isLoading = true
                                self.articlesFromCategory = result.articles
                                isLoading = false

                            }
                        }
                    }

                } catch {
                    print(error)
                }
            }
        }
        task.resume()
        return articlesFromCategory
    }

    func getArticles(){

//        "https://newsapi.org/v2/top-headlines?country=us&apiKey=97a7d4d8225e42c78d17a087b1c3181b"
 //   https://newsapi.org/v2/top-headlines?country=us&apiKey=f1045f85212d435a855a70e99532b81b
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=97a7d4d8225e42c78d17a087b1c3181b") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(NewsAPIResponse.self, from: data)

                    result.articles.forEach { el in
                        if (el.urlToImage == nil || el.description == nil) {

                        } else {
                            DispatchQueue.main.async {
                                self.articles = result.articles
                            }
                        }
                    }

                } catch {
                   print(error)
                }
            }
        }
        task.resume()
    }
}


