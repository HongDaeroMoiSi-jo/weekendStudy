import Cocoa

struct GameCharacter {
    let skill1: () -> Void = {
        print("파이어")
    }
    let skill2: () -> Void = {
        print("아이스")
    }
    let skill3: () -> Void = {
        print("워터")
    }
    let skill4: () -> Void = {
        print("윈드")
    }
    
    func a(number: Int) -> Void {
        print(number)
    }
    
    func tabShiftKey(number: Int, skill: (Int) -> Void) {
        skill(number)
    }
}

let wizard: GameCharacter = GameCharacter()
//wizard.tabShiftKey(skill: wizard.skill1)
//wizard.tabShiftKey(skill: wizard.skill2)
//wizard.tabShiftKey(skill: wizard.skill3)
//wizard.tabShiftKey(skill: wizard.skill4)

wizard.tabShiftKey(number: 10, skill: wizard.a)
wizard.tabShiftKey(number: 10) {num in
    wizard.a(number: num)
}

var arrayForHemg = [1, 2, 3, 4]

arrayForHemg.map(Double.init)
arrayForHemg.map{ Double.init($0) }


extension String {
    func myFilter(_ isIncluded: (Character) -> Bool) -> [String] {
        var result: [String] = []
        
        for i in self {
            let isTrue = isIncluded(i)
            if isTrue {
                result.append(String(i))
            }
        }
        
        return result
    }
    
    func myReduce(_ initResult: String, _ method: (String, String) -> String) -> String {
        var result: String = initResult
        
        for i in self {
            result = method(result, String(i))
        }
        
        return result
    }
}

"2re3sd4sd5d6".myFilter {
    $0.isNumber
}

"123".reduce("0", { $0 + "번" + String($1) })

"123".myReduce("0", { $0 + "번" + $1 })
//0번1
//0번1번2
//0번1번2번3
