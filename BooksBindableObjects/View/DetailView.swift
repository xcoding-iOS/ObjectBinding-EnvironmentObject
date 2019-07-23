//
//  DetailView.swift
//  BooksBindableObjects
//
//  Created by Giuseppe Sapienza on 23/07/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import SwiftUI

struct DetailView : View {
    
    init(book: Book) {
        self.book = book
    }
    
    @EnvironmentObject var cart: Cart
    @ObjectBinding private var book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(uiImage: book.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 300)
                    .cornerRadius(6)
                    .shadow(radius: 20)
                
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(nil)
                    
                    Text(book.author)
                        .lineLimit(2)
                    
                    
                }
                .padding(.leading, 10)
                
            }
            
            Text(book.description)
                .lineLimit(nil)
                .padding(.top, 30)
                .padding(.bottom, 30)
            
                
            Button(action: {
                self.book.selected.toggle()
                if (self.book.selected) {
                    self.cart.add(book: self.book)
                } else {
                    self.cart.remove(book: self.book)
                }
            }, label: {
                Text(self.book.priceText)
                    .padding(
                        EdgeInsets(top: 15, leading: 30, bottom: 15, trailing: 30))
                    .foregroundColor(.white)
                    .font(.callout)
            })
            .background(book.selected ? Color.green : Color.black)
            .cornerRadius(100)
            .shadow(radius: 20)
                
            Spacer()
                
            .navigationBarTitle(Text(book.title))
        }
        .padding()
    }
}

#if DEBUG
struct DetailView_Previews : PreviewProvider {
    static var previews: some View {
        DetailView(book: Book.testObjects()[3])
            .environmentObject(Cart())
    }
}
#endif
