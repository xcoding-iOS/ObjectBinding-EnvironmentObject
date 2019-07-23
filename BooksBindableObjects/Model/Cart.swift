//
//  Cart.swift
//  BooksBindableObjects
//
//  Created by Giuseppe Sapienza on 15/07/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import SwiftUI
import Combine

class Cart: BindableObject {
    
    let id: String = UUID().uuidString
    let willChange = PassthroughSubject<Void, Never>()
    
    private var books: [Book] = [] {
        willSet {
            willChange.send()
        }
    }
    
    var totalPrice: Double {
        books.reduce(0.0, { $0 + $1.price })
    }
    
    var totalPriceText: String {
        return String(format: "%.2f", totalPrice) + " €"
    }
    
    func add(book: Book) {
        books.append(book)
    }
    
    func remove(book: Book) {
        guard let id = books.firstIndex(where: { $0.id == book.id }) else { return }
        books.remove(at: id)
    }
    
}
