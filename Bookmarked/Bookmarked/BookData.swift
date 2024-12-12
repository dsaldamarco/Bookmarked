//
//  BookData.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//

import Foundation

let recommendedBooks: [Book] = [
    Book(
        title: "Norvegian Wood",
        author: "Haruki Murakami",
        publishYear: "1987",
        imageName: "norwegian_wood",
        rating: 4.3,
        description: "Norwegian Wood by Haruki Murakami is a nostalgic and melancholic novel that explores themes of love, loss, and the transition to adulthood. Set in 1960s Japan, it follows Toru Watanabe, a quiet college student whose life is profoundly shaped by his relationships with two very different women: Naoko, a fragile and introspective girl connected to his past, and Midori, a vibrant and unconventional force of the present. As Toru navigates his emotions and the complexities of these relationships, the story delves into the fragility of human connections and the enduring impact of grief.",
        reviews: [
            Review(reviewerName: "Otaku33", rating: 5.0, comment: "A beautifully haunting read. Murakami's writing pulls you in, and the emotional depth of the characters stays with you long after the last page. If you love stories about love and loss, this one's for you.", avatarImageName: "avatar1"),
            Review(reviewerName: "LeMeillure", rating: 4.5, comment: "Norwegian Wood takes you on an emotional rollercoaster. Toru’s journey through love, pain, and self-discovery is relatable, but be warned, it’s a bit of a tearjerker. A must-read for anyone into deep, reflective stories.", avatarImageName: "avatar2"),
            Review(reviewerName: "Kotoko", rating: 5.0, comment: "An intimate and soul-searching novel. The characters are complex and flawed in such a real way. It’s not just about romance, it’s about finding yourself in a world full of uncertainty. Highly recommend if you like introspective reads.", avatarImageName: "avatar3")
        ]
    ),
    Book(
        title: "War and Peace",
        author: "Leo Tolstoy",
        publishYear: "1869",
        imageName: "war_and_peace",
        rating: 4.7,
        description: "An epic novel about Napoleon's invasion of Russia.",
        reviews: [
            Review(reviewerName: "EpicReader", rating: 5.0, comment: " A masterpiece of historical fiction.", avatarImageName: "avatar1"),
            Review(reviewerName: "BookLover", rating: 4.5, comment: " Challenging but rewarding.", avatarImageName: "avatar2"),
            Review(reviewerName: "Mike745", rating: 5.0, comment: "The depth and scale are unmatched.", avatarImageName: "avatar3")
        ]
    ),
    Book(
        title: "The Catcher in the Rye",
        author: "J.D. Salinger",
        publishYear: "1951",
        imageName: "catcher_in_the_rye",
        rating: 4.2,
        description: "The story follows Holden Caulfield, a disillusioned teenager who has been kicked out of multiple prep schools. As he wanders New York City, grappling with his feelings of alienation, depression, and a deep sense of loss, Holden reflects on the adult world and his desire to protect innocence, especially that of his younger sister, Phoebe. Through his narrative, the novel explores themes of identity, isolation, and the struggles of growing up.",
        reviews: [
            Review(reviewerName: "EpicReader", rating: 5.0, comment: "Relatable and timeless.", avatarImageName: "avatar1"),
            Review(reviewerName: "BookLover", rating: 4.5, comment: "A journey into the mind of adolescence.", avatarImageName: "avatar2"),
            Review(reviewerName: "Mike745", rating: 5.0, comment: "Deep and poignant.", avatarImageName: "avatar3")
        ]
    )
]

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
        description: "A dystopian novel set in a totalitarian society ruled by the Party, led by the oppressive figure of Big Brother. The story follows Winston Smith, a low-ranking member of the Party who secretly rebels against the regime by questioning its control over truth and individuality. As Winston begins a forbidden love affair and seeks to uncover the truth, he faces the brutal realities of surveillance, censorship, and the loss of freedom. The novel explores themes of government control, surveillance, and the consequences of a society stripped of personal rights.",
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
