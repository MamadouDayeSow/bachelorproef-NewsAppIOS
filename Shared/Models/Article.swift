//
//  ArticleModel.swift
//  NewsAppSwiftUI (iOS)
//
//  Created by Daye Sow on 04/05/2022.
//

import Foundation

struct NewsAPIResponse: Codable {
    var articles: [Article]
}
struct Article: Codable, Hashable{
    var author: String?
    var title: String
    var description: String?
    var url: String?
    var urlToImage: String?

    init(author: String, title: String, description: String,
         url: String, urlToImage: String) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
    }


}
