
import Foundation

struct Student: InputProtocol {
    var studentInfo = [String:[String:String]]()
    
    func readInput(prompt: String) -> String? {
        print(prompt)
        
        guard let input = readLine(), !input.isEmpty else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return nil
        }
        return input
    }
    
    mutating func addStudent() {
        guard let inputStudent = readInput(prompt: "추가할 학생의 이름을 입력해주세요") else { return }
        
        if let _ = studentInfo[inputStudent]  {
            print("\(inputStudent)는 이미 존재하는 학생입니다. 추가하지 않습니다.")
            return
        }
        
        studentInfo[inputStudent] = [:]
        print("\(inputStudent) 학생을 추가했습니다.")
    }

    mutating func removeStudent() {
        guard let inputStudent = readInput(prompt: "삭제할 학생의 이름을 입력하세요.") else { return }
    
        if let studentIndex = studentInfo.keys.firstIndex(where: {$0 == inputStudent}) {
            studentInfo.remove(at: studentIndex)
            print("\(inputStudent) 학생을 삭제하였습니다.")
        } else {
            print("\(inputStudent) 학생을 찾지 못했습니다.")
        }
    }
}
