//
//  ListTabView.swift
//  Bookmarked
//
//  Created by Dario Saldamarco
//

import SwiftUI

struct ListTabView: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Popular This Week header
                Text("Popular This Week")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .accessibilityAddTraits(.isHeader)

                // Lists Section
                VStack(spacing: 24) {
                    // Official Top 250 List
                    ListCard(
                        title: "Official Top 250 Narrative Books",
                        description: "A curated collection of the most impactful narrative books of all time",
                        reviewer: Review(reviewerName: "John Smith", rating: 4.5, comment: "", avatarImageName: "avatar1"),
                        books: Array(sampleBooks.prefix(3))
                    )
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("List: Official Top 250 Narrative Books, curated by John Smith")
                    .accessibilityHint("Double tap to explore this reading list")

                    
                    // Life-changing Books List
                    ListCard(
                        title: "You're not the same person once you finish these books",
                        description: "Books that will change your perspective on life",
                        reviewer: Review(reviewerName: "Emma Wilson", rating: 4.8, comment: "", avatarImageName: "avatar2"),
                        books: Array(recommendedBooks)
                    )
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("List: Life-changing books, curated by Emma Wilson")
                    .accessibilityHint("Double tap to explore this reading list")
                    
                    // 1001 Books List
                    ListCard(
                        title: "1001 Books you must read before you die",
                        description: "The ultimate reading bucket list for book lovers",
                        reviewer: Review(reviewerName: "Michael Brown", rating: 4.7, comment: "", avatarImageName: "avatar3"),
                        books: Array(sampleBooks.prefix(6).reversed())
                    )
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("List: 1001 Must-Read Books, curated by Michael Brown")
                    .accessibilityHint("Double tap to explore this reading list")
                }
                .padding(.horizontal)
            }
            .accessibilityLabel("Reading Lists")
        }
    }
}

struct ListCard: View {
    let title: String
    let description: String
    let reviewer: Review
    let books: [Book]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header with title and reviewer
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .accessibilityAddTraits(.isHeader)
                }
                
                Spacer()
                
                // Reviewer avatar and name
                HStack {
                    Image(reviewer.avatarImageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .accessibilityHidden(true)
                    Text(reviewer.reviewerName)
                        .font(.subheadline)
                }
                .accessibilityLabel("Curated by \(reviewer.reviewerName)")
            }
            
            // Description
            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .accessibilityLabel("List description: \(description)")
            
            // Book previews
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(books) { book in
                        VStack(alignment: .leading) {
                            Image(book.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 120)
                                .cornerRadius(8)
                                .accessibilityLabel("Book cover: \(book.title)")
                                .accessibilityHint("Part of the reading list")

                        }
                    }
                }
            }
            .accessibilityLabel("Book covers in this list")
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    ListTabView()
}

// End of file
