part of 'agent_setup_profile.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  int _currentStep = 0;

  /// 🔹 Fixed total steps
  static const int _totalSteps = 3;

  int get totalSteps => _totalSteps;

  double get progress => (_currentStep + 1) / totalSteps;

  final Map<String, GlobalKey<FormBuilderState>> _formKeys = {};
  final Map<String, Map<String, dynamic>> _formValues = {};

  int get currentStep => _currentStep;

  void registerFormKey(String stepId, GlobalKey<FormBuilderState> key) {
    _formKeys[stepId] = key;
  }

  /// 🔹 Go to next step (persist current form data)
  void next() {
    final screenId = _currentStep.toString();
    final formKey = _formKeys[screenId];

    if (formKey != null && formKey.currentState != null) {
      formKey.currentState!.save();
      _formValues[screenId] = formKey.currentState!.value;
    }

    _advance();
  }

  void _advance() {
    if (_currentStep < totalSteps - 1) {
      _currentStep++;
      notifyListeners();
    }
  }

  /// 🔹 Go to previous step (persist current form data)
  void previous() {
    final screenId = _currentStep.toString();
    final formKey = _formKeys[screenId];

    if (formKey != null && formKey.currentState != null) {
      formKey.currentState!.save();
      _formValues[screenId] = formKey.currentState!.value;
    }

    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  /// 🔹 Submit all steps data
  Future<void> submit(BuildContext context) async {
    final screenId = _currentStep.toString();
    final formKey = _formKeys[screenId];

    if (formKey != null && formKey.currentState != null) {
      formKey.currentState!.save();
      _formValues[screenId] = formKey.currentState!.value;
    }

    /// 🔹 Merge all step values
    final allData = _formValues.values.fold<Map<String, dynamic>>({}, (
      acc,
      map,
    ) {
      acc.addAll(map);
      return acc;
    });

    debugPrint('Submitting full profile data: $allData');

    await Future.delayed(const Duration(seconds: 2));

    // ignore: use_build_context_synchronously
    showSetUpSuccessBottomSheet(context);
  }

  /// 🔹 Restore values for a step
  Map<String, dynamic> getInitialValues(String stepId) {
    return _formValues[stepId] ?? _FormData.initialValues();
  }

  //step1 states
  bool isProfileImageUploaded = false;
  void setProfileImageUploaded(bool value) {
    isProfileImageUploaded = value;
    notifyListeners();
  }
}
