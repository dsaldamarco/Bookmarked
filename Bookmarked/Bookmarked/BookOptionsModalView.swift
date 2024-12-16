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
    @State private var rating = 0
    
    var body: some View {
        VStack(spacing: 15) {
            // Title and year
            Text(book.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 25)
                .multilineTextAlignment(.center)
                .accessibilityAddTraits(.isHeader)
            
            Text("Published in \(book.publishYear)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 5)
                .accessibilityLabel("Publication year: \(book.publishYear)")
            
            // Add top divider
            Divider()
                .padding(.horizontal)
                .accessibilityHidden(true)
            
            // Read, Recommend, Bookmark buttons
            HStack(spacing: 0) {
                // Buttons remain the same
                Button(action: { isReadSelected.toggle() }) {
                    VStack {
                        Image(systemName: isReadSelected ? "book.fill" : "book")
                            .font(.system(size: 30))
                            .foregroundColor(isReadSelected ? .blue : .gray)
                            .padding(.bottom, 2)
                        Text("Read")
                            .font(.body)
                            .foregroundColor(isReadSelected ? .blue : .gray)
                    }
                }
                .frame(maxWidth: .infinity)
                .accessibilityLabel(isReadSelected ? "Remove from read books" : "Mark as read")
                .accessibilityHint("Double tap to \(isReadSelected ? "remove this book from" : "add this book to") your read list")


                Button(action: { isRecommendSelected.toggle() }) {
                    VStack {
                        Image(systemName: isRecommendSelected ? "circle.fill" : "circle")
                            .font(.system(size: 30))
                            .foregroundColor(isRecommendSelected ? .red : .gray)
                            .padding(.bottom, 2)
                        Text("Recommend")
                            .font(.body)
                            .foregroundColor(isRecommendSelected ? .red : .gray)
                    }
                }
                .frame(maxWidth: .infinity)
                .accessibilityLabel(isRecommendSelected ? "Remove recommendation" : "Recommend this book")
                .accessibilityHint("Double tap to \(isRecommendSelected ? "remove" : "add") your recommendation")

                Button(action: { isBookmarkSelected.toggle() }) {
                    VStack {
                        Image(systemName: isBookmarkSelected ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 30))
                            .foregroundColor(isBookmarkSelected ? .yellow : .gray)
                            .padding(.bottom, 2)
                        Text("Bookmark")
                            .font(.body)
                            .foregroundColor(isBookmarkSelected ? .yellow : .gray)
                    }
                }
                .frame(maxWidth: .infinity)
                .accessibilityLabel(isBookmarkSelected ? "Remove bookmark" : "Bookmark this book")
                .accessibilityHint("Double tap to \(isBookmarkSelected ? "remove" : "add") bookmark")
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            
            // Add bottom divider after buttons
            Divider()
                .padding(.horizontal)
            
            // Rating section
            VStack(spacing: 5) {
                Text("Rate:")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .accessibilityAddTraits(.isHeader)
                
                HStack {
                    ForEach(1...5, id: \.self) { starIndex in
                        Button(action: { rating = starIndex }) {
                            Image(systemName: starIndex <= rating ? "star.fill" : "star")
                                .font(.system(size: 30))
                                .foregroundColor(starIndex <= rating ? .yellow : .gray)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .accessibilityLabel("\(starIndex) star\(starIndex == 1 ? "" : "s")")
                        .accessibilityHint("Rate this book \(starIndex) star\(starIndex == 1 ? "" : "s")")
                    }
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("Rating: \(rating) out of 5 stars")

            }
            .padding(.vertical, 5)
            .padding(.bottom, 20)
            
            // Add divider after rating section
            Divider()
                .padding(.horizontal)
                .padding(.bottom, 10)
                .accessibilityHidden(true)
            
            // Action buttons
            VStack(spacing: 0) {
                Button(action: {}) {
                    HStack {
                        Text("Review")
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                }
                .accessibilityHint("Double tap to write a review")
                
                Divider().accessibilityHidden(true)
                
                Button(action: {}) {
                    HStack {
                        Text("Add to lists")
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                }
                .accessibilityHint("Double tap to add this book to your lists")
                
                Divider().accessibilityHidden(true)
                
                Button(action: {}) {
                    HStack {
                        Text("Share")
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                }
                .accessibilityHint("Double tap to share this book")
            }
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
        }
        .padding()
        .presentationDetents([.height(550)])
    }
}
