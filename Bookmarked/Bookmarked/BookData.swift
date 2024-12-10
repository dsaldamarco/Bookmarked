//
//  BookData.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//

import Foundation

let sampleBooks = [
    Book(
        title: "To Kill a Mockingbird",
        author: "Harper Lee",
        publishYear: "1960",
        imageName: "mockingbird",
        rating: 4.5,
        description: "A classic of modern American literature, the book explores racial injustice in the Deep South through the eyes of young Scout Finch.",
        reviews: [
                    Review(reviewerName: "BookLover92", rating: 5.0, comment: "An absolutely stunning read! The story of Scout and Atticus will stay with me forever.", avatarImageName: "avatar1"),
                    Review(reviewerName: "LiteraryFan", rating: 4.5, comment: "Beautifully written and thought-provoking. A must-read for everyone.", avatarImageName: "avatar2"),
                    Review(reviewerName: "ReadMoreBooks", rating: 5.0, comment: "Harper Lee captures the essence of humanity in such a profound way.", avatarImageName: "avatar3")
                ]
        
    ),
    Book(
        title: "1984",
        author: "George Orwell",
        publishYear: "1949",
        imageName: "1984",
        rating: 4.2,
        description: "A dystopian novel set in a totalitarian society ruled by Big Brother. A chilling vision of the future.",
        reviews: [
                    Review(reviewerName: "FutureThinker", rating: 5.0, comment: "Terrifyingly relevant even today. Orwell was a genius.", avatarImageName: "avatar1"),
                    Review(reviewerName: "HistoryBuff", rating: 4.0, comment: "A gripping and cautionary tale of the dangers of authoritarianism.", avatarImageName: "avatar2"),
                    Review(reviewerName: "BigBrotherFan", rating: 4.5, comment: "The world-building and themes are incredible. A haunting masterpiece.", avatarImageName: "avatar3")
                ]
    ),
    Book(
        title: "Moby Dick",
        author: "Herman Melville",
        publishYear: "1851",
        imageName: "mobydick",
        rating: 3.87,
        description: "An epic tale of obsession and revenge as Captain Ahab hunts the elusive white whale, Moby Dick.",
        reviews: [
            Review(reviewerName: "SeaLover", rating: 4.5, comment: "A powerful story of obsession and the sea. Melville's prose is dense but rewarding.", avatarImageName: "avatar1"),
               Review(reviewerName: "CaptainFanatic", rating: 5.0, comment: "The ultimate adventure tale! A deep dive into human nature and revenge.", avatarImageName: "avatar2"),
               Review(reviewerName: "ClassicReader", rating: 3.5, comment: "While the themes are profound, the lengthy descriptions can be challenging.", avatarImageName: "avatar3")
                ]
    ),
    
    Book(
        title: "The Great Gatsby",
        author: "F. Scott Fitzgerald",
        publishYear: "1925",
        imageName: "gatsby",
        rating: 4.0,
        description: "A story of wealth, love, and the American Dream set in the Roaring Twenties.",
        reviews: [
            Review(reviewerName: "Dreamer", rating: 5.0, comment: "Fitzgerald captures the Jazz Age perfectly. A tragic, beautiful story.", avatarImageName: "avatar1"),
                Review(reviewerName: "LiteraryEnthusiast", rating: 4.5, comment: "A timeless critique of the American Dream. Haunting and elegant.", avatarImageName: "avatar2"),
                Review(reviewerName: "PartyLover", rating: 4.0, comment: "Lavish parties and deep emotions! The symbolism is amazing.", avatarImageName: "avatar3")
                ]
    ),
    Book(
        title: "Pride and Prejudice",
        author: "Jane Austen",
        publishYear: "1813",
        imageName: "pride",
        rating: 4.8,
        description: "A romantic comedy that critiques the British landed gentry and societal expectations of marriage.",
        reviews: [
            Review(reviewerName: "RomanceFan", rating: 5.0, comment: "Elizabeth Bennet and Mr. Darcy are iconic. Austen's wit shines.", avatarImageName: "avatar1"),
                Review(reviewerName: "PeriodDramaLover", rating: 4.5, comment: "A delightful exploration of love and social class. Timeless.", avatarImageName: "avatar2"),
                Review(reviewerName: "ClassicBuff", rating: 4.0, comment: "Sharp humor and memorable characters. Austen's best work.", avatarImageName: "avatar3")
                ]
    ),
]
