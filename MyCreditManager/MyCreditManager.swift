
import Foundation

struct MyCreditManager {
    var studentInfo = [String:[String:String]]()
    
    var student = Student()
    var grade = Grade()

    mutating func runProgram(_ input: String) {
        guard let menu = Int(input), (1...5).contains(menu) else {
            print("뭔가 입력이 잘못되었습니다. 1~5 사의 숫자 혹은 X를 입력해주세요.")
            return
        }
        
        student.studentInfo = studentInfo
        grade.studentInfo = studentInfo
        
        switch menu {
        case 1:
            student.addStudent()
            studentInfo = student.studentInfo
        case 2:
            student.removeStudent()
            studentInfo = student.studentInfo
        case 3:
            grade.addGrade()
            studentInfo = grade.studentInfo
        case 4:
            grade.removeGrade()
            studentInfo = grade.studentInfo
        case 5:
            grade.readGrade()
            studentInfo = grade.studentInfo
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
