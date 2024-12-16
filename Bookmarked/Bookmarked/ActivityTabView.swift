//
//  ActivityTabView.swift
//  Bookmarked
//

import SwiftUI

// ActivityItem struct definition
struct ActivityItem: Identifiable {
    let id = UUID()
    let type: ActivityType
    let userAvatar: String
    let userName: String
    let timeAgo: String
    let book: Book?
    let review: Review?
    let rating: Double?
    
    enum ActivityType {
        case watch
        case like
    }
}

struct ActivityTabView: View {
    // Activity data with state for each item's like status
    @State private var activities: [ActivityItem] = [
        ActivityItem(type: .watch, userAvatar: "avatar1", userName: "Emma Wilson", timeAgo: "2h",
                    book: sampleBooks[0], review: sampleBooks[0].reviews[0], rating: 4.5),
        ActivityItem(type: .like, userAvatar: "avatar2", userName: "John Smith", timeAgo: "5h",
                    book: sampleBooks[1], review: nil, rating: nil),
        ActivityItem(type: .watch, userAvatar: "avatar3", userName: "Mike Brown", timeAgo: "8h",
                    book: recommendedBooks[0], review: recommendedBooks[0].reviews[0], rating: 4.0),
        ActivityItem(type: .like, userAvatar: "avatar1", userName: "Sarah Johnson", timeAgo: "1d",
                    book: sampleBooks[2], review: nil, rating: nil),
        ActivityItem(type: .watch, userAvatar: "avatar2", userName: "Alex Lee", timeAgo: "1d",
                    book: recommendedBooks[1], review: recommendedBooks[1].reviews[0], rating: 5.0)
    ]
    
    // State for managing likes
    @State private var likedReviews: Set<UUID> = []
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(activities) { activity in
                    if activity.type == .watch {
                        watchedBookView(activity: activity)
                    } else {
                        likedReviewView(activity: activity)
                            .background(Color(.systemGray6))
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Activity")
    }
    
    private func watchedBookView(activity: ActivityItem) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            // User info header
            HStack(spacing: 12) {
                Image(activity.userAvatar)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(activity.userName)
                        .font(.headline)
                    Text("read")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Text(activity.timeAgo)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            if let book = activity.book {
                // Book details
                Text(book.title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                StarRatingView(rating: activity.rating ?? book.rating)
                    .frame(height: 20)
                    .scaleEffect(0.7, anchor: .leading)
                
                HStack(alignment: .top, spacing: 12) {
                    Image(book.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 120)
                        .cornerRadius(8)
                    
                    if let review = activity.review {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(review.comment)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(4)
                                .padding(.bottom, 8)
                            
                            // Like button
                            Button(action: {
                                if likedReviews.contains(activity.id) {
                                    likedReviews.remove(activity.id)
                                } else {
                                    likedReviews.insert(activity.id)
                                }
                            }) {
                                HStack(spacing: 4) {
                                    Image(systemName: likedReviews.contains(activity.id) ? "heart.fill" : "heart")
                                        .foregroundColor(likedReviews.contains(activity.id) ? .red : .gray)
                                    Text("Like review")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.bottom, 8)
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    private func likedReviewView(activity: ActivityItem) -> some View {
        HStack(spacing: 12) {
            Image(activity.userAvatar)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("\(activity.userName) liked David's 4 star review of The Catcher in the Rye")
                .font(.subheadline)
            
            Spacer()
            
            Text(activity.timeAgo)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

// Preview
#Preview {
    NavigationView {
        ActivityTabView()
    }
}

// End of file
