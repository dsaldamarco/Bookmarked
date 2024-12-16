//
//  Book.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//

import Foundation

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let publishYear: String
    let imageName: String
    let rating: Double
    let description: String
    let reviews: [Review] // Per le recensioni
  //  let readingHighlights: String?

}
