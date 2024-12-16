//
//  BookTabView.swift
//  Bookmarked
//

import SwiftUI

struct BookTabView: View {
    @Namespace private var namespace
    @State private var selectedBook: Book?
    @State private var isShowingDetail = false
    
    var body: some View {
        ZStack {
            // Main scrollable content
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    // Popular This Week section
                    Text("Popular this week")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding([.horizontal, .top])

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(sampleBooks.prefix(5)) { book in
                                NavigationLink(destination: BookDetailView(book: book)) {
                                    Image(book.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 220)
                                        .cornerRadius(12)
                                        .shadow(radius: 5)
                                        .accessibilityLabel("Book cover of \(book.title)")
                                        .accessibilityHint("Double tap to view details for \(book.title) by \(book.author)")

                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                    .accessibilityLabel("Popular books carousel")
                    // Recommended Reads section
                    Text("Recommended Reads")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .accessibilityAddTraits(.isHeader)
                        .accessibilityLabel("Recommended books")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(recommendedBooks.suffix(5)) { book in
                                NavigationLink(destination: BookDetailView(book: book)) {
                                    Image(book.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 220)
                                        .cornerRadius(12)
                                        .shadow(radius: 5)
                                        .accessibilityLabel("Book cover of \(book.title)")
                                                                                .accessibilityHint("Double tap to view details for \(book.title) by \(book.author)")

                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                    .accessibilityLabel("Recommended books carousel")
                    // Featured Books section
                    Text("Featured Books")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .accessibilityAddTraits(.isHeader)
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 16)], spacing: 16) {
                        ForEach(recommendedBooks) { book in
                            BookCard(book: book,
                                   namespace: namespace,
                                   selectedBook: $selectedBook,
                                   isShowingDetail: $isShowingDetail)
                            .accessibilityElement(children: .combine)
                                .accessibilityLabel("Featured book: \(book.title) by \(book.author)")
                                .accessibilityHint("Double tap to view detailed card for \(book.title)")
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            // Overlay detail view
            if isShowingDetail {
                if let book = selectedBook {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .accessibilityHidden(true)
                    
                    BookDetailOverlay(book: book,
                                    namespace: namespace,
                                    isShowingDetail: $isShowingDetail,
                                    selectedBook: $selectedBook)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .zIndex(2)
                }
            }
        }
    }
}

#Preview {
    BookTabView()
}

// End of file
