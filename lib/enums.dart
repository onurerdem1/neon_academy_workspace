import 'dart:developer';

enum Team {
  FlutterDeverloperTeam,
  AndroidDeveloperTeam,
  IosDeveloperTeam,
  UIUXDesignerTeam
}

class NeonAcademyMember {
  String fullName;
  String title;
  String horoscope;
  String memberLevel;
  String homeTown;
  int age;
  Team team;
  ContactInformation contactInformation;

  NeonAcademyMember(this.fullName, this.age, this.homeTown, this.horoscope,
      this.memberLevel, this.title, this.team, this.contactInformation);

  String toString() {
    return "NeonAcademyMember(name : $fullName, age : $age, homeTown : $homeTown, horoscope : $horoscope, memberLevel : $memberLevel, title : $title, contactInformation : $contactInformation)";
  }
}

class ContactInformation {
  String phoneNumber;
  String email;
  ContactInformation(this.phoneNumber, this.email);

  String toString() {
    return "Contact(phoneNumber : $phoneNumber,email : $email)";
  }
}

class Mentor extends NeonAcademyMember {
  String mentorLevel;

  Mentor(
      String fullName,
      String title,
      String horoscope,
      String memberLevel,
      String homeTown,
      int age,
      Team team,
      ContactInformation contactInformation,
      this.mentorLevel)
      : super(fullName, age, homeTown, horoscope, memberLevel, title, team,
            contactInformation);

  String toString() {
    return "NeonAcademyMember(name : $fullName, age : $age, homeTown : $homeTown, horoscope : $horoscope, memberLevel : $memberLevel, title : $title, contactInformation : $contactInformation,mentorLevel : $mentorLevel)";
  }
}

void main() {
  var neonAcademyMembers = [
    NeonAcademyMember(
        "Onur",
        23,
        "İstanbul",
        "Terazi",
        "A1",
        "Flutter Developer",
        Team.FlutterDeverloperTeam,
        ContactInformation("05524879515", "onure@gmail.com")),
    NeonAcademyMember(
        "Yusuf",
        20,
        "İstanbul",
        "Boğa",
        "A3",
        "Flutter Developer",
        Team.AndroidDeveloperTeam,
        ContactInformation("05487415898", "yusuf1@gmail.com")),
    NeonAcademyMember(
        "Burak",
        22,
        "İstanbul",
        "Aslan",
        "A2",
        "Flutter Developer",
        Team.IosDeveloperTeam,
        ContactInformation("05874521645", "burakk@gmail.com")),
    NeonAcademyMember(
        "Selim",
        25,
        "İstanbul",
        "Oğlak",
        "A4",
        "Flutter Developer",
        Team.AndroidDeveloperTeam,
        ContactInformation("05442547896", "selim@gmail.com")),
    NeonAcademyMember(
      "Ayşe",
      23,
      "İstanbul",
      "Aslan",
      "B2",
      "UI/UX Designer",
      Team.UIUXDesignerTeam,
      ContactInformation("05361234567", "ayse.designer@gmail.com"),
    ),
    NeonAcademyMember(
      "Mert",
      28,
      "Ankara",
      "Oğlak",
      "C3",
      "UI/UX Designer",
      Team.UIUXDesignerTeam,
      ContactInformation("05031234567", "mert.dev@gmail.com"),
    ),
    NeonAcademyMember(
      "Zehra",
      22,
      "İzmir",
      "Terazi",
      "A1",
      "Data Analyst",
      Team.IosDeveloperTeam,
      ContactInformation("05551234567", "zehra.data@gmail.com"),
    ),
    NeonAcademyMember(
      "Ahmet",
      30,
      "Bursa",
      "Koç",
      "B4",
      "Flutter Developer",
      Team.AndroidDeveloperTeam,
      ContactInformation("05461234567", "ahmet.flutter@gmail.com"),
    ),
    NeonAcademyMember(
      "Elif",
      26,
      "Antalya",
      "Koç",
      "A2",
      "Product Manager",
      Team.FlutterDeverloperTeam,
      ContactInformation("05341234567", "elif.pm@gmail.com"),
    ),
  ];
//Create a new array that contains only the members of the Flutter Development Team and print out their full names
  var flutterDeveloperTeam = neonAcademyMembers
      .where((members) => members.team == Team.FlutterDeverloperTeam)
      .toList();
  for (var members in flutterDeveloperTeam) {
    print(members.fullName);
  }

  print("--------------");

//Create a dictionary that contains the number of members in each team, and print out the number of members in the UI/UX Design Team.
  var teamNumbers = Map();
  neonAcademyMembers.forEach((element) {
    if (!teamNumbers.containsKey(element.team)) {
      teamNumbers[element.team] = 1;
    } else {
      teamNumbers[element.team] += 1;
    }
  });
  print(teamNumbers[Team.UIUXDesignerTeam]);
  print("--------------------");

//Create a function that takes a team as an input and prints out the full names of all members in that team
  void printTeam(Team team) {
    neonAcademyMembers
        .where((member) => member.team == team)
        .forEach((element) => print(element.fullName));
  }

  printTeam(Team.FlutterDeverloperTeam);
  print("------------------");

//Create a switch statement that performs different actions based on the team of a member.
// For example, if a member is in the Flutter Development Team, the function could print out
//"This member is a skilled Flutter developer", and if the member is in the UI/UX Design Team, the function could print out "This member is a talented designer".
  void teamMember(NeonAcademyMember member) {
    switch (member.team) {
      case Team.FlutterDeverloperTeam:
        print("This member is a skilled flutter developer");
        break;
      case Team.AndroidDeveloperTeam:
        print("This member is a skilled android developer");
        break;
      case Team.IosDeveloperTeam:
        print("This member is a talented ios developer");
        break;
      case Team.UIUXDesignerTeam:
        print("This member is a talented designer");
        break;
    }
  }

//Create a function that takes an age as an input and prints out the full names of all
//members that are older than that age and belong to a specific team (Flutter Development Team for example)
  void findOlder(int age) {
    neonAcademyMembers
        .where((member) => member.age > age)
        .forEach((element) => print("${element.age},${element.team}"));
  }

  findOlder(24);
  print("----------------");

//Create a switch statement that gives a promotion to a member based on their team. For example, if a member is in the Flutter Development Team, the function could promote them to "Senior Flutter Developer" and
//if the member is in the UI/UX Design Team, the function could promote them to "Lead Designer".

  void teamPromote(NeonAcademyMember member) {
    switch (member.team) {
      case Team.FlutterDeverloperTeam:
        print("Senior Flutter Developer");
        break;
      case Team.AndroidDeveloperTeam:
        print("Senior Android Developer");
        break;
      case Team.IosDeveloperTeam:
        print("Senior Ios Developer");
        break;
      case Team.UIUXDesignerTeam:
        print("Lead Designer");
        break;
    }
  }

  teamPromote(neonAcademyMembers.last);
  print("----------------");

//Create a function that takes a team as an input and calculates the average age of the members in that team.

  void calculateAge(Team team) {
    var toplam = 0;
    var kisi = 0;
    var members =
        neonAcademyMembers.where((member) => member.team == team).toList();
    for (var member in members) {
      toplam += member.age;
      kisi++;
    }
    print("Average Age : ${toplam / kisi}");
  }

  calculateAge(Team.AndroidDeveloperTeam);
  print("----------------------");

//Create a switch statement that prints out a different message for each team, such as "The Flutter Development Team is the backbone of our
//academy" for the Flutter Development Team and "The UI/UX Design Team is the face of our academy" for the UI/UX Design Team.
  void teamMessage(Team team) {
    switch (team) {
      case Team.FlutterDeverloperTeam:
        print("The Flutter Development Team is the backbone of our academy");
        break;
      case Team.AndroidDeveloperTeam:
        print("The Android Development Team is the key of our academy");
        break;
      case Team.IosDeveloperTeam:
        print("The Ios Development Team is the efficent team of our academy");
        break;
      case Team.UIUXDesignerTeam:
        print("The UI/UX Design Team is the face of our academy");
        break;
    }
  }

  teamMessage(Team.AndroidDeveloperTeam);
  print("---------------");

//Create a function that takes a team as an input and returns an array of the contact information of all members in that team.
  void printTeamMembers(Team team) {
    neonAcademyMembers
        .where((member) => member.team == team)
        .forEach((element) => print(element.contactInformation));
  }

  printTeamMembers(Team.FlutterDeverloperTeam);
  print("-------------");

//Create a switch statement that performs different actions based on the team of a member and their age.
// For example, if a member is in the Flutter Development Team and is over 23 years old, the function could print out
// "XXX member is a seasoned Flutter developer", and if the member is in the UI/UX Design Team and is under 24,
// the function could print out "XXX member is a rising star in the design world".
  void performAction(NeonAcademyMember member) {
    switch (member.team) {
      case Team.FlutterDeverloperTeam:
        if (member.age > 23) {
          print("${member.fullName} is a seasoned Flutter Developer");
        } else {
          print("${member.fullName} is a junior Flutter Developer");
        }
      case Team.AndroidDeveloperTeam:
        if (member.age > 23) {
          print("${member.fullName} is a seasoned Android Developer");
        } else {
          print("${member.fullName} is a junior Android Developer");
        }
        break;
      case Team.IosDeveloperTeam:
        if (member.age > 23) {
          print("${member.fullName} is a seasoned Ios Developer");
        } else {
          print("${member.fullName} is a junior Ios Developer");
        }
        break;
      case Team.UIUXDesignerTeam:
        if (member.age > 23) {
          print("${member.fullName} is a seasoned UI/UX Designer");
        } else {
          print("${member.fullName} is a rising UI/UX Designer");
        }
        break;
    }
  }

  performAction(neonAcademyMembers.first);
}
