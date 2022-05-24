//
//  ArticleFromCateogryList.swift
//  NewsAppSwiftUI (iOS)
//
//  Created by Daye Sow on 11/05/2022.
//

import SwiftUI

struct ArticleFromCategoryList: View {

    @EnvironmentObject var viewModel: NewsViewModel
    var category: String = ""


    var body: some View {
        ScrollView {
            VStack {
              //  viewModel.getArticlesFromCategory(categoryName: category) viewModel.articles
                ForEach(viewModel.getArticlesFromCategory(categoryName: category), id: \.self) { article in
                    NavigationLink(destination: Webview(url: article.url!))
                    { ArticleListView(image: article.urlToImage ?? "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg", title: article.title, description: article.description ?? "No description for this article")
                    }
                    .padding()

                }
                if viewModel.isLoading {
                   ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .scaleEffect(3)
                }

            }.padding()
        }.navigationTitle("DailyPaper")
    }
}



