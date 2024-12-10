//
//  BookCardView.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//
import SwiftUI

struct BookCardView: View {
    let book: Book

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // Immagine
            Image(book.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 150)
                .clipped()
                .cornerRadius(8)

            // Testo
            VStack(alignment: .leading, spacing: 8) {
                Text(book.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2) // Limita il titolo a due righe

                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                // Sistema di rating
                StarRatingView(rating: book.rating)
            }
        }
        .padding(12) // Margine interno uniforme
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
