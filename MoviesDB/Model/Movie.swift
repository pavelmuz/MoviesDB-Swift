//
//  Movie.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 10.10.2023.
//

import Foundation

struct Movie: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let posterUrl: String
    let year: Int
    let description: String
    let kinopoiskUrl: String
}

extension Movie {
    static let MOCK_MOVIES: [Movie]  = [
        Movie(
            id: NSUUID().uuidString,
            title: "Interstellar",
            posterUrl: "interstellar",
            year: 2014,
            description: "Когда засуха, пыльные бури и вымирание растений приводят человечество к продовольственному кризису, коллектив исследователей и учёных отправляется сквозь червоточину (которая предположительно соединяет области пространства-времени через большое расстояние) в путешествие, чтобы превзойти прежние ограничения для космических путешествий человека и найти планету с подходящими для человечества условиями.",
            kinopoiskUrl: "https://www.kinopoisk.ru/film/258687/"
        ),
        Movie(
            id: NSUUID().uuidString,
            title: "The Shawshank Redemption",
            posterUrl: "shawshank",
            year: 1994,
            description: "Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения.",
            kinopoiskUrl: "https://www.kinopoisk.ru/film/326/"
        ),
        Movie(
            id: NSUUID().uuidString,
            title: "Matrix",
            posterUrl: "matrix",
            year: 1999,
            description: "Жизнь Томаса Андерсона разделена на две части: днём он — самый обычный офисный работник, получающий нагоняи от начальства, а ночью превращается в хакера по имени Нео, и нет места в сети, куда он бы не смог проникнуть. Но однажды всё меняется. Томас узнаёт ужасающую правду о реальности.",
            kinopoiskUrl: "https://www.kinopoisk.ru/film/301/"
        )
    ]
}
