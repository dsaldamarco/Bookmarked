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
                // Profile header with stats
                HStack(alignment: .center) {
                    // Avatar and name section with fixed width
                    HStack(spacing: 12) {
                        Image("avatar1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 1))
                        
                        Text("dardarius")
                            .font(.headline)
                            .fontWeight(.medium)
                            .lineLimit(1)
                            .frame(width: 100, alignment: .leading)
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
                        
                        Rectangle()
                            .frame(width: 1, height: 40)
                            .foregroundColor(.gray.opacity(0.3))
                        
                        VStack(spacing: 4) {
                            Text("\(wantToReadBooks)")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("want to read")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.horizontal)
                
                // Favorites section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Favorites")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(sampleBooks.prefix(4)) { book in
                                Image(book.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(8)
                                    .shadow(radius: 4)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Recent Activity section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Recent Activity")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(recommendedBooks.prefix(3)) { book in
                                VStack(alignment: .leading, spacing: 4) { // Reduced spacing
                                    Image(book.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(8)
                                        .shadow(radius: 4)
                                    
                                    HStack { // Added HStack for better star alignment
                                        StarRatingView(rating: book.rating)
                                            .scaleEffect(0.7) // Smaller scale
                                        Spacer() // Push stars to the left
                                    }
                                    .frame(width: 100) // Match image width
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
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
                }
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle("Profile")
    }
}

#Preview {
    ProfileTabView()
}

// End of file
