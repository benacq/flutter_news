## How it works

This app was structured the app into 3 main sections, namely
1.	Views
2.	Services
3.	Models

The __views__ section has to do with the user interface and design of the app with no business logic.
There are two main views in the app which are the first screen which list the news and the second which provides the details of an individual news when tapped.

The __services__ section provides the backend services such as making API calls to the provided endpoint to fetch the news data.

The __models__ section contains a class that processes and convert JSON data returned by the API get request into a custom Dart object which makes it quite easy the work with within the app.
Inspecting the JSON response from the API I noticed that not all the values were plain text, some were wrapped with html elements, I parsed the html within the app so it can display as it would in a browser.
The JSON response was converted to a stream which constantly listens to changes on the endpoint and reflects immediately inside the app, making the app real-time.

## How it works
When the app is started a GET request is sent to the API endpoint to fetch the news data, a loader is displayed while the user waits for the data, after the data has been retrieved, it is then parsed to a dart Map object which is passed to the News object. The data is then accessed and displayed in the view through the News object.
