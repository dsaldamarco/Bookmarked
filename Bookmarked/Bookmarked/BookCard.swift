//
//  BookCard.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 16/12/24.
//

//
//  BookCard.swift
//  Bookmarked
//

import SwiftUI

struct BookCard: View {
    let book: Book
    let namespace: Namespace.ID
    @Binding var selectedBook: Book?
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            // Book Cover with matched geometry
            Image(book.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .matchedGeometryEffect(id: book.id, in: namespace)
                .shadow(radius: 5)
            
            // Book details
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // Rating
                HStack {
                    StarRatingView(rating: book.rating)
                    Text(String(format: "%.1f", book.rating))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 2)
            }
            .padding(12)
        }
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 8)
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                selectedBook = book
                isShowingDetail = true
            }
        }
    }
}

// End of fil
