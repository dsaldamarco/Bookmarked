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
        description: "Norwegian Wood by Haruki Murakami is a mesmerizing exploration of youth, love, and the enduring power of memory. Set against the backdrop of 1960s Japan, this coming-of-age novel follows Toru Watanabe as he reflects on his college years filled with emotional turbulence, life-changing relationships, and the quiet struggles of self-discovery. With its vivid prose and atmospheric setting, the story delves into themes of nostalgia, mental health, and the fragility of human connection. Murakami masterfully balances moments of quiet introspection with the raw intensity of heartbreak and healing, creating a story that lingers in the reader’s mind. If you’re drawn to poetic storytelling, unforgettable characters, and thought-provoking themes, Norwegian Wood is a timeless tale that resonates deeply with anyone who has ever felt the ache of longing or the complexities of growing up.",
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
        description: "War and Peace by Leo Tolstoy is a sweeping epic that intertwines the personal and political, set against the backdrop of early 19th-century Russia during the Napoleonic Wars. This monumental novel explores the lives of aristocratic families as they navigate love, ambition, and the turmoil of a society in flux. Tolstoy masterfully portrays the complexities of human nature, blending intimate moments with grand historical events. Through richly drawn characters and profound philosophical insights, the novel examines themes of destiny, free will, and the search for meaning in the face of chaos. A timeless masterpiece of world literature, War and Peace offers a deeply immersive experience, capturing the vastness of life and the interconnectedness of personal and historical narratives. Perfect for readers seeking a transformative and thought-provoking journey through history, love, and human resilience.",
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
        description: "J.D. Salinger’s The Catcher in the Rye is more than just a coming-of-age novel; it’s a profound exploration of alienation, identity, and the search for meaning. Narrated by the sharp yet deeply flawed Holden Caulfield, the story captures a raw and honest portrayal of teenage disillusionment and rebellion. Set over a few turbulent days in New York City, Holden’s journey is marked by encounters that highlight his struggle to connect with a world he perceives as 'phony.' The book is celebrated for its conversational, stream-of-consciousness style, which mirrors Holden’s chaotic thoughts and emotional turmoil. It’s not just a story but an experience—one that resonates deeply with readers who have ever felt out of step with societal norms. The themes of loneliness, innocence, and the desire for authenticity make it universally relatable.",
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
        description: "To Kill a Mockingbird is a story that has shaped generations, blending a tender coming-of-age tale with a powerful examination of racism and injustice in 1930s Alabama. At its heart is Scout Finch, a curious and spirited young girl, who learns about courage and empathy as she witnesses her father, Atticus, defend an innocent man against prejudice and hatred. The novel paints a vivid picture of a small Southern town, balancing moments of childhood wonder with the weight of moral questions that still resonate today. With its unforgettable characters and timeless message, To Kill a Mockingbird remains a testament to the importance of compassion, justice, and standing up for what is right, even when it’s difficult. Whether you’re drawn to its compelling courtroom drama, its deeply human characters, or its exploration of societal divides, this is a book that will stay with you long after you’ve turned the final page.",
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
        description: "Moby-Dick is a thrilling and philosophical journey into the depths of obsession, fate, and humanity’s relationship with nature. The novel follows Ishmael, a sailor aboard the whaling ship Pequod, led by the enigmatic and vengeful Captain Ahab. Ahab’s relentless pursuit of the elusive white whale, Moby Dick, becomes a powerful allegory for the dangers of unchecked ambition and the mysteries of the natural world. Rich in symbolism and lyrical prose, Moby-Dick explores themes of revenge, identity, and the vastness of existence.",
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
        description: "The Great Gatsby captures the glitz and tragedy of the Roaring Twenties through the eyes of Nick Carraway, a newcomer to the dazzling world of Long Island’s elite. At its center is Jay Gatsby, a mysterious and wealthy man whose extravagant lifestyle hides an unrelenting longing for his lost love, Daisy Buchanan. Set against a backdrop of jazz, excess, and crumbling ideals, the novel explores themes of ambition, love, and the elusive nature of the American Dream. Fitzgerald’s prose shimmers with beauty and heartbreak, painting a picture of a world where appearances often mask deeper truths.",
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
        description: "Pride and Prejudice is a timeless exploration of love, societal expectations, and personal growth. Set in rural England, the story unfolds as Elizabeth Bennet, a witty and independent young woman, navigates complex relationships with her family and suitors, particularly the enigmatic Mr. Darcy. Their initial misunderstandings and clashing personalities give way to self-reflection, revealing themes of pride, prejudice, and the transformative power of love. More than just a romantic novel, Pride and Prejudice critiques the rigid social structures of Austen’s time, highlighting issues such as class, marriage, and the limitations placed on women. With its sharp humor, memorable characters, and enduring lessons, the book remains a celebrated cornerstone of English literature",
        reviews: [
            Review(reviewerName: "RomanceFan", rating: 5.0, comment: "Elizabeth Bennet and Mr. Darcy are iconic. Austen's wit shines.", avatarImageName: "avatar1"),
                Review(reviewerName: "PeriodDramaLover", rating: 4.5, comment: "A delightful exploration of love and social class. Timeless.", avatarImageName: "avatar2"),
                Review(reviewerName: "ClassicBuff", rating: 4.0, comment: "Sharp humor and memorable characters. Austen's best work.", avatarImageName: "avatar3")
                ]
    ),
]
