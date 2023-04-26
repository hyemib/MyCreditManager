//
//  main.swift
//  MyCreditManager
//
//  Created by hyemi on 2023/04/23.
//

import Foundation

protocol InputProtocol {
    func readInput(prompt: String) -> String?
}
   
struct MyCreditManager {
    var student = Student()
    let grade = Grade()

    mutating func runProgram(_ input: String) {
        guard let menu = Int(input), (1...5).contains(menu) else {
            print("뭔가 입력이 잘못되었습니다. 1~5 사의 숫자 혹은 X를 입력해주세요.")
            return
        }
        
        switch Int(input)! {
        case 1:
            student.addStudent()
        case 2:
            student.removeStudent()
        case 3:
            grade.addGrade()
        case 4:
            grade.removeGrade()
        case 5:
            grade.readGrade()
        default:
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    }

    func exitProgram(_ input: String) {
        guard input == "X" else {
            print("뭔가 입력이 잘못되었습니다. 1~5 사의 숫자 혹은 X를 입력해주세요.")
            return
        }
        
        print("프로그램을 종료합니다...")
        exit(0)
    }

    mutating func startProgram() {
        while true {
            let prompt = """
            원하는 기능을 입력해주세요
            1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
            """
            print(prompt)

            if let input = readLine(), input.count == 1 {
                if Character(input).isNumber {
                    runProgram(input)
                } else {
                    exitProgram(input)
                }
            } else {
                print("뭔가 입력이 잘못되었습니다. 1~5 사의 숫자 혹은 X를 입력해주세요.")
            }
        }
    }
}

var myCreditManager = MyCreditManager()
myCreditManager.startProgram()



