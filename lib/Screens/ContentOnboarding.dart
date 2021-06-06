class ContentOnboarding {
  String image;
  String title;
  String discription;

  ContentOnboarding({required this.image,required this.title, required this.discription});
}

/////// Mockups Onboarding Content 
List<ContentOnboarding> contentsOnboard = [
  ContentOnboarding(
    title: 'Brand Recognition',
    //// check asset folder to find this image url
    image: "assets/images/Gauge.svg",
    discription: "Boost your brand recognition with each click. "
                  " Generic links don't mean a thing. Branded links help "
                  "install confidence in your content"
  ),
  ContentOnboarding(
    title: 'Detailed Records',
    image: "assets/images/tools.svg",
    discription: "Gain insights into who is clicking your links. "
    "Knowing when and where people engaging with your content "
    "helps inform better decisions."
  ),
  ContentOnboarding(
    title: 'Fully Customizable',
    image: "assets/images/Gauge.svg",
    discription: "Improve brank awareness and content discoverability "
    "through customizable links, , "
    "supercharging audiance engagement"
  ),
];
