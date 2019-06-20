class ChatModel
{
  final String name;
  String message;
  final String time;
  final String imageUrl;

  ChatModel({this.name, this.message, this.time, this.imageUrl});
}

List<ChatModel> messageData = [
   new ChatModel(
     name: "Martin Fowler",
     message: "Hola como estas?",
      time: "15:30",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Martin_Fowler_%282008%29.jpg/1200px-Martin_Fowler_%282008%29.jpg"),
  new ChatModel(
      name: "Linux tolvar",
      message: "Me encanta flutter!",
      time: "17:30",
      imageUrl:  
          "https://avatars0.githubusercontent.com/u/1024025?s=460&v=4"),
  new ChatModel(
      name: "Steve Wozniak",
      message: "Wassup !",
      time: "5:00",
      imageUrl:
          "https://www.nbforum.com/app/uploads/Steve-Wozniak-fix-600x722.jpg"),
  new ChatModel(
      name: "Robert martin",
      message: "bye!",
      time: "10:30",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Robert_Cecil_Martin.png/220px-Robert_Cecil_Martin.png"),
  new ChatModel(
      name: "Dennis Ritchie",
      message: "Nos vemos más tarde",
      time: "12:30",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Dennis_Ritchie_2011.jpg/220px-Dennis_Ritchie_2011.jpg"
          ),
  new ChatModel(
      name: "Paul hudson",
      message: "buenos días",
      time: "15:30",
      imageUrl:
          "https://pbs.twimg.com/profile_images/959170433110237186/h-6Whguj_400x400.jpg"
          ),
];
