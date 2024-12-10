//
//  ContentView.swift
//  Bookmarked
//
//  Created by Dario Saldamarco on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(sampleBooks) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            BookCardView(book: book)
                        }
                        .buttonStyle(PlainButtonStyle()) // Per rimuovere il comportamento di default del pulsante
                    }
                }
                .padding()
            }
            .navigationTitle("Bookmarked")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
