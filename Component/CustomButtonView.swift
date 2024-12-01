import SwiftUI

struct CustomButtonView: View {
  var body: some View {
    ZStack {

      //Creates a circle and fills it with gradient colors from top to bottom in the color ordering
      Circle()
        .fill(
          LinearGradient(
            colors: [
              .white,
                .customGreenLight,
                .customGreenMedium],
            startPoint: .top,
            endPoint: .bottom)
        )
      
      //Layer for an outline circle. For some reason, we can't chain fill and stroke so we do it with two circle
      Circle()
        .stroke(
          LinearGradient(
            colors: [
              .customGrayLight,
              .customGrayMedium],
            startPoint: .top,
            endPoint: .bottom),
          lineWidth: 4)
      
      Image(systemName: "figure.hiking")
        .fontWeight(.black)
        .font(.system(size: 30))
        .foregroundStyle(
          LinearGradient(
            colors: [
              .customGrayLight,
              .customGrayMedium],
            startPoint: .top,
            endPoint: .bottom)
        )
    } //: ZSTACK
    .frame(width: 58, height: 58)
  }
}

#Preview {
  CustomButtonView()
      .previewLayout(.sizeThatFits)
      .padding()
}
