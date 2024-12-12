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
    @State private var isReviewModalPresented = false // Stato per la modale delle recensioni
    @State private var selectedReview: Review? // Recensione selezionata

    var body: some View {
        ScrollView {
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

                    // Testo (titolo, autore, rating, descrizione)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(book.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)

                        Text("By \(book.author)")
                            .font(.title3)
                            .foregroundColor(.secondary)

                        Text("Published in \(book.publishYear)")
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
                    .padding(.top, 10)
                }
                .padding(.horizontal)

                // Descrizione
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.headline)
                        .padding(.bottom, 4)

                    Text(book.description)
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10)
                }
                .padding()

                // Sezione recensioni
                if !book.reviews.isEmpty {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Reviews")
                            .font(.headline)
                            .padding(.horizontal)

                        ForEach(book.reviews) { review in
                            ReviewView(review: review)
                                .padding(.horizontal)
                                .onTapGesture {
                                    self.selectedReview = review
                                    self.isReviewModalPresented = true // Mostra la modale delle recensioni
                                }
                        }
                    }
                    .padding(.top, 20)
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
        )
        // Modale per le opzioni
        .sheet(isPresented: $isOptionsModalPresented) {
            BookOptionsModalView(book: book)
        }
        // Modale per le recensioni
        .sheet(isPresented: $isReviewModalPresented) {
            if let review = selectedReview {
                ReviewModalView(isPresented: $isReviewModalPresented, review: review, book: book)
            }
        }
    }
}
#Preview {
    ContentView()
}
