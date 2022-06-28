//
//  QuizBrain.swift
//  Quiz_Itea
//
//  Created by Anastasia Bilous on 2022-06-17.
//

import Foundation

struct QuizBrain {
    
    static var shared = QuizBrain()
    
    var questionNumber = 0
    var score = 0
    
    var yourAnswers = ["No answer", "No answer", "No answer", "No answer", "No answer", "No answer", "No answer", "No answer", "No answer", "No answer"]
    
    
    let quiz = [
        Question(question: "Which is the largest organ in the human body?", answers: ["Heart", "Skin", "Large Intestine", "Liver"], correctAnswer: "Skin"),
        Question(question: "Five dollars is worth how many nickels?", answers: ["25", "50", "100", "200"], correctAnswer: "100"),
        Question(question: "What do the letters in the GMT time zone stand for?", answers: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time", "Global Money Transfer"], correctAnswer: "Greenwich Mean Time"),
        Question(question: "What is the French word for 'hat'?", answers: ["Chapeau", "Écharpe", "Bonnet", "Tuque"], correctAnswer: "Chapeau"),
        Question(question: "In past times, what would a gentleman keep in his fob pocket?", answers: ["Notebook", "Handkerchief", "Watch", "Money"], correctAnswer: "Watch"),
        Question(question: "How would one say goodbye in Spanish?", answers: ["Au Revoir", "Adiós", "Salir", "Bye"], correctAnswer: "Adiós"),
        Question(question: "Which of these colours is NOT featured in the logo for Google?", answers: ["Green", "Red", "Blue", "Orange"], correctAnswer: "Orange"),
        Question(question: "What alcoholic drink is made from molasses?", answers: ["Rum", "Whisky", "Gin", "Vodka"], correctAnswer: "Rum"),
        Question(question: "What type of animal was Harambe?", answers: ["Panda", "Crocodile", "Cat", "Gorilla"], correctAnswer: "Gorilla"),
        Question(question: "Where is Tasmania located?", answers: ["Indonesia", "Australia", "Scotland", "USA"], correctAnswer: "Australia")
    ]
    
    
    func getQuestionText() -> String {
        return quiz[questionNumber].question
    }
    
    
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> String {
        return "Your progress: \(questionNumber + 1) / \(quiz.count)"
    }
    
    
    mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func saveYoursAnswer(userAnswer: String) {
        
        yourAnswers[questionNumber] = userAnswer
    }
    
    mutating func checkAnswer(userAnswer: String) {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
        }
    }
}

