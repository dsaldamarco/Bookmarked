//
//  BookDetailView.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//

import SwiftUI

struct BookDetailView: View {
    
    let book: Book

    @State private var isOptionsModalPresented = false // Stato per la modale delle opzioni
    @State private var isReviewModalPresented = false// Stato per la modale delle recensioni
    @State private var selectedReview: Review? // Recensione selezionata
    
    var body: some View {
        
        _ = selectedReview
       
        return  ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Layout orizzontale: Immagine del libro a sinistra, testo a destra
                HStack(alignment: .top, spacing: 20) {
                    // Immagine del libro
                    Image(book.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 180)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                        .accessibilityLabel("Book cover of \(book.title)")

                    // Testo (titolo, autore, rating, descrizione)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(book.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .accessibilityAddTraits(.isHeader)

                        Text("By \(book.author)")
                            .font(.title3)
                            .foregroundColor(.secondary)
                            .accessibilityLabel("Author: \(book.author)")

                        Text("Published in \(book.publishYear)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .accessibilityLabel("Publication year: \(book.publishYear)")

                        // Sistema di rating
                        HStack {
                            StarRatingView(rating: book.rating)
                            Spacer()
                            Text(String(format: "%.2f/5", book.rating))
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Rating: \(String(format: "%.1f", book.rating)) out of 5 stars")
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal)
                .accessibilityElement(children: .contain)

                // Descrizione
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.headline)
                        .padding(.bottom, 4)
                        .accessibilityAddTraits(.isHeader)

                    Text(book.description)
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10)
                        .accessibilityLabel("Book description: \(book.description)")
                }
                .padding()

                // Sezione recensioni
                if !book.reviews.isEmpty {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Reviews")
                            .font(.headline)
                            .padding(.horizontal)
                            .accessibilityAddTraits(.isHeader)

                        ForEach(book.reviews) { review in
                            ReviewView(review: review)
                                .padding(.horizontal)
                                .onTapGesture {
                                    selectedReview = review
                                                isReviewModalPresented = true
                                }
                                .accessibilityHint("Double tap to view full review")
                        }
                    }
                    .padding(.top, 20)
                    .accessibilityElement(children: .contain)
                    .accessibilityLabel("Reviews section")
                }
            }
            .padding(.vertical, 20)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing: Button(action: {
                isOptionsModalPresented.toggle()
            }) {
                Image(systemName: "ellipsis")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
                .accessibilityLabel("Book options")
                .accessibilityHint("Double tap to show additional options for this book")
        )
        // Modale per le opzioni
        .sheet(isPresented: $isOptionsModalPresented) {
            BookOptionsModalView(book: book)
        }
        // Modale per le recensioni
        .sheet(isPresented: $isReviewModalPresented) {
            if let review = selectedReview {
                ReviewModalView(review: review, book: book)
            }
        }
    }
}
#Preview {
    ContentView()
}
