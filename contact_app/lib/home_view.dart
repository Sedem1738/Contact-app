import 'package:contact_app/contact_details_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "John Wayne",
      "phone": "1-565-827-8982",
      "email": "john@example.com",
      "country": "Ghana",
      "region": "Greater Accra",
      "picture": "assets/person_1.png"
    },
    {
      "name": "Mary Brown",
      "phone": "+233 543 465 755",
      "email": "mary@example.com",
      "country": "Ghana",
      "region": "Volta",
      "picture": "assets/person_2.png"
    },
    {
      "name": "Jeffery",
      "phone": "1-567-743-4341",
      "email": "jeff@example.com",
      "country": "Ghana",
      "region": "Eastern",
      "picture": "assets/person_3.png"
    },
    {
      "name": "Palmer Francis",
      "phone": "582-3896",
      "email": "cisco@example.com",
      "country": "New Zealand",
      "region": "South Island",
      "picture": "assets/person_4.png"
    },
    {
      "name": "Brian Griffin",
      "phone": "674-3271",
      "email": "poet@example.com",
      "country": "South Korea",
      "region": "Azad Kashmir",
      "picture": "assets/person_5.png"
    },
    {
      "name": "Victoria Hans",
      "phone": "1-238-113-6033",
      "email": "solo@example.com",
      "country": "Ghana",
      "region": "Ghana",
      "picture": "assets/person_6.png"
    },
    {
      "name": "Blessing",
      "phone": "871-3241",
      "email": "berry@example.com",
      "country": "Ghana",
      "region": "Jharkhand",
      "picture": "assets/person_7.png"
    },
    {
      "name": "Stephen West",
      "phone": "1-412-819-7163",
      "email": "westside@example.com",
      "country": "Vietnam",
      "region": "North Island",
      "picture": "assets/person_5.png"
    },
    {
      "name": "Percy Ramsey",
      "phone": "1-241-690-5206",
      "email": "perry@example.com",
      "country": "Turkey",
      "region": "Gorontalo",
      "picture": "assets/person_3.png"
    },
    {
      "name": "Chris",
      "phone": "1-768-578-0868",
      "email": "sagittis.augue@google.edu",
      "country": "Chile",
      "region": "South Chungcheong",
      "picture": "assets/person_6.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'Ghana',
                                email: 'osteynnyx@gmail.com.com',
                                name: 'Etornam Bright',
                                phone: '+233 543 352 382',
                                region: 'Greater Accra',
                                picture: 'assets/avatar.jpg'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/person_1.png'),
                    ),
                    title: const Text(
                      'Amegbe Austin',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 543 352 382'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('${element['picture']}'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
