//
//  ContentView.swift
//  BooksBindableObjects
//
//  Created by Giuseppe Sapienza on 11/07/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @EnvironmentObject var cart: Cart
        
    var books: [Book] = []
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                Group {
                    
                    HStack {
                        Text("Total")
                        Spacer()
                        Text(cart.totalPriceText)
                            .font(.title)
                    }
                    
                    ForEach(books) { book in
                        BookRow(book: book)
                            .environmentObject(self.cart)
                    }
                    
                }.padding()
                
                .navigationBarTitle(Text("Home"))
            }
        }
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(books: Book.testObjects())
            .environmentObject(Cart())
    }
}
#endif
