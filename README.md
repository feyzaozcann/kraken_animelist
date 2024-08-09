# Kraken AnimeList

Hey there! Welcome to the Kraken AnimeList project. This is a Flutter app that fetches data from an external API and lists anime movies with their details.

### Project Structure 

Architecture: Clean Architecture with feature-first organization.<br/>
State Management: Bloc for state management.<br/>
Dependency Injection: Managed using GetIt.<br/>
API Service: Handled by Chopper.<br/>
Testing: Unit and widget tests are in place, with plans for further tests.<br/>
<br/>
First off, I created the entities that represents the API response. Then, I built a movie model that fit what the app needed. To connect it all, I created a mapper class, which was essential for transforming the raw API data into the model used by the app. I also set up a system to manage different outcomes of my network requests, like success or failure, so I always knew what was happening. In the domain layer, I defined the core business logic with interfaces guiding how everything worked together, while in the data layer, I implemented how the app interacted with data sources and managed repositories. Lastly, I designed the interface. 
 


### Features 
Anime List: View a paginated list of anime movies, complete with images, titles, and rating scores. <br/>
Anime Details: Access detailed information for each anime, including the title, synopsis, rating, genres, episode count, and character details. 



### Design 

![Untitled design](https://github.com/user-attachments/assets/f1af5885-a0e2-4435-a9aa-9e6fc0d2b857)




This project is a work in progress and will continue to evolve!


