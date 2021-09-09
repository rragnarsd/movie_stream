# MovieStream

## About
- The application is composed by LandingScreen, AuthScreen and BottomNavyScreen, which also has other nested screens. 
- At the top of the Homepage (tab 1), there is a movie trailer which comes from the youtube_package, as well as two rows displaying movies from the API. Each movie has a poster and a title section, and when a user clicks on the desired poster image/title, the data will be sent to another screen. On that screen, the user will see further information on the selected poster.
- At the top of the Explorepage (tab 2), the user has the option to choose from three different movie categories. The body of that page has a Listview.builder that loads data from the API. Each item from the list has a container that displays information from the API as well as an option to add movies to favorites. 
- At the top of the Profilepage (tab 3), there is an Animated Circle that spins around with Transform.rotate. Inside the circle there is an CircleAvatar that displays an image of the user, as well as information about the user.
- In the center the user has the option to click on three different cards that all navigate to other screens. The first is a <em>favorite list</em>, the second a <em>history (watched movies)</em> list and third is a <em>reviews list</em> which will be hard coded dummy text for reviews. Finally at the bottom is a sign out button.

## Packages
- Http - https://pub.dev/packages/http
- Equatable - https://pub.dev/packages/equatable
- Tmdb_api - https://pub.dev/packages/tmdb_api
- Cached_Network_Image - https://pub.dev/packages/cached_network_image
- Bottom_navy_bar - https://pub.dev/packages/bottom_navy_bar
- Youtube_player_flutter - https://pub.dev/packages/youtube_player_flutter
- Provider - https://pub.dev/packages/provider
- Firebase - https://pub.dev/packages/firebase_auth
- Shared_preferences - https://pub.dev/packages/shared_preferences
- Responsive_framework - https://pub.dev/packages/responsive_framework

## New Widgets that I tried
- Futurebuilder... I like this one a lot!<br>
- AnimatedBuilder<br>
- Dismissible widget<br>
- Transform.rotate<br>

 ## I got inspired by these designs
- https://dribbble.com/shots/5529233-Movie-App-Interface-Design-Dark-Theme
- https://dribbble.com/shots/14379133-MoviesWatch-On-Demand-Entertainment-App-Cinema-Tv-Series?utm_source=pinterest&utm_campaign=pinterest_shot&utm_content=MoviesWatch+-+On-Demand+Entertainment+App+%28Cinema%2C+Tv%2C+Series%29&utm_medium=Social_Share<br>

## Design
- The images are from www.unsplash.com

## The color pallette that I used
![image](https://user-images.githubusercontent.com/44742460/132573409-3adc994f-52e1-459c-8675-2a79ab363a8f.png)





## Getting a TMDB API KEY
- This project uses the TMDB API to get the movies. 
- To run this app you need to sign up and register for a API KEY
- https://developers.themoviedb.org/3

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
