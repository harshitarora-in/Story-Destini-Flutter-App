import 'package:flutter/material.dart';
import 'storybrain.dart';
// import 'package:just_audio/just_audio.dart';

StoryBrain storyBrain = StoryBrain();
void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Destini'),
          backgroundColor: Colors.deepPurple.shade300,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StoryPage(),
        )),
      ),
    );
  }
}

// class AudioButton extends StatelessWidget {
//   const AudioButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: Text('HEY TAP ME'),
//       onPressed: () {
//         final player = AudioPlayer();
//         player.setAsset(
//             'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3');
//         player.play();
//       },
//     );
//   }
// }

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    // final audioPlayer = AudioPlayer();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Text(
            storyBrain.returnStory(),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.cyan)),
            onPressed: () {
              // audioPlayer.setAsset('music/asset1.wav');
              // audioPlayer.play();
              setState(() {
                storyBrain.nextStory(1);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                storyBrain.returnChoice1(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Visibility(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.deepPurple[300])),
            onPressed: () {
              setState(() {
                storyBrain.nextStory(2);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                storyBrain.returnChoice2(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          visible: storyBrain.restartScreen(),
        )
      ],
    );
  }
}
