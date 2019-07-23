//
//  BookRow.swift
//  BooksBindableObjects
//
//  Created by Giuseppe Sapienza on 16/07/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import SwiftUI

struct BookRow : View {
    
    @EnvironmentObject var cart: Cart
    @ObjectBinding var book: Book
    
    var body: some View {
        HStack {
            NavigationLink(
                destination: DetailView(book: self.book)
                                .environmentObject(cart)
            ) {
                EmptyView()
                    .frame(width: 100, height: 100)
            }.background(
                Image(uiImage: book.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 20)
            )
            
            VStack(alignment: .leading) {
                Text(book.title)
                    .fontWeight(.bold)
                    .lineLimit(nil)
                Text(book.author)
                    .font(.caption)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Button(action: {
                self.book.selected.toggle()
                if (self.book.selected) {
                    self.cart.add(book: self.book)
                } else {
                    self.cart.remove(book: self.book)
                }
            }) {
                Text(book.priceText)
                    .accentColor(Color.white)
                    .padding(EdgeInsets(
                        top: 5,
                        leading: 10,
                        bottom: 5,
                        trailing: 10))
            }
            .background(book.selected ? Color.green : Color.black)
            .cornerRadius(100)
        }
    }
    
    
}

#if DEBUG
struct BookRow_Previews : PreviewProvider {
    static var previews: some View {
        BookRow(book: Book.testObjects()[3])
            .environmentObject(Cart())
    }
}
#endif
