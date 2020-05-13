import "package:flutter/material.dart";
import 'list_page.dart';
import 'grid_page.dart';

// 1-2. 탭 화면 (각 화면 import)
enum SORT_MENU { byRank, curation, byDate }
enum PAGE_IDX { List, Grid }

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _selectedTabIndex = 0;

// 1-2. 탭 화면 (build() 함수를 _MainState로 옮김)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie'),
        centerTitle: true,
//        leading: Icon(Icons.menu),
        // 1-1. 상단화면 (우측 팝업 버튼 및 이벤트 추가)
        actions: <Widget>[
          PopupMenuButton(
              icon: Icon(Icons.sort),
              onSelected: (value) {
                switch (value) {
                  case SORT_MENU.byRank:
                    print("예매율순");
                    break;
                  case SORT_MENU.curation:
                    print("큐레이션");
                    break;
                  case SORT_MENU.byDate:
                    print("최신순");
                    break;
                  default:
                    break;
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("예매율순"),
                    value: SORT_MENU.byRank,
                  ),
                  PopupMenuItem(
                    child: Text("큐레이션"),
                    value: SORT_MENU.curation,
                  ),
                  PopupMenuItem(
                    child: Text("최신순"),
                    value: SORT_MENU.byDate,
                  ),
                ];
              })
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list), title: Text("List")),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_on), title: Text("Grid")),
        ],
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
          print("$_selectedTabIndex Tab Clicked");
        },
      ),
      // 1-2. 탭 화면 (List, Grid Widget 연동)
      body: (_selectedTabIndex == 0 ? ListPage() : GridPage()),
      // 1-2. 탭 화면 (bottomNavigationBar 추가)
    );
  }
}
// 1-2. 탭 화면 (State 구현)

// 1-2. 탭 화면 (List, Grid Widget 반환)
