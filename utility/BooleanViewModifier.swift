import SwiftUI

struct BooleanViewModifier: ViewModifier {
    @Binding var condition: Bool
    
    func body(content: Content) -> some View {
        if condition {
            content
        }
    }
}

extension View {
    func onlyIf(_ condition: Binding<Bool>) -> some View {
        modifier(BooleanViewModifier(condition: condition))
    }
}