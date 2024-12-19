//
//  BookDetailOverlay.swift
//  Bookmarked
//

import SwiftUI

struct BookDetailOverlay: View {
    // Properties
    let book: Book
    let namespace: Namespace.ID
    @Binding var isShowingDetail: Bool
    @Binding var selectedBook: Book?
    @State private var isBookmarked = false
    @Environment(\.dismiss) var dismiss
    @GestureState private var dragOffset: CGFloat = 0
    
    // Reading highlights function 
    private func getReadingHighlights() -> String {
        switch book.title {
        case "Norvegian Wood":
            return "Murakami's masterpiece is perfect for readers who love introspective coming-of-age stories. The novel masterfully explores themes of love, loss, and memory against the backdrop of 1960s Japan. Its atmospheric prose and deep psychological insights make it an unforgettable read for those interested in literary fiction that delves into the complexities of human relationships."
        case "War and Peace":
            return "Tolstoy's epic masterpiece offers a unique blend of historical drama and philosophical insight. Perfect for readers who enjoy sweeping narratives, complex character studies, and deep explorations of society during times of war and peace. The novel's scope and depth make it a rewarding challenge for those ready to immerse themselves in one of literature's greatest achievements."
        case "The Catcher in the Rye":
            return "Salinger's iconic novel speaks directly to anyone who's ever felt like an outsider. Its raw honesty and unique voice make it especially relevant for readers interested in authentic character studies and coming-of-age stories. The book's exploration of alienation and authenticity continues to resonate with modern audiences."
        default:
            return "This classic work offers unique insights and perspectives that continue to resonate with readers today. Its themes and characters provide a rich reading experience that rewards careful attention and thoughtful engagement."
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // Background color
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        // Replace Image with NavigationLink for proper navigation
                        NavigationLink(destination: BookDetailView(book: book)) {
                            Image(book.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .matchedGeometryEffect(id: book.id, in: namespace)
                                .shadow(radius: 5)
                                .padding(.top, 40)
                        }
                        .accessibilityLabel("Book cover of \(book.title)")
                        .accessibilityHint("Double tap to view full book details")
                        
                        // App Store style header
                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(book.title)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .accessibilityAddTraits(.isHeader)
                                
                                Text(book.author)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .accessibilityLabel("Written by \(book.author)")
                                
                                Text("Published in \(book.publishYear)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .accessibilityLabel("Publication year: \(book.publishYear)")
                                
                                HStack {
                                    StarRatingView(rating: book.rating)
                                    Text(String(format: "%.1f/5", book.rating))
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                .accessibilityLabel("Rating: \(String(format: "%.1f", book.rating)) out of 5 stars")
                            }
                            
                            Spacer()
                            
                            Button {
                                isBookmarked.toggle()
                            } label: {
                                Text(isBookmarked ? "Added" : "Want to read")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .frame(width: 125, height: 50)
                                    .background(isBookmarked ? Color.blue : Color.gray)
                                    .cornerRadius(25)
                            }
                            .accessibilityLabel(isBookmarked ? "Remove from reading list" : "Add to reading list")
                            .accessibilityHint(isBookmarked ? "Double tap to remove this book from your reading list" : "Double tap to add this book to your reading list")
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        
                        // Description section
                        VStack(alignment: .leading, spacing: 20) {
                            Text("About this book")
                                .font(.title2)
                                .fontWeight(.bold)
                                .accessibilityAddTraits(.isHeader)
                            
                            Text(book.description)
                                .font(.system(size: 18))
                                .lineSpacing(8)
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .accessibilityLabel("Book description: \(book.description)")
                        }
                        .padding()
                        
                        // Why read this book section
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Why should you read this book?")
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .accessibilityAddTraits(.isHeader)
                            
                            Text(getReadingHighlights())
                                .font(.system(size: 18))
                                .lineSpacing(8)
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .accessibilityLabel("Reading highlights: \(getReadingHighlights())")
                        }
                        .padding()
                    }
                }
                .simultaneousGesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            if value.translation.width > 0 {
                                state = value.translation.width
                            }
                        }
                        .onEnded { value in
                            if value.translation.width > UIScreen.main.bounds.width * 0.3 ||
                                value.velocity.width > 500 {
                                dismissView()
                            }
                        }
                )
                
                // Close button
                HStack {
                    Spacer()
                    Button {
                        dismissView()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding(8)
                    }
                    .accessibilityLabel("Close book details")
                    .accessibilityHint("Double tap to close the book details view")
                    .padding(.top, 8)
                    .padding(.trailing, 8)
                }
            }
            .offset(x: dragOffset)
            .animation(.interactiveSpring(), value: dragOffset)
        }
    }
    
    private func dismissView() {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
            isShowingDetail = false
            selectedBook = nil
        }
    }
}

// End of file
