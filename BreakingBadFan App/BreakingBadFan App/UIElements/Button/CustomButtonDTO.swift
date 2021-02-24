import UIKit

enum ButtonDTO {
    case primaryButtonDTO
    case secondaryButtonDTO
    case actionButtonActiveDTO
    case actionButtonNotActiveDTO

    var dto: CustomButtonDTO {
        switch self {
        case .primaryButtonDTO:
            return CustomButtonDTO.primaryButtonDTO
        case .secondaryButtonDTO:
            return CustomButtonDTO.secondaryButtonDTO
        case .actionButtonActiveDTO:
            return CustomButtonDTO.actionButtonActiveDTO
        case .actionButtonNotActiveDTO:
            return CustomButtonDTO.actionButtonNotActiveDTO
        }
    }
}

struct CustomButtonDTO {
    let fontSize: CGFloat
    let fontColor: UIColor
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let borderColor: UIColor
    
    static var primaryButtonDTO: CustomButtonDTO {
        return CustomButtonDTO(backgroundColor: Colors.primaryButton)
    }
    
    static var secondaryButtonDTO: CustomButtonDTO {
        return CustomButtonDTO(backgroundColor: Colors.secondaryButton)
    }
    
    static var actionButtonActiveDTO: CustomButtonDTO {
        return CustomButtonDTO(backgroundColor: Colors.actionButtonActive)
    }
    
    static var actionButtonNotActiveDTO: CustomButtonDTO {
        return CustomButtonDTO(backgroundColor: Colors.actionButtonNotActive)
    }
    
    init(fontSize: CGFloat = 42,
         fontColor: UIColor = Colors.buttonFontColor,
         backgroundColor: UIColor = Colors.primaryButton,
         cornerRadius: CGFloat = 20,
         borderWidth: CGFloat = 3,
         borderColor: UIColor = Colors.buttonBorderColor) {
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
}
