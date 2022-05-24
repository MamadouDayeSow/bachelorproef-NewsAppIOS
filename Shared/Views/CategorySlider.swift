//
//  CategorySlider.swift
//  NewsAppSwiftUI (iOS)
//
//  Created by Daye Sow on 11/04/2022.
//

import SwiftUI

struct CategorySlider: View {
    @EnvironmentObject var viewModel: NewsViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.getCategories(), id: \.self) { category in
                    NavigationLink(destination: ArticleFromCategoryList(viewModel: _viewModel, category: category.categoryName)) {
                        Text(category.categoryName)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 120, height: 70)
                            .background(Image(category.imageUrl)
                                .resizable()
                                .cornerRadius(6)
                                )

                    }

                }
            }
        }
        .padding()
    }
}


