//
//  Bible.swift
//  BibleApp
//
//  Created by Seungchul Ha on 2022/11/26.
//

import Foundation

struct Bible: Codable, Hashable {
    var book: String
    var version: String
    var chapter, verse: Int
    var word: String
    var isMarked: Bool
    var isFavorite: Bool
}

enum Book: String, Codable {
    case acts = "Acts"
    case amos = "Amos"
    case colossians = "Colossians"
    case daniel = "Daniel"
    case deuteronomy = "Deuteronomy"
    case ecclesiastes = "Ecclesiastes"
    case ephesians = "Ephesians"
    case esther = "Esther"
    case exodus = "Exodus"
    case ezekiel = "Ezekiel"
    case ezra = "Ezra"
    case galatians = "Galatians"
    case genesis = "Genesis"
    case habakkuk = "Habakkuk"
    case haggai = "Haggai"
    case hebrews = "Hebrews"
    case hosea = "Hosea"
    case isaiah = "Isaiah"
    case james = "James"
    case jeremiah = "Jeremiah"
    case job = "Job"
    case joel = "Joel"
    case john = "John"
    case jonah = "Jonah"
    case joshua = "Joshua"
    case jude = "Jude"
    case judges = "Judges"
    case lamentations = "Lamentations"
    case leviticus = "Leviticus"
    case luke = "Luke"
    case malachi = "Malachi"
    case mark = "Mark"
    case matthew = "Matthew"
    case micah = "Micah"
    case nahum = "Nahum"
    case nehemiah = "Nehemiah"
    case numbers = "Numbers"
    case obadiah = "Obadiah"
    case philemon = "Philemon"
    case philippians = "Philippians"
    case proverbs = "Proverbs"
    case psalms = "Psalms"
    case revelation = "Revelation"
    case romans = "Romans"
    case ruth = "Ruth"
    case songOfSongs = "Song of Songs"
    case the1Chronicles = "1 Chronicles"
    case the1Corinthians = "1 Corinthians"
    case the1John = "1 John"
    case the1Kings = "1 Kings"
    case the1Peter = "1 Peter"
    case the1Samuel = "1 Samuel"
    case the1Thessalonians = "1 Thessalonians"
    case the1Timothy = "1 Timothy"
    case the2Chronicles = "2 Chronicles"
    case the2Corinthians = "2 Corinthians"
    case the2John = "2 John"
    case the2Kings = "2 Kings"
    case the2Peter = "2 Peter"
    case the2Samuel = "2 Samuel"
    case the2Thessalonians = "2 Thessalonians"
    case the2Timothy = "2 Timothy"
    case the3John = "3 John"
    case titus = "Titus"
    case zechariah = "Zechariah"
    case zephaniah = "Zephaniah"
}

//var niv_books: [String] = [
//    "Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy", "Joshua", "Judges", "Ruth", "1 Samuel", "2 Samuel", "1 Kings", "2 Kings", "1 Chronicles", "2 Chronicles", "Ezra", "Nehemiah", "Esther", "Job", "Psalms", "Proverbs", "Ecclesiates", "Song of Songs", "Isaiah", "Jeremiah", "Lamentations", "Ezekiel", "Daniel", "Hosea", "Joel", "Amos", "Obadiah", "Jonah", "Micah", "Nahum", "Habakkuk", "Zephaniah", "Haggai", "Zechariah", "Malachi", "Matthew", "Mark", "Luke", "John", "Acts", "Romans", "1 Corinthians", "2 Corinthians", "Galatians", "Ephesians", "Philippians", "Colossians", "1 Thessalonians", "2 Thessalonians", "1 Timothy", "2 Timothy", "Titus", "Philemon", "Hebrews", "James", "1 Peter", "2 Peter", "1 John", "2 John", "3 John", "Jude", "Revelation"
//]

struct BookName: Identifiable {
    
    var id = UUID().uuidString
    var bookname: String
    var version: String
    var language: String
    var part: String
    var koreanName: String
}

var niv_books: [BookName] = [
    BookName(bookname: "Genesis", version: "niv", language: "english", part: "old", koreanName: "창세기"),
    BookName(bookname: "Exodus", version: "niv", language: "english", part: "old", koreanName: "출애굽기"),
    BookName(bookname: "Leviticus", version: "niv", language: "english", part: "old", koreanName: "레위기"),
    BookName(bookname: "Numbers", version: "niv", language: "english", part: "old", koreanName: "민수기"),
    BookName(bookname: "Deuteronomy", version: "niv", language: "english", part: "old", koreanName: "신명기"),
    BookName(bookname: "Joshua", version: "niv", language: "english", part: "old", koreanName: "여호수아"),
    BookName(bookname: "Judges", version: "niv", language: "english", part: "old", koreanName: "사사기"),
    BookName(bookname: "Ruth", version: "niv", language: "english", part: "old", koreanName: "룻기"),
    BookName(bookname: "1 Samuel", version: "niv", language: "english", part: "old", koreanName: "사무엘상"),
    BookName(bookname: "2 Samuel", version: "niv", language: "english", part: "old", koreanName: "사무엘하"),
    BookName(bookname: "1 Kings", version: "niv", language: "english", part: "old", koreanName: "열왕기상"),
    BookName(bookname: "2 Kings", version: "niv", language: "english", part: "old", koreanName: "열왕기하"),
    BookName(bookname: "1 Chronicles", version: "niv", language: "english", part: "old", koreanName: "역대상"),
    BookName(bookname: "2 Chronicles", version: "niv", language: "english", part: "old", koreanName: "역대하"),
    BookName(bookname: "Ezra", version: "niv", language: "english", part: "old", koreanName: "에스라"),
    BookName(bookname: "Nehemiah", version: "niv", language: "english", part: "old", koreanName: "느헤미야"),
    BookName(bookname: "Esther", version: "niv", language: "english", part: "old", koreanName: "에스더"),
    BookName(bookname: "Job", version: "niv", language: "english", part: "old", koreanName: "욥기"),
    BookName(bookname: "Psalms", version: "niv", language: "english", part: "old", koreanName: "시편"),
    BookName(bookname: "Proverbs", version: "niv", language: "english", part: "old", koreanName: "잠언"),
    BookName(bookname: "Ecclesiates", version: "niv", language: "english", part: "old", koreanName: "전도서"),
    BookName(bookname: "Song of Songs", version: "niv", language: "english", part: "old", koreanName: "아가"),
    BookName(bookname: "Isaiah", version: "niv", language: "english", part: "old", koreanName: "이사야"),
    BookName(bookname: "Jeremiah", version: "niv", language: "english", part: "old", koreanName: "예레미야"),
    BookName(bookname: "Lamentations", version: "niv", language: "english", part: "old", koreanName: "예레미야애가"),
    BookName(bookname: "Ezekiel", version: "niv", language: "english", part: "old", koreanName: "에스겔"),
    BookName(bookname: "Daniel", version: "niv", language: "english", part: "old", koreanName: "다니엘"),
    BookName(bookname: "Hosea", version: "niv", language: "english", part: "old", koreanName: "호세아"),
    BookName(bookname: "Joel", version: "niv", language: "english", part: "old", koreanName: "요엘"),
    BookName(bookname: "Amos", version: "niv", language: "english", part: "old", koreanName: "아모스"),
    BookName(bookname: "Obadiah", version: "niv", language: "english", part: "old", koreanName: "오바댜"),
    BookName(bookname: "Jonah", version: "niv", language: "english", part: "old", koreanName: "요나"),
    BookName(bookname: "Micah", version: "niv", language: "english", part: "old", koreanName: "미가"),
    BookName(bookname: "Nahum", version: "niv", language: "english", part: "old", koreanName: "나훔"),
    BookName(bookname: "Habakkuk", version: "niv", language: "english", part: "old", koreanName: "하박국"),
    BookName(bookname: "Zephaniah", version: "niv", language: "english", part: "old", koreanName: "스바냐"),
    BookName(bookname: "Haggai", version: "niv", language: "english", part: "old", koreanName: "학개"),
    BookName(bookname: "Zechariah", version: "niv", language: "english", part: "old", koreanName: "스가랴"),
    BookName(bookname: "Malachi", version: "niv", language: "english", part: "old", koreanName: "말라기"),
    BookName(bookname: "Matthew", version: "niv", language: "english", part: "new", koreanName: "마태복음"),
    BookName(bookname: "Mark", version: "niv", language: "english", part: "new", koreanName: "마가복음"),
    BookName(bookname: "Luke", version: "niv", language: "english", part: "new", koreanName: "누가복음"),
    BookName(bookname: "John", version: "niv", language: "english", part: "new", koreanName: "요한복음"),
    BookName(bookname: "Acts", version: "niv", language: "english", part: "new", koreanName: "사도행전"),
    BookName(bookname: "Romans", version: "niv", language: "english", part: "new", koreanName: "로마서"),
    BookName(bookname: "1 Corinthians", version: "niv", language: "english", part: "new", koreanName: "고린도전서"),
    BookName(bookname: "2 Corinthians", version: "niv", language: "english", part: "new", koreanName: "고린도후서"),
    BookName(bookname: "Galatians", version: "niv", language: "english", part: "new", koreanName: "갈라디아서"),
    BookName(bookname: "Ephesians", version: "niv", language: "english", part: "new", koreanName: "에베소서"),
    BookName(bookname: "Philippians", version: "niv", language: "english", part: "new", koreanName: "빌립보서"),
    BookName(bookname: "Colossians", version: "niv", language: "english", part: "new", koreanName: "골로새서"),
    BookName(bookname: "1 Thessalonians", version: "niv", language: "english", part: "new", koreanName: "데살로니가전서"),
    BookName(bookname: "2 Thessalonians", version: "niv", language: "english", part: "new", koreanName: "데살로니가후서"),
    BookName(bookname: "1 Timothy", version: "niv", language: "english", part: "new", koreanName: "디모데전서"),
    BookName(bookname: "2 Timothy", version: "niv", language: "english", part: "new", koreanName: "디모데후서"),
    BookName(bookname: "Titus", version: "niv", language: "english", part: "new", koreanName: "디도서"),
    BookName(bookname: "Philemon", version: "niv", language: "english", part: "new", koreanName: "빌레몬서"),
    BookName(bookname: "Hebrews", version: "niv", language: "english", part: "new", koreanName: "히브리서"),
    BookName(bookname: "James", version: "niv", language: "english", part: "new", koreanName: "야고보서"),
    BookName(bookname: "1 Peter", version: "niv", language: "english", part: "new", koreanName: "베드로전서"),
    BookName(bookname: "2 Peter", version: "niv", language: "english", part: "new", koreanName: "베드로후서"),
    BookName(bookname: "1 John", version: "niv", language: "english", part: "new", koreanName: "요한일서"),
    BookName(bookname: "2 John", version: "niv", language: "english", part: "new", koreanName: "요한이서"),
    BookName(bookname: "3 John", version: "niv", language: "english", part: "new", koreanName: "요한삼서"),
    BookName(bookname: "Jude", version: "niv", language: "english", part: "new", koreanName: "유다서"),
    BookName(bookname: "Revelation", version: "niv", language: "english", part: "new", koreanName: "요한계시록")
]
