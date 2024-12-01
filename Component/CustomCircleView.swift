import SwiftUI

struct CustomCircleView: View {
  @State private var isAnimateGradient: Bool = false
  
  var body: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient(
            colors: [
              .customIndigoMedium,
              .customSalmonLight
            ],
            startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
            endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
          )
        )
        .onAppear {
          //When the circle view appears on the screen, we trigger the changes below

          //animates any UI changes we are making. We toggle the flag everytime the changes are done. They take 3 seconds to be done and it repeats forever. 
          //The gardient color is dependent on the things above
          withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
            isAnimateGradient.toggle()
          }
        }
      
      MotionAnimationView()
    } //: ZSTACK
    .frame(width: 256, height: 256)
  }
}

#Preview {
  CustomCircleView()
}
