//
//  MainButtonView.swift
//  SwiftUI_ReusableViews
//
//  Created by Siddharth sen on 2/12/21.
//

import SwiftUI

enum MainButtonType {
    case primary
    case secondary
    case destructive
    
    var color: Color {
        switch self {
        case .primary:
            return .primaryButtonBackground
        case .secondary:
            return .secondaryButtonBackground
        case .destructive:
            return .destructiveButtonBackground
        }
    }
}



struct MainButtonView: View {
    var title: String
    var type: MainButtonType
    var callback: () -> Void
    
    var body: some View{
        Button(action: {self.callback()}) {
            HStack{
                Spacer()
                Text(title)
                    .font(.body)
                    .foregroundColor(.buttonText)
                    .padding(15)
                Spacer()
            }

        }
        .background(
            RoundedRectangle(cornerRadius: 9)
                .fill(type.color)
        )
        
    }
}

struct MainButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            buttons.colorScheme(.light)
            buttons.colorScheme(.dark)
        }
    }
    
    
    static var buttons: some View {
        VStack(spacing: 20){
            MainButtonView(title: "Got it",type: .primary) {
                print("Got it!!")
            }
            MainButtonView(title: "Clear All",type: .secondary) {
                print("yes cleared")
            }
            MainButtonView(title: "Cancel", type: .destructive) {
                print("Cancel!!")
            }
        }
        .padding(20)
        .background(Color.backgroundColor)
        .previewLayout(.sizeThatFits)
        
    }
}
