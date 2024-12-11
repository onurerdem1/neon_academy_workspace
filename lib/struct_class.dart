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

//Delete the 3rd member
  neonAcademyMembers.removeAt(2);
  for (var member in neonAcademyMembers) {
    print(member);
  }

  print("---------------------------");

//Rank the members according to their ages largest to smallest
  neonAcademyMembers.sort(
    (a, b) => b.age.compareTo(a.age),
  );
  for (var member in neonAcademyMembers) {
    print(member);
  }
  print("---------------------------");

//Sort the members according to their names (Z-A)
  neonAcademyMembers.sort((a, b) => b.fullName.compareTo(a.fullName));
  for (var member in neonAcademyMembers) {
    print(member);
  }
  print("---------------------------");

//Filter the members of the Academy who are older than 24 and transfer them to a new array. Print the names of the members in this array.
  List<NeonAcademyMember> neonAcademyMembersOlder =
      neonAcademyMembers.where((members) => members.age > 24).toList();
  for (var olderMember in neonAcademyMembersOlder) {
    print(olderMember.fullName);
  }
  print("---------------------------");
//Print the total number of Flutter Developers
  int flutterDeveloperNumber = neonAcademyMembers
      .where((members) => members.title == "Flutter Developer")
      .length;
  print(flutterDeveloperNumber);
  print("---------------------------");

//Find which index you come across in the array and print it
  int index = neonAcademyMembers.indexWhere(
    (element) => element.fullName == "Onur",
  );
  print(index);

  print("---------------------------");
//Add a new member to the array, who is a mentor of the academy and has a special property "mentorLevel"
// indicating their level of experience. Print out the full names of all members after adding the new member.
  var mentor = Mentor(
      "Gökhan",
      "Flutter Developer",
      "Aslan",
      "D1",
      "Ankara",
      40,
      Team.FlutterDeverloperTeam,
      ContactInformation("05478963214", "gokhan.mentor@gmail.com"),
      "Expert");
  neonAcademyMembers.add(mentor);
  for (var member in neonAcademyMembers) {
    print(member.fullName);
  }
  print("---------------------------");

//Remove all members who have a specific memberLevel, for example, "A1", and print out the remaining members' full names
  neonAcademyMembers.removeWhere(
    (element) => element.memberLevel == "A1",
  );
  for (var member in neonAcademyMembers) {
    print(member.fullName);
  }
  print("---------------------------");

//Find the member with the highest age and print out their full name and age
  NeonAcademyMember enYasli =
      neonAcademyMembers.reduce((a, b) => a.age > b.age ? a : b);
  print("${enYasli.fullName} , ${enYasli.age}");
  print("---------------------------");

//Find the member with the longest name and print out their full name and the length of their name
  NeonAcademyMember enUzunIsimli = neonAcademyMembers
      .reduce((a, b) => a.fullName.length > b.fullName.length ? a : b);
  print("${enUzunIsimli.fullName} , ${enUzunIsimli.fullName.length}");

  print("------------------------");

//Find all members who have the same horoscope sign and group them together in a new array.
// Print out the full names of members in this new array

  Map<String, List<String>> groupByHoroscope = {};

  for (var member in neonAcademyMembers) {
    if (!groupByHoroscope.containsKey(member.horoscope)) {
      groupByHoroscope[member.horoscope] = [];
    }
    groupByHoroscope[member.horoscope]!.add(member.fullName);
  }

  groupByHoroscope.forEach((horoscope, members) {
    print("Horoscope : $horoscope");
    print("Members : ${members.join(", ")}");
  });

  print("---------------------------");

//Find the most common hometown among the members and print out the name of the town.
  var mapTown = Map();
  neonAcademyMembers.forEach((element) {
    if (!mapTown.containsKey(element.homeTown)) {
      mapTown[element.homeTown] = 1;
    } else {
      mapTown[element.homeTown] += 1;
    }
  });
  List sortedKeys = mapTown.keys.toList();
  print(sortedKeys[0]);
  print("-----------------------");

//Find the average age of all members and print out the result.
  double averageAge =
      neonAcademyMembers.fold(0, (sum, member) => sum + member.age) /
          neonAcademyMembers.length;
  print(averageAge);
  print("------------------");

//Create a new array that contains only the contact information of the members,
//and print out the email addresses of all members in this new array.
  var contactList =
      neonAcademyMembers.map((members) => members.contactInformation);
  for (var member in contactList) {
    print(member.email);
  }
  print("-------------------");

//Sort the members according to their memberLevel (highest to lowest) and print out their full names.
  neonAcademyMembers.sort((a, b) => b.memberLevel.compareTo(a.memberLevel));
  for (var member in neonAcademyMembers) {
    print(member.fullName);
  }
  print("-----------------------");

//Find all members who have the same title and create a new array of their contact information,
// then print out the phone numbers of all members in this new array.
  var map = Map();
  neonAcademyMembers.forEach((element) {
    if (!map.containsKey(element.title)) {
      map[element.title] = 1;
    } else {
      map[element.title] += 1;
    }
  });
  List sortedValues = map.keys.toList();
  var sameJobList = neonAcademyMembers
      .where((members) => members.title == sortedValues[0].toString())
      .toList();
  for (var member in sameJobList) {
    print(member.contactInformation.phoneNumber);
  }
}
