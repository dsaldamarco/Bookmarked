//
//  Untitled.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Layout con immagine a sinistra e testo a destra
                HStack(spacing: 15) {
                    // Immagine del libro
                    Image(book.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 180) // Immagine più piccola
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 5)
                        .padding(.horizontal)

                    // Dettagli del libro a destra
                    VStack(alignment: .leading, spacing: 10) {
                        // Titolo del libro
                        Text(book.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        // Autore del libro
                        Text("by \(book.author)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        // Anno di pubblicazione
                       Text("Published: \(book.publishYear)")
                           .font(.subheadline)
                           .foregroundColor(.secondary)

                        // Sistema di rating
                        HStack {
                            StarRatingView(rating: book.rating)
                            Spacer()
                            Text(String(format: "%.2f/5", book.rating))
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding()

                // Descrizione del libro
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.headline)
                        .padding(.bottom, 4)

                    Text(book.description)
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineLimit(nil) // Per descrizione lunga
                }
                .padding(.horizontal)

                // Sezione recensioni
                if !book.reviews.isEmpty {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Reviews")
                            .font(.headline)
                            .padding(.horizontal)

                        ForEach(book.reviews) { review in
                            ReviewView(review: review)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.top, 20)
                }
            }
            .padding(.vertical, 20)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
