//
//  ReviewModalView.swift
//  Bookmarked
//

import SwiftUI

struct ReviewModalView: View {
    // Properties
    @Environment(\.dismiss) var dismiss
    let review: Review
    let book: Book
    @State private var isLiked: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView { // Added ScrollView for better content handling
                VStack(spacing: 16) {
                    // User info and book section
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 8) {
                                Image(review.avatarImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    .shadow(radius: 10)
                                    .accessibilityHidden(true)
                                VStack(alignment: .leading) {
                                    Text(review.reviewerName)
                                        .font(.headline)
                                        .accessibilityAddTraits(.isHeader)
                                }
                            }
                            .accessibilityElement(children: .combine)
                                .accessibilityLabel("Review by \(review.reviewerName)")

                            Text(book.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .accessibilityAddTraits(.isHeader)

                            StarRatingView(rating: review.rating)
                                .accessibilityLabel("Rating: \(String(format: "%.1f", review.rating)) out of 5 stars")
                            
                            Text("Reviewed on: Dec 10, 2024")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .accessibilityLabel("Review date: December 10, 2024")
                            
                            Text(review.comment)
                                .font(.body)
                                .padding(.top, 8)
                                .accessibilityLabel("Review comment: \(review.comment)")

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)

                        Image(book.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            .accessibilityLabel("Book cover of \(book.title)")

                    }
                    .padding()

                    // Interaction buttons section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(spacing: 8) {
                            Button(action: { isLiked.toggle() }) {
                                HStack(spacing: 4) {
                                    Image(systemName: isLiked ? "heart.fill" : "heart")
                                        .foregroundColor(isLiked ? .red : .gray)
                                        .font(.system(size: 18))
                                    Text("Like")
                                        .font(.body)
                                        .foregroundColor(.primary)
                                }
                            }
                            .accessibilityLabel(isLiked ? "Unlike review" : "Like review")
                            .accessibilityHint("Double tap to \(isLiked ? "remove like" : "like this review")")
                            
                            Text("\(isLiked ? 1338 : 1337) likes")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .accessibilityLabel("\(isLiked ? 1338 : 1337) people liked this review")

                        }
                        .padding(.bottom, 10)

                        HStack(spacing: 16) {
                            Button(action: {
                                print("Comments clicked")
                            }) {
                                Text("10 Comments")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color(.systemGray5))
                                    .cornerRadius(8)
                            }
                            .accessibilityLabel("View 10 comments")
                            .accessibilityHint("Double tap to view all comments")
                            
                            Button(action: {
                                print("Another action clicked")
                            }) {
                                Text("Save review +")
                                    .font(.subheadline)
                                    .foregroundColor(.primary)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color(.systemGray5))
                                    .cornerRadius(8)
                            }
                            .accessibilityLabel("Save review")
                            .accessibilityHint("Double tap to save this review")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Review")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Close") { dismiss() })
                .accessibilityLabel("Close review")
                .accessibilityHint("Double tap to close the review details")
        }
    }
}

// Preview remains the same
struct ReviewModalView_Previews: PreviewProvider {
    static var previews: some View {
        if let book = recommendedBooks.first, let review = book.reviews.first {
            ReviewModalView(review: review, book: book)
        } else {
            Text("No data available")
        }
    }
}

// End of file
