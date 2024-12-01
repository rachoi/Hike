import SwiftUI

struct MotionAnimationView: View {
  // MARK: - PROPERTIES
  
  @State private var randomCircle: Int = Int.random(in: 6...12)
  @State private var isAnimating: Bool = false
  
  // MARK: - FUNCTIONS
  
  // 1. RANDOM COORDINATE
  func randomCoordinate() -> CGFloat {
    return CGFloat.random(in: 0...256)
  }
  
  // 2. RANDOM SIZE
  func randomSize() -> CGFloat {
    return CGFloat(Int.random(in: 4...80))
  }
  
  // 3. RANDOM SCALE
  func randomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1...2.0))
  }
  
  // 4. RANDOM SPEED
  func randomSpeed() -> Double {
    return Double.random(in: 0.05...1.0)
  }
  
  // 5. RANDOM DELAY
  func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }
  
  /*
    Breakdown:
    scaleEffect resizes the view along the x and y axis (Stretch or shrink a view)
    We default it to 1 so it doesn't change the sizes initially, but when we start animating, we change it to a random scale to simulate shrinking or stretching

    interpolatingString is an animation effect that allows UI objects to bounce off each other. We also randomize the speed the UI as a result of collision and add a random delay

    TLDR: We initialize the circles in a random position with a random size. Once the view has appeared, we flip isAnimating to true.
    This causes the scale of our circles to be randomized and begin shrinking or becoming bigger to match it (size change animation)
    Because we randomized all the positions of the circles in a certain frame, they collide with each other and start bouncing off each other due to interpolatingString
  */
  var body: some View {
    ZStack {
      ForEach(0...randomCircle, id: \.self) { item in
        Circle()
          .foregroundColor(.white)
          .opacity(0.25)
          .frame(width: randomSize())
          .position(
            x: randomCoordinate(),
            y: randomCoordinate()
          )
          .scaleEffect(isAnimating ? randomScale() : 1)
          .onAppear(perform: {
            withAnimation(
              .interpolatingSpring(stiffness: 0.25, damping: 0.25)
              .repeatForever()
              .speed(randomSpeed())
              .delay(randomDelay())
            ) {
              isAnimating = true
            }
          })
      }
    } //: ZSTACK
    .frame(width: 256, height: 256)
    .mask(Circle()) //Mask defines the visible area of the original view. Essentially, the entire MotionAnimationView will only be displayed within the bounds of a circle
    .drawingGroup() //High performance rendering
  }
}

#Preview {
  MotionAnimationView()
      .background(
        Circle()
          .fill(.teal)
      )
}
