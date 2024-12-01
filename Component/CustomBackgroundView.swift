import SwiftUI

struct CustomBackgroundView: View {
  /*
      Creating a 3d look by layering the background colors on top of each other

      Offset of the colors help create the 3d look
  */
  var body: some View {
    ZStack {
      // MARK: - 3. DEPTH
      
      Color.customGreenDark
        .cornerRadius(40)
        .offset(y: 12)
      
      // MARK: - 2. LIGHT
      
      Color.customGreenLight
        .cornerRadius(40)
        .offset(y: 3)
        .opacity(0.85)
      
      // MARK: - 1. SURFACE
      
      //We can utilize the property version of the extension version we created to access colors
      LinearGradient(
        colors: [
          .customGreenLight,
          Color.customGreenMedium],
        startPoint: .top,
        endPoint: .bottom
      )
      .cornerRadius(40)
    }
  }
}

#Preview {
  CustomBackgroundView()
      .padding()
}
