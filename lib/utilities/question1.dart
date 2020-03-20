class Question{
  String question;
  Question1Card option1;
  Question1Card option2;
  Question1Card option3;
  String answer;
  Question({this.question, this.option1, this.option2, this.option3, this.answer});

}

class Question1Card{
  String optionName;
  String imgURL;
  Question1Card({this.optionName, this.imgURL});
}