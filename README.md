# About my project

First, about my project structure, it's a easy architecture and as need to be, any one can easy know about, let me show:

Top Hierarqui, all need be create inside this top folder:

- Infraestructure -> This is where all the common and direct "connect" to the project files need to be;
- ViewController  -> Here will come all the ViewController it self, and we follow the rule lead by navigation hierarchy, so, if we have a HomeViewController and a 
LoginViewController we will create a folder for each one, we will use this principle to all our layers, so if developer need navigate through it's easy to find and
maintain;
- View 		  -> Here is our View layer, each ViewController will have their own View, so all view stuffs will be put here; 
- Manager		-> Here is the layer that work like a "proxy" to our Business class, one of advantage is, if we want from some point change all our business methods to something Asynchronous it's just inherit from NSOperation and done, it's easy, and of course we create a "contract" to all our business logic;
- Business       -> It's our business layer, all logic need to be put in here, if possible using protocols, one of most advantage is testing and off course, more clean code, easy to maintain, so, any developer if need do any maintenance they will always know where to find, easy no?!
- Provider       -> Here is the layer that will do any request / connection, so for a api our if try access any inside database, here we do not manipulate any data, need just take the data and send back to our Business, it's dummy, so as you will see if we want change for example from our "mock" response to a real server it's very easy, and off course, test easy.
- Model          -> As the name say it's for our models.

Important, to maintain our "contract" one view controller will be the only one permit to talk with one Manager -> Business -> Provider, never a provider will talk / respond to other Provider, and the same for business and manager, why that?
There's is no architecture to rule them all, but this is the best approach to guarantee our single responsability, easy test and so one.

Easy no? This is how our code is, so after know those principles any developer can start manage, do their job easy withou need a hug line of learning.

I did not do many tests as because i do not have much time but did some for show how easy is to test this architecture.

Best hope good news.

Felipe Garcia

