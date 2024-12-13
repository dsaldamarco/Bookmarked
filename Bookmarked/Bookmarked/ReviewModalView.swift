import SwiftUI

struct ReviewModalView: View {
    @Binding var isPresented: Bool
    var review: Review
    var book: Book

    @State private var isLiked: Bool = false
    // Set isContentReady to true by default to ensure content is displayed immediately
    @State private var isContentReady: Bool = true

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
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
                            VStack(alignment: .leading) {
                                Text(review.reviewerName)
                                    .font(.headline)
                            }
                        }

                        Text(book.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        HStack {
                            StarRatingView(rating: review.rating)
                        }

                        Text("Reviewed on: Dec 10, 2024")
                            .font(.footnote)
                            .foregroundColor(.gray)

                        Text(review.comment)
                            .font(.body)
                            .padding(.top, 8)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Image(book.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                }
                .padding()

                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 8) {
                        Button(action: {
                            isLiked.toggle()
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .foregroundColor(isLiked ? .red : .gray)
                                    .font(.system(size: 18))
                                Text("Like")
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                        }

                        Text("\(isLiked ? 1338 : 1337) likes")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
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
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("Review")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button("Close") {
                    isPresented = false
                }
            )
        }
    }
}

struct ReviewModalView_Previews: PreviewProvider {
    static var previews: some View {
        if let book = recommendedBooks.first, let review = book.reviews.first {
            ReviewModalView(isPresented: .constant(true), review: review, book: book)
        } else {
            Text("No data available")
        }
    }
}
