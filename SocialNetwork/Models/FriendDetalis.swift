//
//  FriendPhotos.swift
//  SocialNetwork
//
//  Created by David Varro on 23/07/2021.
//

import UIKit


struct Friend {

    static let `default` = Friend(name: "", avatar: UIImage(), photos: [])

    let name: String
    let avatar: UIImage?
    let photos: [UIImage]?
    
    static var friends = [
        Friend(name: "Elon Musk",
               avatar: UIImage(named: "elon2.jpeg")!,
               photos: [
                UIImage(named: "elon2")!,
                UIImage(named: "elon1")!,
                UIImage(named: "elon3")!,
                UIImage(named: "elon4")!
               ]),
        
        Friend(name: "Tim Cook",
               avatar: UIImage(named: "timcook2")!,
               photos: [
                UIImage(named: "timcook")!,
                UIImage(named: "timcook2")!,
                UIImage(named: "timcook3")!,
                UIImage(named: "timcook4")!
               ]),
        Friend(name: "Emma Stone",
               avatar: UIImage(named: "emmastone1")!,
               photos: [
                UIImage(named: "emmastone1")!,
                UIImage(named: "emmastone2")!,
                UIImage(named: "emmastone3")!,
                UIImage(named: "emmastone4")!
               ]),
        Friend(name: "Emma Watson",
               avatar: UIImage(named: "emmawatson2")!,
               photos: [
                UIImage(named: "emmawatson1")!,
                UIImage(named: "emmawatson2")!,
                UIImage(named: "emmawatson3")!,
                UIImage(named: "emmawatson4")!
               ]),
        Friend(name: "Ryan Raynolds",
               avatar: UIImage(named: "ryan1")!,
               photos: [
                UIImage(named: "ryan1")!,
                UIImage(named: "ryan2")!,
                UIImage(named: "ryan3")!,
                UIImage(named: "ryan4")!
               ]),
        Friend(name: "Jeff Bezos",
               avatar: UIImage(named: "bezos2")!,
               photos: [
                UIImage(named: "bezos1")!,
                UIImage(named: "bezos2")!,
                UIImage(named: "bezos3")!,
                UIImage(named: "bezos4")!
               ]),
        Friend(name: "Craig Federighi ",
               avatar: UIImage(named: "craig4")!,
               photos: [
                UIImage(named: "craig1")!,
                UIImage(named: "craig2")!,
                UIImage(named: "craig3")!,
                UIImage(named: "craig4")!
               ]),
        Friend(name: "Izsak Mark",
               avatar: UIImage(named: "mark1")!,
               photos: [
                UIImage(named: "mark1")!
               ]),
        Friend(name: "Alex Fergusson", avatar: nil, photos: nil),
        Friend(name: "Bob", avatar: nil, photos: nil),
        Friend(name: "Charlie", avatar: nil, photos: nil),
        Friend(name: "Zlatan Ibrahimovich", avatar: nil, photos: nil),
        Friend(name: "Boris Johnson", avatar: nil, photos: nil),
        Friend(name: "John Doe", avatar: nil, photos: nil),
        Friend(name: "Jane Doe", avatar: nil, photos: nil),
        Friend(name: "Steven Creek", avatar: nil, photos: nil),
        Friend(name: "Frank Castle", avatar: nil, photos: nil)
    ]
}
