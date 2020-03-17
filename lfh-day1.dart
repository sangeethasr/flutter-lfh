class Participant {
  String name;
  List<String> stacks = [];
  bool isMentor;
  DateTime availableTime;

  Participant(String name) {
    this.name = name;
    this.stacks = [];
    this.isMentor = false;
    this.availableTime = null;
  }

  void addStack(String stack) {
    this.stacks.add(stack);
  }

  void setAvailableTime(DateTime availableTime) {
    this.availableTime = availableTime;
  }

  void setMentorOrLearner(bool isMentor) {
    this.isMentor = isMentor;
  }
}

List<Participant> participants = [];

List<Participant> getMentor(String stack, DateTime requiredTime) {
  var filteredList = participants.where((participant) =>
      (participant.isMentor &&
          participant.availableTime == requiredTime &&
          participant.stacks.any((element) => element == stack)));
  return filteredList.toList();
}

void main() {
  var participant = Participant("TestMentor1");
  participant.addStack("Data Science");
  participant.addStack("Web Development");
  participant.setMentorOrLearner(true);
  participant.setAvailableTime(new DateTime.now());
  participants.add(participant);

  var participant3 = Participant("TestMentor2");
  participant3.addStack("Data Science");
  participant3.setMentorOrLearner(true);
  participant3.setAvailableTime(new DateTime.now());
  participants.add(participant3);

  var participant4 = Participant("TestMentor3");
  participant4.addStack("Flutter");
  participant4.addStack("Web Development");
  participant4.setMentorOrLearner(true);
  participant4.setAvailableTime(new DateTime.utc(1989, 11, 9));
  participants.add(participant4);

  var participant2 = Participant("TestLearner1");
  participant2.addStack("Web Development");
  participant2.setMentorOrLearner(false);
  participants.add(participant2);

  var result = getMentor("Web Development", new DateTime.utc(1989, 11, 9));
  for (participant in result) {
    print(participant.name);
  }
}
