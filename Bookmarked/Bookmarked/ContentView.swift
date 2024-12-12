//
//  ContentView.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .books
    @State private var selectedMainTab: MainTab = .home
    @State private var isSearching: Bool = false // Stato per gestire la ricerca
    @State private var searchText: String = "" // Stato per il testo di ricerca

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
                    // Header con titolo centrato e pulsante di ricerca
                    ZStack {
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                // Mostra la search view
                                isSearching.toggle()
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .font(.title2)
                                    .foregroundColor(.primary)
                            }
                        }
                        .padding(.trailing, 10) // Per distanziare il pulsante dal bordo

                        Text("Bookmarked")
                            .font(Font.custom("MoreSugarRegular", size: 36))
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 15)
                    .padding(.horizontal)

                    // Picker per navigazione tra le sezioni
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
                            // Mostra il contenuto basato sul tab selezionato
                            switch selectedTab {
                            case .books:
                                booksSection
                            case .reviews:
                                reviewsSection
                            case .lists:
                                listsSection
                            }
                        }
                        .padding(.top, 2)
                    }
                }
                .navigationBarHidden(true) // Nascondi la barra di navigazione
                .sheet(isPresented: $isSearching) {
                    SearchView(searchText: $searchText) // Mostra la search view quando `isSearching` è true
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
                    ForEach(sampleBooks.prefix(5)) { book in // Mostriamo i primi 5 libri
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
                    ForEach(recommendedBooks.suffix(5)) { book in // Mostriamo gli ultimi 5 libri
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

    // MARK: - Sezione Reviews
    var reviewsSection: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("New from friends")
                .font(.title)
                .fontWeight(.bold)
                .padding([.horizontal, .top])

            Text("Here you can show a list of recent reviews.")
                .padding(.horizontal)
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

// MARK: - Vista di ricerca
struct SearchView: View {
    @Binding var searchText: String // Binding per il testo di ricerca

    // Le categorie da visualizzare
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
            // Titolo "Search"
            Text("Search")
                .font(.headline)
                .padding()

            // Barra di ricerca
            TextField("Find books, authors, reviews...", text: $searchText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            // Sezione "Browse by"
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

                    Divider() // Linea di separazione
                }
            }
            .padding(.top)
            
            Spacer()
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
