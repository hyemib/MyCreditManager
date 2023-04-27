
import Foundation

struct Grade: InputProtocol {
    var studentInfo = [String:[String:String]]()
    
    var grades: [String : Double] = [
        "A+" : 4.5,
        "A" : 4.0,
        "B+" : 3.5,
        "B" : 3.0,
        "C+" : 2.5,
        "C" : 2.0,
        "D+" : 1.5,
        "D" : 1.0,
        "F" : 0
    ]
    
    func readInput(prompt: String) -> String? {
        print(prompt)
        
        guard let input = readLine(), !input.isEmpty else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return nil
        }
        return input
    }
    
    mutating func addGrade() {
        let prompt = """
        성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예) Mickey Swift A+
        만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
        """
        
        guard let inputGrade = readInput(prompt: prompt)?.components(separatedBy: " ") else { return }
      
        guard inputGrade.count == 3, var _ = studentInfo[inputGrade[0]], let _ = grades[inputGrade[2]] else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
   
        studentInfo[inputGrade[0]]?[inputGrade[1]] = inputGrade[2]
        print("\(inputGrade[0]) 학생의 \(inputGrade[1]) 과목이 \(inputGrade[2])로 추가(변경)되었습니다.")
    }

    mutating func removeGrade() {
        let prompt = """
        성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력 예시) Mickey Swift
        """
        
        guard let inputGrade = readInput(prompt: prompt)?.components(separatedBy: " ") else { return }
        
        guard let studentName = studentInfo[inputGrade[0]] else {
            print("\(inputGrade[0]) 학생을 찾지 못했습니다.")
            return
        }
        
        guard inputGrade.count == 2, let _ = studentName[inputGrade[1]] else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        studentInfo[inputGrade[0]]?[inputGrade[1]] = nil
        print("\(inputGrade[0]) 학생의 \(inputGrade[1]) 과목의 성적이 삭제되었습니다.")
    }

    func readGrade() {
        let prompt = "평점을 알고 싶은 학생의 이름을 입력해주세요."
        
        guard let inputStudent = readInput(prompt: prompt) else { return }
        
        guard let student = studentInfo[inputStudent] else {
            print("\(inputStudent) 학생을 찾지 못했습니다.")
            return
        }
        
        let subjectAndGrade = student.sorted(by: <)
        var gradeSum: Double = 0
        
        for (subject, grade) in subjectAndGrade {
            print("\(subject): \(grade)")
            gradeSum += grades[grade] ?? 0
        }
        
        let gradeAverage = gradeSum / Double(subjectAndGrade.count)
        print("평점: \(subjectAndGrade.count == 0 ? "0" : String(format: "%.2f", gradeAverage))")
    }
}
