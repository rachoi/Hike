import SwiftUI

struct CardView: View {
  // MARK: - PROPERTIES
  
  @State private var imageNumber: Int = 1
  @State private var randomNumber: Int = 1
  @State private var isShowingSheet: Bool = false
  
  // MARK: - FUNCTIONS
  
  func randomImage() {
    //Generate random number until they are not matching the previously used number to make sure we have a new image
    repeat {
      randomNumber = Int.random(in: 1...5)
    } while randomNumber == imageNumber
    
    imageNumber = randomNumber
  }
  
  var body: some View {
    // MARK: - CARD
    
    ZStack {
      CustomBackgroundView()
      
      VStack {
        // MARK: - HEADER
        
        VStack(alignment: .leading) {
          HStack {
            Text("Hiking")
              .fontWeight(.black)
              .font(.system(size: 52))
              .foregroundStyle(
                LinearGradient(
                  colors: [
                    .customGrayLight,
                    .customGrayMedium],
                  startPoint: .top,
                  endPoint: .bottom)
              )
            
            Spacer()
            
            Button {
              // ACTION: Show a Sheet
              print("The button was pressed.")
              isShowingSheet.toggle()
            } label: {
              CustomButtonView()
            }
            .sheet(isPresented: $isShowingSheet) {
              SettingsView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium, .large]) //Makes it so the bottom sheet defaults to medium size of the screen first, then allows us to drag it up
            }
          }
          
          Text("Fun and enjoyable outdoor activity for friends and families.")
            .multilineTextAlignment(.leading)
            .italic()
            .foregroundColor(.customGrayMedium)
        } //: HEADER
        .padding(.horizontal, 30)
        
        // MARK: - MAIN CONTENT
        
        ZStack {
          CustomCircleView()
          
          Image("image-\(imageNumber)")
            .resizable()
            .scaledToFit()
            .animation(.default, value: imageNumber) //animation triggered when image number is changed
        }
        
        // MARK: - FOOTER
        
        Button {
          // ACTION: Generate a random number
          
          randomImage()
        } label: {
          Text("Explore More")
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundStyle(
              LinearGradient(
                colors: [
                  .customGreenLight,
                  .customGreenMedium
                ],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
        }
        .buttonStyle(GradientButton())
      } //: ZSTACK
    } //: CARD
    .frame(width: 320, height: 570)
  }
}

#Preview {
  CardView()
}
