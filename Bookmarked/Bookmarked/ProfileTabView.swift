//
//  ProfileTabView.swift
//  Bookmarked
//

import SwiftUI

struct ProfileTabView: View {
    // User stats
    let readBooks = 40
    let wantToReadBooks = 20
    let yearlyGoal = 10
    let totalBooks = 100
    let reviewCount = 40
    let listCount = 2
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Profile header
                HStack(alignment: .center) {
                    // Avatar and name section with fixed width
                    HStack(spacing: 12) {
                        Image("avatar1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 1))
                            .accessibilityHidden(true)
                        
                        Text("dardarius")
                            .font(.headline)
                            .fontWeight(.medium)
                            .lineLimit(1)
                            .frame(width: 100, alignment: .leading)
                            .accessibilityLabel("Username: dardarius")
                    }
                    
                    Spacer()
                    
                    // Stats at the right
                    HStack(spacing: 20) {
                        VStack(spacing: 4) {
                            Text("\(readBooks)")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("books")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Read \(readBooks) books")
                        
                        Rectangle()
                            .frame(width: 1, height: 40)
                            .foregroundColor(.gray.opacity(0.3))
                            .accessibilityHidden(true)
                        
                        VStack(spacing: 4) {
                            Text("\(wantToReadBooks)")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("want to read")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Want to read \(wantToReadBooks) books")
                    }
                }
                .padding(.horizontal)
                
                // Favorites section with NavigationLink added
                VStack(alignment: .leading, spacing: 12) {
                    Text("Favorites")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(sampleBooks.prefix(4)) { book in
                                NavigationLink(destination: BookDetailView(book: book)) {
                                    Image(book.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(8)
                                        .shadow(radius: 4)
                                }
                                .accessibilityLabel("Favorite book: \(book.title)")
                                .accessibilityHint("Double tap to view book details")
                            }
                        }
                        .padding(.horizontal)
                    }
                    .accessibilityLabel("Favorite books carousel")
                }
                
                // Recent Activity section with NavigationLink added
                VStack(alignment: .leading, spacing: 12) {
                    Text("Recent Activity")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(recommendedBooks.prefix(3)) { book in
                                NavigationLink(destination: BookDetailView(book: book)) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Image(book.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(8)
                                            .shadow(radius: 4)
                                        
                                        HStack {
                                            StarRatingView(rating: book.rating)
                                                .scaleEffect(0.7)
                                            Spacer()
                                        }
                                        .frame(width: 100)
                                    }
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityLabel("Recent book: \(book.title), rated \(Int(book.rating)) stars")
                                .accessibilityHint("Double tap to view book details")
                            }
                        }
                        .padding(.horizontal)
                    }
                    .accessibilityLabel("Recent activity carousel")
                }
                
                // Stats section 
                VStack(spacing: 0) {
                    Button(action: {}) {
                        HStack {
                            Text("Books")
                                .font(.title3)
                                .foregroundColor(.black)
                            Spacer()
                            Text("\(totalBooks) / \(yearlyGoal) this year")
                                .foregroundColor(.secondary)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                    }
                    .accessibilityLabel("Books: \(totalBooks) out of \(yearlyGoal) yearly goal")
                    .accessibilityHint("Double tap to view books")
                    
                    Divider()
                    
                    Button(action: {}) {
                        HStack {
                            Text("Reviews")
                                .font(.title3)
                                .foregroundColor(.black)
                            Spacer()
                            Text("\(reviewCount)")
                                .foregroundColor(.secondary)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                    }
                    .accessibilityLabel("Reviews: \(reviewCount) total")
                    .accessibilityHint("Double tap to view reviews")
                    
                    Divider()
                    
                    Button(action: {}) {
                        HStack {
                            Text("Lists")
                                .font(.title3)
                                .foregroundColor(.black)
                            Spacer()
                            Text("\(listCount)")
                                .foregroundColor(.secondary)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                    }
                    .accessibilityLabel("Lists: \(listCount) total")
                    .accessibilityHint("Double tap to view lists")
                    
                    Divider()
                    
                    Button(action: {}) {
                        HStack {
                            Text("Want to read")
                                .font(.title3)
                                .foregroundColor(.black)
                            Spacer()
                            Text("\(wantToReadBooks)")
                                .foregroundColor(.secondary)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                    }
                    .accessibilityLabel("Want to read: \(wantToReadBooks) books")
                    .accessibilityHint("Double tap to view want to read list")
                }
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle("Profile")
        .accessibilityLabel("Profile page")
    }
}

#Preview {
    ProfileTabView()
}

// End of file
