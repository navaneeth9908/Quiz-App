//
//  QuestionModel.swift
//  QuizApp
//


import GameKit

struct QuestionModel {
    
    let questions = [
        Question(interrogative: "What is the capital of India?", answers: ["Telangana", "Delhi", "Maharastra", "Kolkata"], correctAnswerIndex: 1),
        Question(interrogative: "What is the capital of Canada?", answers: ["Ottawa", "Alberta", "British Columbia", "Quebec"], correctAnswerIndex: 0),
        Question(interrogative: "What is the capital of United States?", answers: ["Texas", "Cleveland", "Washington D.C", "Virginia"], correctAnswerIndex: 2),
        Question(interrogative: "What is the capital of England?", answers: ["Liverpool", "Birmingham", "London", "Oxford"], correctAnswerIndex: 2),
        Question(interrogative: "What is the capital of Australia ?", answers: ["Victoria", "Queensland", "Tasmania", "Canberra"], correctAnswerIndex: 3),
        Question(interrogative: "What is the capital of China?", answers: ["Anhui", "Beijing", "Hunan", "Gansu"], correctAnswerIndex: 1),
        Question(interrogative: "What is the capital of Japan?", answers: ["Tokyo", "Kyoto", "Kobe", "Yokohama"], correctAnswerIndex: 0),
        Question(interrogative: "What is the capital of New Zealand?", answers: ["Wellington", "Auckland", "Otago", "Canterbury"], correctAnswerIndex: 0),
        Question(interrogative: "What is the capital of South Africa?", answers: ["Bhisho", "Cape Town", "Kimberley", "Mahikeng"], correctAnswerIndex: 1),
        Question(interrogative: "What is the capital of Russia?", answers: ["Sakha", "Altai", "Tuva", "St. Petersburg"], correctAnswerIndex: 3)
    ]
    
    var previouslyUsedNumbers: [Int] = []
    
    mutating func getRandomQuestion() -> Question {
        
        if (previouslyUsedNumbers.count == questions.count) {
            previouslyUsedNumbers = []
        }
        var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        
        // Picks a new random number if the previous one has been used
        while (previouslyUsedNumbers.contains(randomNumber)) {
            randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        }
        previouslyUsedNumbers.append(randomNumber)
        
        return questions[randomNumber]
    }
}

class Question {
    
    fileprivate let interrogative: String
    fileprivate let answers: [String]
    fileprivate let correctAnswerIndex: Int
    
    init(interrogative: String, answers: [String], correctAnswerIndex: Int) {
        self.interrogative = interrogative
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
    
    func validateAnswer(to givenAnswer: String) -> Bool {
        return (givenAnswer == answers[correctAnswerIndex])
    }
    
    func getInterrogative() -> String {
        return interrogative
    }
    
    func getAnswer() -> String {
        return answers[correctAnswerIndex]
    }
    
    func getChoices() -> [String] {
        return answers
    }
    
    func getAnswerAt(index: Int) -> String {
        return answers[index]
    }
}
