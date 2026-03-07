part of 'seats.dart';
class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  /// NEW: track if view invitations was clicked
  bool _showOccupiedAlternative = false;

  bool get showOccupiedAlternative => _showOccupiedAlternative;

  void changeTab(int index) {
    _selectedIndex = index;

    if (index != 0) {
      _showOccupiedAlternative = false;
    }

    notifyListeners();
  }

  /// NEW: show broker detail screen
  void showBrokerDetail() {
    _showOccupiedAlternative = true;
    notifyListeners();
  }
}
