//
//  BookOptionsModalView.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 11/12/24.
//

import SwiftUI

struct BookOptionsModalView: View {
    let book: Book
    
    @State private var isReadSelected = false
    @State private var isRecommendSelected = false
    @State private var isBookmarkSelected = false
    @State private var rating = 0 // Numero di stelle selezionate
    
    var body: some View {
        VStack(spacing: 20) {
            // Titolo del libro
            Text(book.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Published in \(book.publishYear)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom)
            
            // Sezione dei pulsanti "Read", "Recommend" e "Bookmark"
            HStack {
                // Pulsante "Read" a sinistra
                Button(action: {
                    isReadSelected.toggle()
                }) {
                    VStack {
                        Image(systemName: isReadSelected ? "book.fill" : "book")
                            .font(.system(size: 40))
                            .foregroundColor(isReadSelected ? .blue : .gray)
                            .padding(.bottom, 3)
                        Text("Read")
                            .font(.body)
                            .foregroundColor(isReadSelected ? .blue : .gray)
                    }
                }

                // Spazio tra "Read" e "Recommend"
                Spacer()

                // Pulsante "Recommend" al centro
                Button(action: {
                    isRecommendSelected.toggle()
                }) {
                    VStack {
                        Image(systemName: isRecommendSelected ? "circle.fill" : "circle")
                            .font(.system(size: 40))
                            .foregroundColor(isRecommendSelected ? .red : .gray)
                            .padding(.bottom, 3)
                        Text("Recommend")
                            .font(.body)
                            .foregroundColor(isRecommendSelected ? .red : .gray)
                    }
                }
                .frame(maxWidth: .infinity) // Assicura che il pulsante occupi il centro disponibile

                // Spazio tra "Recommend" e "Bookmark"
                Spacer()

                // Pulsante "Bookmark" a destra
                Button(action: {
                    isBookmarkSelected.toggle()
                }) {
                    VStack {
                        Image(systemName: isBookmarkSelected ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 40))
                            .foregroundColor(isBookmarkSelected ? .yellow : .gray)
                            .padding(.bottom, 3)
                        Text("Bookmark")
                            .font(.body)
                            .foregroundColor(isBookmarkSelected ? .yellow : .gray)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            
            // Sezione "Rate"
            VStack {
                Text("Rate:")
                    .font(.headline)
                    .padding(.bottom, 10)
                    .foregroundColor(.gray)
                
                // Stelle cliccabili
                HStack {
                    ForEach(1...5, id: \.self) { starIndex in
                        Button(action: {
                            rating = starIndex // Aggiorna il numero di stelle selezionate
                        }) {
                            Image(systemName: starIndex <= rating ? "star.fill" : "star")
                                .font(.system(size: 40))
                                .foregroundColor(starIndex <= rating ? .yellow : .gray)
                        }
                        .buttonStyle(PlainButtonStyle()) // Evita l'effetto di default del pulsante
                    }
                }
                .padding(.top, 5)
            }
            .padding()
        }
        .padding()
        .presentationDetents([.medium, .large])
    }
}
