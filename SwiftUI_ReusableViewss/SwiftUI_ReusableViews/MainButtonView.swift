//
//  MainButtonView.swift
//  SwiftUI_ReusableViews
//
//  Created by Siddharth sen on 2/12/21.
//

import SwiftUI

enum MainButtonType {
    case primary(withArrow: Bool)
    case secondary(withArrow: Bool)
    case destructive(withArrow: Bool)
    
    var hasArrow: Bool {
        switch self {
        case .primary(let hasArrow),
             .secondary(let hasArrow),
             .destructive(let hasArrow):
            return hasArrow
        }
    }
    
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
    private struct Sizekey: PreferenceKey{
        // Combine values from multiple children of the view to one value (eg here CGSize)
        static func reduce(value: inout CGSize?, nextValue: () -> CGSize?) {
            value = value ?? nextValue()
        }
    }
    
    
    var title: String
    var type: MainButtonType
    var callback: () -> Void
    @State private var height: CGFloat?
    
    
    var body: some View{
        Button(action: {self.callback()}) {
            ZStack(alignment: .center){
                HStack{
                    Spacer()
                    Text(title)
                        .font(.body)
                        .foregroundColor(.buttonText)
                        .padding(15)
                        .background(
                            GeometryReader { proxy in
                                Color.clear.preference(key: Sizekey.self, value: proxy.size)
                            })
                    
                    Spacer()
                }
                if type.hasArrow {
                HStack{
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(Font.system(size: 14, weight: .bold))
                        .foregroundColor(type.color)
                        .frame(width: height, height: height)
                        .background(Color.white.cornerRadius(9).padding(12))
                }
                }
            }


        }
        .frame(height: height)
        .background(RoundedRectangle(cornerRadius: 9).fill(type.color))
        .onPreferenceChange(Sizekey.self){ size in
            self.height = size?.height
        }
        
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
            MainButtonView(title: "Got it",type: .primary(withArrow: true)) {
                print("Got it!!")
            }
            MainButtonView(title: "Clear All",type: .secondary(withArrow: true)) {
                print("yes cleared")
            }
            MainButtonView(title: "Cancel", type: .destructive(withArrow: false)) {
                print("Cancel!!")
            }
        }
        .padding(20)
        .background(Color.backgroundColor)
        .previewLayout(.sizeThatFits)
        
    }
}
