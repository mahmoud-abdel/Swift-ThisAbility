import SwiftUI

struct ScolInfoView: View {
    @Binding var showScolInfo: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: { 
                        showScolInfo = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                    .padding(5)
                }
                Spacer()
            }
            
            VStack {
                InfoHeading(text: "Scoliosis")
                InfoText(text: "Scoliosis is a condition characterized by an obnormal curvature of the spine, often appearing as a 'C' or 'S' shape. It can often cause pain, limited mobility, and breathing difficulties. While scoliosis may limit some physical activities, staying active can help improve posture, flexibility, and overall spinal health")
                InfoSub(text: "Resistance Exercise Considerations")
                InfoText(text: "Generally, individuals with scoliosis should avoid exercises that requie a lot of twisting or bending of the spine, such as heavy deadlifts or barbell rows. On the flip side, these individuals should focus on exercises that support the spine such as planks and side-planks. Lastly, incorporating unilateral exercises to address any muscular imbalances caused by the curvature of the spine")
                InfoSub(text: "Aerobic Exercise Considerations")
                InfoText(text: "A big key for scoliosis is choosing low-impact exercises like walking, swimming, and cycling to reduce the overall load on the spine. Running on un-even terrain for example, may lead to twisting and jarring of the spine. Individuals should try to focus on maintaining great posture throughout the aerobic workout to minimize pain, discomfort, and injury")
                
            }
            .multilineTextAlignment(.leading)
        }
        .background(MyColors.denim)
        
    }
}