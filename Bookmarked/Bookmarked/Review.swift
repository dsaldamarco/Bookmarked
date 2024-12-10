//
//  Review.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//
import Foundation

struct Review: Identifiable {
    let id = UUID()
    let reviewerName: String
    let rating: Double
    let comment: String
    let avatarImageName: String
}
