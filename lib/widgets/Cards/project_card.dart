import 'package:flutter/material.dart';
import 'package:my_portofolio/models/project.dart';
import 'package:my_portofolio/pages/project/project_detail.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ProjectDetail(
                    project: project,
                  ))),
      child: Container(
        // width: MediaQuery.of(context).size.width / 1.3,
        width: 300,
        margin: const EdgeInsets.only(top: 15.0, right: 25.0, bottom: 25.0),
        height: 350,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(5, 15),
                  color: Colors.black.withOpacity(.15),
                  blurRadius: 15)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  project.name.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15.0)),
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    project.year.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Hero(
                tag: project.name.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    project.imageUrl.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              project.description.toString(),
              maxLines:
                  3, //memberitahu bahwa teks akan merender sebanya 3 baris ini digunakan apabila teks banyak
              overflow: TextOverflow.ellipsis, //ini juga
              style: TextStyle(
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
