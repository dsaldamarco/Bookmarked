//
//  BookDetailOverlay.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 16/12/24.
//

import SwiftUI

struct BookDetailOverlay: View {
    // Properties remain the same
    let book: Book
    let namespace: Namespace.ID
    @Binding var isShowingDetail: Bool
    @Binding var selectedBook: Book?
    @State private var isBookmarked = false
    @Environment(\.dismiss) var dismiss
    @State private var navigateToDetail = false
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // Background color
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    // Content wrapper
                    VStack(spacing: 16) {
                        // Book cover with matched geometry
                        Image(book.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .matchedGeometryEffect(id: book.id, in: namespace)
                            .shadow(radius: 5)
                            .onTapGesture {
                                navigateToDetail = true
                            }
                            .padding(.top, 40)
                        
                        // App Store style header
                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(book.title)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text(book.author)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                Text("Published in \(book.publishYear)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                HStack {
                                    StarRatingView(rating: book.rating)
                                    Text(String(format: "%.1f/5", book.rating))
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
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
                                    .background(isBookmarked ? Color.blue: Color.gray)
                                    .cornerRadius(25)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        
                        // Description section
                        VStack(alignment: .leading, spacing: 20) {
                            Text("About this book")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(book.description)
                                .font(.system(size: 18))
                                .lineSpacing(8)
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
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
                .navigationDestination(isPresented: $navigateToDetail) {
                    BookDetailView(book: book)
                }
                
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
                       //     .background(.ultraThinMaterial)
                         //   .clipShape(Circle())
                    }
                    .transition(.opacity)
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
