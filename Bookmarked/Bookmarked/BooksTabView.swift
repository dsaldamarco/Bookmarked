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
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Recommended Reads section
                    Text("Recommended Reads")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)

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
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Featured Books section
                    Text("Featured Books")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 16)], spacing: 16) {
                        ForEach(recommendedBooks) { book in
                            BookCard(book: book,
                                   namespace: namespace,
                                   selectedBook: $selectedBook,
                                   isShowingDetail: $isShowingDetail)
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
