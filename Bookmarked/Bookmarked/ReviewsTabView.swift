//
//  ReviewsTabView.swift
//  Bookmarked
//

import SwiftUI

struct ReviewsTabView: View {
    @State private var isReviewModalPresented = false
    @State private var selectedReview: Review?
    @State private var selectedBook: Book?

    var body: some View {
        _ = selectedReview
        _ = selectedBook
        return ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("New from friends")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.horizontal, .top])
                    .accessibilityHidden(true)

                // Iterate over both sampleBooks and recommendedBooks
                let allBooks = sampleBooks + recommendedBooks
                ForEach(allBooks) { book in
                    ForEach(book.reviews) { review in
                        

                        FriendReviewCard(book: book, review: review)
                            .padding(.horizontal)
                            .onTapGesture {
                                self.selectedReview = review
                                self.selectedBook = book
                                self.isReviewModalPresented = true
                            }
                            .accessibilityElement(children: .contain)
                            .accessibilityLabel("Review by \(review.reviewerName) for \(book.title)")
                            .accessibilityHint("Double tap to view the full review")
                    }
                }
            }
        }
        .accessibilityLabel("Reviews from friends")
        // Updated sheet presentation
        .sheet(isPresented: $isReviewModalPresented) {
            if let selectedReview = selectedReview,
               let selectedBook = selectedBook {
                ReviewModalView(review: selectedReview, book: selectedBook)
            } else {
                Text("Can't display review")
            }
        }
    }
}

// FriendReviewCard remains exactly the same
struct FriendReviewCard: View {
    @State var book: Book
    @State var review: Review

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Image(review.avatarImageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 4) {
                    Text(review.reviewerName)
                        .font(.headline)
                    Text("reviewed \(book.title)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("\(review.reviewerName) reviewed \(book.title)")

                Spacer()

                Image(book.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 90)
                    .cornerRadius(8)
                    .accessibilityLabel("Book cover of \(book.title)")
            }

            HStack {
                StarRatingView(rating: review.rating)
                    .accessibilityLabel("Rating: \(String(format: "%.1f", review.rating)) out of 5 stars")
                Spacer()
                Text(book.publishYear)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .accessibilityLabel("Published in \(book.publishYear)")
            }

            Text(review.comment)
                .font(.body)
                .lineLimit(3)
                .padding(.top, 4)
                .accessibilityLabel("Review comment: \(review.comment)")
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// End of file
