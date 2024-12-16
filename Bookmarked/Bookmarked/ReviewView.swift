//
//  ReviewView.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//

import SwiftUI

struct ReviewView: View {
    let review: Review

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 12) {
                // Avatar
                Image(review.avatarImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .shadow(radius: 2)
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 4) {
                    // Nome e Rating
                    HStack {
                        Text(review.reviewerName)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .accessibilityAddTraits(.isHeader)
                        Spacer()
                        StarRatingView(rating: review.rating)
                        .accessibilityLabel("Rating: \(String(format: "%.1f", review.rating)) out of 5 stars")

                    }

                    // Commento
                    Text(review.comment)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .padding(.top, 8)
                        .accessibilityLabel("Review comment: \(review.comment)")
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("Review by \(review.reviewerName)")
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .accessibilityElement(children: .contain)
        .accessibilityHint("Double tap to view full review details")

    }
}
