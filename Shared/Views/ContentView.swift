//
//  ContentView.swift
//  Shared
//
//  Created by Daye Sow on 04/05/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel:  NewsViewModel

    var body: some View {
        NavigationView {
            ZStack {
                ArticleList()
                    .navigationTitle("DailyPaper")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(NewsViewModel())
        }
    }
}

struct ArticleList: View {
    @EnvironmentObject var viewModel: NewsViewModel

    var body: some View {
        VStack {

            CategorySlider()

            ScrollView{

                VStack {
                    ForEach(viewModel.articles, id: \.self) { article in
                        NavigationLink(destination: Webview(url: article.url!)
                            .navigationTitle("DailyPaper"))
                        { ArticleListView(image: article.urlToImage ?? "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg", title: article.title, description: article.description ?? "No description for this article")
                        }
                        .padding([.leading, .bottom, .trailing])
                    }
                    if viewModel.isLoading {
                       ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            .scaleEffect(3)
                    }
                }
                .padding()
            }

        }
    }
}


extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationBar.tintColor = .black
    }
}
