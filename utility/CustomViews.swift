import SwiftUI

struct InfoHeading: View {
    var text: String

    var body: some View {
        Text(text)
            .foregroundColor(MyColors.neonBlue)
            .font(.custom("Menlo", size: 28))
            .fontWeight(.bold)
            .padding(20)
            .multilineTextAlignment(.center)
    }    
}

struct InfoSub: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.custom("Menlo", size: 20))
            .fontWeight(.bold)
    }
}

struct InfoText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.custom("Menlo", size: 15))
            .padding()
    }
}


struct Title: View {
    var text: String

    var body: some View {
        Text(text)
            .foregroundColor(MyColors.neonBlue)
            .font(.custom("Menlo", size: 28))
            .fontWeight(.bold) 
            .padding(30)
            .background(MyColors.spaceGrey).border(Color.white, width: 6)
            .cornerRadius(10)
            .multilineTextAlignment(.center)
            .padding(20) 
    }    
}

struct SubTitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(MyColors.neonBlue)
            .font(.custom("Menlo", size: 20))
            .fontWeight(.bold) 
            .padding(22) 
            .background(MyColors.spaceGrey).border(Color.white, width: 6)
            .cornerRadius(10)
            .multilineTextAlignment(.center)
            .padding(15) 
    }    
}

struct Day: View {
    var text: String 
    
    var body: some View {
        Text(text)
            .foregroundColor(MyColors.neonBlue)
            .font(.custom("Menlo", size: 30))
    }
}

struct NavigateText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding(20)
    }
} 

struct AerobicChoice: View {
    let displayName: String
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View { 
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(isSelected ? .orange : MyColors.spaceGrey)
            .frame(width: 100, height: 80)
            .overlay(
                VStack {
                    Text(displayName)
                        .foregroundColor(.white)
                }
            )
            .border(Color.white, width: 2)
            .cornerRadius(10)
            .onTapGesture {
                onTap()
            }
            .padding()
    }
}

struct ResistanceChoice: View {
    let displayName: String
    let toCompare: String
    let equipment: String
    let onTap: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(equipment == toCompare ? .orange : MyColors.spaceGrey) 
            .frame(width: 130, height: 80)
            .overlay(
                VStack {
                    Text(displayName) 
                        .foregroundColor(.white)
                }
            )
            .border(Color.white, width: 2)
            .cornerRadius(10)
            .onTapGesture {
                onTap()
            }
            .padding()
            .multilineTextAlignment(.center) 
    }
}

struct ConditionChoice: View {
    let displayName: String
    let toCompare: String
    let equipment: String
    let onTap: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(equipment == toCompare ? .orange : MyColors.spaceGrey) 
            .frame(width: 130, height: 80)
            .overlay(
                VStack {
                    Text(displayName) 
                        .foregroundColor(.white)
                }
            )
            .border(Color.white, width: 2)
            .cornerRadius(10)
            .onTapGesture {
                onTap()
            }
            .padding()
    }
}

//struct CustomStepper: View {
//    @Binding var value: Int 
//    
//    var body: some View {
//        Stepper("", value: $value) {_ in 
//            // Increment button
//            Image(systemName: "plus")
//                .frame(width: 30, height: 30) 
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(8)
//                .padding(.trailing, 20)
//            
//            // Value text
//            Text("\(value)")
//                .font(.title)
//                .frame(width: 50)
//                .multilineTextAlignment(.center)
//            
//            // Decrement button
//            Image(systemName: "minus")
//                .frame(width: 30, height: 30)
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(8)
//                .padding(.leading, 20)
//        }
//    }
//}