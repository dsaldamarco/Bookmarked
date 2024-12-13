import SwiftUI

struct ReviewsTabView: View {
    @State private var isReviewModalPresented = false  // State to track if the modal is presented
    @State private var selectedReview: Review?         // State to track the selected review
    @State private var selectedBook: Book?             // State to track the book related to the selected review

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("New from friends")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.horizontal, .top])

                // Iterate over both sampleBooks and recommendedBooks
                let allBooks = sampleBooks + recommendedBooks
                ForEach(allBooks) { book in
                    ForEach(book.reviews) { review in
                        FriendReviewCard(book: book, review: review)
                            .padding(.horizontal)
                            .onTapGesture {
                                // Set the selected review and book
                                self.selectedReview = review
                                self.selectedBook = book
                                // Present the sheet
                                self.isReviewModalPresented = true
                            }
                    }
                }
            }
        }
        // Show the modal sheet if a review is selected
        .sheet(isPresented: $isReviewModalPresented) {
            if let selectedReview = selectedReview, let selectedBook = selectedBook {
                ReviewModalView(isPresented: $isReviewModalPresented, review: selectedReview, book: selectedBook)
            }
        }
    }
}

struct FriendReviewCard: View {
    let book: Book
    let review: Review

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // User Info and Book Details
            HStack(spacing: 12) {
                // User Avatar
                Image(review.avatarImageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                // User Name and Book Info
                VStack(alignment: .leading, spacing: 4) {
                    Text(review.reviewerName)
                        .font(.headline)
                    Text("reviewed \(book.title)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                // Book Cover
                Image(book.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 90)
                    .cornerRadius(8)
            }

            // Rating and Year
            HStack {
                StarRatingView(rating: review.rating)
                Spacer()
                Text(book.publishYear)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            // Review Text
            Text(review.comment)
                .font(.body)
                .lineLimit(3)
                .padding(.top, 4)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// End of file
