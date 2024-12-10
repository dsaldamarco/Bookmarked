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

                VStack(alignment: .leading, spacing: 4) {
                    // Nome e Rating
                    HStack {
                        Text(review.reviewerName)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                        StarRatingView(rating: review.rating)
                    }

                    // Commento
                    Text(review.comment)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .padding(.top, 8)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}
