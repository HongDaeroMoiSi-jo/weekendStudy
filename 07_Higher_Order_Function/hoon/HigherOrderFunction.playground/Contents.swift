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
    
    func tabShiftKey(skill: () -> Void) {
        skill()
    }
}

let wizard: GameCharacter = GameCharacter()
wizard.tabShiftKey(skill: wizard.skill1)
wizard.tabShiftKey(skill: wizard.skill2)
wizard.tabShiftKey(skill: wizard.skill3)
wizard.tabShiftKey(skill: wizard.skill4)
