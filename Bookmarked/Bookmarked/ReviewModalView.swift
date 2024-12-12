import SwiftUI

struct ReviewModalView: View {
    @Binding var isPresented: Bool
    var review: Review
    var book: Book

    @State private var isLiked: Bool = false // Stato per il cuore
    @State private var isContentReady: Bool = false // Stato per il caricamento

    var body: some View {
        NavigationView {
            Group {
                if isContentReady {
                    // Contenuto principale
                    VStack(spacing: 16) {
                        // Avatar, nome, dettagli libro, recensione
                        HStack(spacing: 16) {
                            // Colonna di sinistra
                            VStack(alignment: .leading, spacing: 12) {
                                // Avatar e nome utente
                                HStack(spacing: 8) {
                                    Image(review.avatarImageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                        .shadow(radius: 10)
                                        .onAppear {
                                                if UIImage(named: review.avatarImageName) == nil {
                                                    print("Avatar image not found: \(review.avatarImageName)")
                                                }
                                            }
                                    
                                    VStack(alignment: .leading) {
                                        Text(review.reviewerName)
                                            .font(.headline)
                                    }
                                }

                                // Nome libro
                                Text(book.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)

                                // Stelle di valutazione
                                HStack {
                                    StarRatingView(rating: review.rating)
                                }

                                // Data della recensione
                                Text("Reviewed on: Dec 10, 2024")
                                    .font(.footnote)
                                    .foregroundColor(.gray)

                                // Recensione
                                Text(review.comment)
                                    .font(.body)
                                    .padding(.top, 8)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                            // Copertina del libro
                            Image(book.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .cornerRadius(8)
                                .shadow(radius: 5)
                                .onAppear {
                                        if UIImage(named: book.imageName) == nil {
                                            print("Book cover image not found: \(book.imageName)")
                                        }
                                    }
                        }
                        .padding()

                        // Sezione dei like e dei bottoni
                        VStack(alignment: .leading, spacing: 16) {
                            // Like e numero di like
                            HStack(spacing: 8) {
                                Button(action: {
                                    isLiked.toggle()
                                }) {
                                    HStack(spacing: 4) {
                                        Image(systemName: isLiked ? "heart.fill" : "heart")
                                            .foregroundColor(isLiked ? .red : .gray)
                                            .font(.system(size: 18))
                                        Text("Like")
                                            .font(.body)
                                            .foregroundColor(.primary)
                                    }
                                }

                                Text("\(isLiked ? 1338 : 1337) likes")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.bottom, 10)
                            // Bottoni tipo segmented control
                            HStack(spacing: 16) {
                                Button(action: {
                                    print("Comments clicked")
                                }) {
                                    Text("10 Comments")
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(Color(.systemGray5))
                                        .cornerRadius(8)
                                }

                                Button(action: {
                                    print("Another action clicked")
                                }) {
                                    Text("Save review +")
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(Color(.systemGray5))
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading) // Allinea alla sinistra dello schermo
                        .padding(.horizontal)

                        Spacer()
                    }
                } else {
                    // Placeholder durante il caricamento
                    ProgressView("Loading Review...")
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
            .onAppear {
                // Ritardo artificiale per simulare il caricamento
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isContentReady = true
                }
            }
            .navigationTitle("Review")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button("Close") {
                    isPresented = false
                }
            )
        }
    }
}

struct ReviewModalView_Previews: PreviewProvider {
    static var previews: some View {
        // Usa un libro e una recensione specifica per la preview
        if let book = recommendedBooks.first, let review = book.reviews.first {
            ReviewModalView(isPresented: .constant(true), review: review, book: book)
        } else {
            // Fallback nel caso non ci siano dati
            Text("No data available")
        }
    }
}
