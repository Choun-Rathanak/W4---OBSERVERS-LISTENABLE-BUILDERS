import 'package:flutter/material.dart';



enum CardType { red, blue }

ColorService myCounterNotifier = ColorService();  // global instance 
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: ListenableBuilder(listenable: myCounterNotifier, builder:( context,child){
        return Scaffold(
          body: myCounterNotifier._currentIndex == 0
          ? ColorTapsScreen(
              )
              : StatisticsScreen(
              ),
              bottomNavigationBar: BottomNavigationBar(
               currentIndex: myCounterNotifier._currentIndex,
             onTap: (index) {
            myCounterNotifier.increaseCurrentIndex(index);
            
        },
            items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
             BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
        );
      }
              
    ),
    ),
    ),
  );
  }   
      
   




class ColorService extends ChangeNotifier {
  int _currentIndex = 0;
  int _redTapCount = 0;
  int _blueTapCount = 0;


 int get redCount => _redTapCount;
 int get blueCount => _blueTapCount;
 int get current => _currentIndex;

  void incrementRedTapCount() {
      _redTapCount++;
      notifyListeners();
  }

  void incrementBlueTapCount() {
      _blueTapCount++;
      notifyListeners();
  }
  void increaseCurrentIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }
      
}


class ColorTapsScreen extends StatelessWidget {

const ColorTapsScreen({super.key});
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          ColorTap(type: CardType.red, ),
          ColorTap(
            type: CardType.blue,
            
          ),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;


  const ColorTap({
    super.key,
    required this.type,
   
  });
  void onTap(){
    if(type == CardType.red){
      myCounterNotifier.incrementRedTapCount();
    }else{
      myCounterNotifier.incrementBlueTapCount();
    }
    
  }

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: ${type == CardType.red ? myCounterNotifier._redTapCount : myCounterNotifier._blueTapCount}',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  
  
const StatisticsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Red Taps: ${myCounterNotifier.redCount}', style: TextStyle(fontSize: 24)),
            Text('Blue Taps: ${myCounterNotifier.blueCount}', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
