# AstroTest

Project Info
+ Xcode version: 8.3.3
+ Language: Swift 3.0
+ Support devices: iPhone(Portrait)
+ Support versions: at least iOS 9.0

Structure of project
+ Project build follow by MVC pattern
+ Build UI using combine both xib file & storyboard
+ Directory sort by Alphabet

*** Main directory:
1. Controllers: all controllers inherit from BaseViewController
- SlideMenuViewController: simple slide menu build by my self(left: MenuViewController, right: HomeViewController)
- MenuViewController: show list items
- HomeViewController: show & sort favorites channel from local data.
- ChannelsListViewController: show & sort list channels list. 
- ChannelDetailViewController: show channels infor in the future:d
- LoginViewController: implement login via facebook/google+
- TVGuideViewController: show current TVGuide & sort

2. Models: all model inherit from BaseObject
+ Menu: menu model with simple property(title, type)
+ Channel: property map & parse model from return data
+ TVGuide: property map & parse model from return data
+ SortChannel: class methods support sort(number, name, favorites)

+ DataManager: parent class of DataManager
- LocalDataManager: inherit from store DataManager. It's override methods from parent class to store local database(channel object) using UserDefaults.
- LocalDataManager: inherit from store DataManager. It's override methods from parent class to store database(JSON channel) to Firebase cloud.
- AWSDataManager: inherit from store DataManager. It's override methods from parent class to store database(JSON channel) to AWS cloud in the future:d

+ Request: build by my self
- API: define constant URL server, path URL request to 

Request client:
- Request: support request methods(GET, POST), execute request with request detail.
- ChannelsRequest: responsibility for get data belong to channels(get channels list, get channel detail, etc...)
- TVGuideRequest: responsibility for get data belong to TVGuide(get current show, etc...)
- UserRequest: responsibility for get data belong to User(like as: logout, login, etc..)

Request detail:
- RequestDetail: responsibility for create new NSMutableURLRequest. It's include: params, urlRequest(NSMutableURLRequest), baseURL, fullURL, request methods.

Request params:
- ChannelParams: format & return params for Channel request
- TVGuideParams: format & return params for TVGuide request

Note: consider to create parse data class for Channel/TVGuide in the future also

3. Views: all views inherit from BaseView
- Custom views: all custom views in project build by my self and don't use any third pary(CollectionView, CollectionViewCell TableView, TableViewCell, LoadingView, TVGuideDateView)

4. Extensions: store class extensions
- UIViewController: public method to get SlideMenuViewController instance from all UIViewController.

5. Libs: store third party library
- Firebase framework: setup and install via CocoaPods
- Facebook framework
- Google+

6. Resources: store local resources(example: font, data...)


QUESTIONS & ANSWERS

1. Please describe your experience on an ecommerce platform and the technologies associated
with building an ecommerce platform.

+ I had experience in E-commerce platform, in my previous project it's MemeApp project. It's a market online on mobile for buying and selling quality lifestyle items that fit every budget. We build native app used objective language for iOS & java for android because it will be easy to exten & best for user experience. The backend we have public api used PHP language and we worked with together. 

2. What are the key components required for an E-commerce platform and the key challenges
for building an E-commerce platform?
+ I think the key com
+ In previous project we have problem when app have a lot of user the request & response will be take a lot of time. So i think there are scale, maintain and security.

3. Please describe your experience with and understanding of cloud based services and
solutions.

+ Cloud base services we will save a lot of time to setup and it will be good for scale application & maintain when we have a lot of user. The best thing it think it's security we have a good solution to protect database. Example: Firebase database cloud service, I used it in test technical it's simple to setup & store database to cloud. It have many solutions that solve a lot of problem of developer: authentication, push notification, realtime database...

4. What benefits does cloud platform provide and how it will benefit a business critical
application which requires a zero downtime and faster response time?

+ As i know it will be good for scale application.

5. Describe your experience with CI / CD and source control tools?

+ In previous experience i worked with JIRA I setup get code from the GIT repository & schedule build automatically.
+ I'm familiar with GIT & SVN source control tools.

6. What is agile methodologies? Share your views and experience on it and how it can benefit
in a development cycle.

- We used JIRA to manage tasks & confluent to document. HipCHat

7. How do you keep up-to-date with the latest developer trends and new technologies?


8. How do you participate in a team and what are the processes and methodologies you use in
your job to successfully deliver a project?

+ I used SCRUM to manage project. I had more than 3 years experience in SCRUM. We have product owner, developer, scrum master in SCRUM. We defined user story, break down task, sprint backlog together. Every sprint we choose tasks from product backlog, sprint planning & estimate by playing planning poker then add task to JIRA. When member choose task from JIRA they need to assign to them, by the end of day the member should be update task on JIRA. Every day we have a stand up daily meeting together, it takes 5 minutes. Every member will report which task did yesterday, which task will be do today and do they have problem? We always do daily meeting on time & don't wait anybody. End of sprint we have do sprint review & show result to PO & retrospective together so we will be improve quality every sprint.

9. What is the process/tools needed to improve software quality? How would you setup a
culture that values software quality?


10. You are in a design review, and see a major flaw in the design. Has this ever happened? How
do you bring it up? What happens if the presenter refuses to listen to your points? How do
you make sure that the right system is built?



11. The production system is running on top of MongoDB and it is having issues that seem to be
within the DB itself. How do you advise the team? How do you manage those issues and
the impact to the new development work? How do you communicate this to non-technical
people?

+ As a developer role I will talk to team directly that responsible for this issues, i will try to explain what i know about this problem. For non-technical people i find the simple way to explain, i can write down & draw in table.

12. What attracts you to this opportunity and what makes you the ideal candidate?

+ I'm honest, hard working and responsible for my job. 
