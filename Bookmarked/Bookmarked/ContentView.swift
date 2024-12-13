//
//  ContentView.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//

import SwiftUI



struct ContentView: View {
    // Properties remain the same
    @State private var selectedTab: Tab = .books
    @State private var selectedMainTab: MainTab = .home
    @State private var isSearching: Bool = false
    @State private var searchText: String = ""

    // Enums remain the same
    enum Tab: String, CaseIterable {
        case books = "Books"
        case reviews = "Reviews"
        case lists = "Lists"
    }
    
    enum MainTab {
        case home, activity, profile
    }

    var body: some View {
        TabView(selection: $selectedMainTab) {
            // Home Tab
            NavigationView {
                VStack(spacing: 0) {
                    // Header remains the same
                    ZStack {
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                isSearching.toggle()
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .font(.title2)
                                    .foregroundColor(.primary)
                            }
                        }
                        .padding(.trailing, 10)

                        Text("Bookmarked")
                            .font(Font.custom("MoreSugarRegular", size: 36))
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 15)
                    .padding(.horizontal)

                    // Picker remains the same
                    Picker("", selection: $selectedTab) {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            Text(tab.rawValue).tag(tab)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 10)

                    ScrollView {
                        VStack(alignment: .leading, spacing: 32) {
                            switch selectedTab {
                            case .books:
                                booksSection
                            case .reviews:
                                ReviewsTabView()  // Replace old reviewsSection with ReviewsTabView
                            case .lists:
                                listsSection
                            }
                        }
                        .padding(.top, 2)
                    }
                }
                .navigationBarHidden(true)
                .sheet(isPresented: $isSearching) {
                    SearchView(searchText: $searchText)
                }
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(MainTab.home)

            // Activity Tab
            NavigationView {
                VStack {
                    Text("Activity Content")
                        .font(.largeTitle)
                        .padding()
                }
                .navigationTitle("Activity")
            }
            .tabItem {
                Image(systemName: "bolt.fill")
                Text("Activity")
            }
            .tag(MainTab.activity)

            // Profile Tab
            NavigationView {
                VStack {
                    Text("Profile Content")
                        .font(.largeTitle)
                        .padding()
                }
                .navigationTitle("Profile")
            }
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Profile")
            }
            .tag(MainTab.profile)
        }
    }

    // MARK: - Sezione Books
    var booksSection: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Prima sezione: Popular This Week
            Text("Popular This Week")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)

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

            // Seconda sezione: Recommended Reads
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
        }
    }

    // MARK: - Sezione Lists
    var listsSection: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Your Lists")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)

            Text("Here you can manage your custom lists.")
                .padding(.horizontal)
        }
    }
}

// MARK: - SearchView remains exactly the same
struct SearchView: View {
    @Binding var searchText: String

    let browseCategories = [
        "Release date",
        "Genre",
        "Most popular",
        "Highest rated",
        "Top 250 narrative",
        "Featured lists"
    ]
    
    var body: some View {
        VStack {
            Text("Search")
                .font(.headline)
                .padding()

            TextField("Find books, authors, reviews...", text: $searchText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 20) {
                Text("Browse by")
                    .font(.headline)
                    .padding(.horizontal)

                ForEach(browseCategories, id: \.self) { category in
                    HStack {
                        Text(category)
                            .padding(.leading)
                            .font(.body)

                        Spacer()

                        Image(systemName: "chevron.right")
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                    .padding(.vertical, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)

                    Divider()
                }
            }
            .padding(.top)
            
            Spacer()
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Preview remains the same
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// End of file
