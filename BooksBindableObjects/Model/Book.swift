//
//  Book.swift
//  BooksBindableObjects
//
//  Created by Giuseppe Sapienza on 11/07/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import SwiftUI
import Combine

class Book: BindableObject {
    
    init(title: String, image: UIImage, author: String, description: String, price: Double) {
        self.title = title
        self.image = image
        self.author = author
        self.description = description
        self.price = price
    }
        
    let id: String = UUID().uuidString
    let willChange = PassthroughSubject<Void, Never>()
    
    let title: String
    let image: UIImage
    let author: String
    let description: String
    let price: Double
    
    var priceText: String {
        if selected {
            return "Selected"
        }
        return String(format: "%.2f", price) + " €"
    }
    
    var selected: Bool = false {
        willSet {
            willChange.send()
        }
    }
}


#if DEBUG
extension Book {
    static func testObjects() -> [Book] {
        return [
            Book.init(title: "Clean Code",
                      image: UIImage(named: "cleancode")!,
                      author: "Robert Martin",
                      description: "Even bad code can function. But if code isn’t clean, it can bring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. But it doesn’t have to be that way.",
                      price: 28.27),
            Book.init(title: "Elegant Objects v.1",
                      image: UIImage(named: "elegant")!,
                      author: "Yegor Bugayenko",
                      description: "Yegor is a CTO and co-founder of Teamed.io, a software development company with a unique approach to management of distributed teams; a regular blogger at www.yegor256.com",
                      price: 39.28),
            Book.init(title: "Design Patterns",
                      image: UIImage(named: "pattern")!,
                      author: "Erich Gamma, Richard Helm, Ralph Johnson and John Vlissides",
                      description: "Yegor is a CTO and co-founder of Teamed.io, a software development company with a unique approach to management of distributed teams; a regular blogger at www.yegor256.com",
                      price: 48.21),
            Book.init(title: "Cracking the Coding Interview",
                      image: UIImage(named: "interview")!,
                      author: "Gayle Laakmann McDowell",
                      description: "Learn how to uncover the hints and hidden details in a question, discover how to break down a problem into manageable chunks, develop techniques to unstick yourself when stuck, learn (or re-learn) core computer science concepts, and practice on 189 interview questions and solutions.",
                      price: 37.09)
        ]
    }
}
#endif
