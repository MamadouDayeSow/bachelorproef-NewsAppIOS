//
//  ArticleListView.swift
//  NewsAppSwiftUI (iOS)
//

//

import SwiftUI

struct ArticleListView: View {
    @State var image: String
    @State var title: String
    @State var description: String
    var body: some View {
        VStack() {
            AsyncImage(url: URL(string: image)) { imag in
                imag.resizable()
                

            } placeholder: {
               ProgressView()
            }
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 6))

            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .padding(.bottom, 2.0)

            Text(description)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(image: "Business", title: "title", description: "")
    }
}
