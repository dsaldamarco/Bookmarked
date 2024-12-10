//
//  StarRatingView.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//

import SwiftUI

struct StarRatingView: View {
    let rating: Double
    let maxRating: Int = 5

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<maxRating, id: \.self) { index in
                Image(systemName: index < Int(rating.rounded()) ? "star.fill" : "star")
                    .foregroundColor(index < Int(rating.rounded()) ? .yellow : .gray)
            }
        }
    }
}
