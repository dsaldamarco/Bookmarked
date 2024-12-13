//
//  BooksTabView.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 13/12/24.
//

import SwiftUI

struct BooksTabView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Prima sezione: Popular This Week
            Text("Popular This Week")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(sampleBooks) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            Image(book.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 220)
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }

            // Seconda sezione: Recommended Reads
            Text("Recommended Reads")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(recommendedBooks) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            Image(book.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 220)
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


#Preview {
    BooksTabView()
}
