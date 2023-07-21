import 'package:bloc_skeleton/common_ui/dialogs/common_loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonDialogs {
  // static Future showConfirmationDialog(
  //   BuildContext context, {
  //   String title = 'Title',
  //   String description = '',
  //   VoidCallback? onLeftBtnClick,
  //   VoidCallback? onRightBtnClick,
  //   String btnTextLeft = 'Batal',
  //   String btnTextRight = 'Konfirmasi',
  // }) {
  //   return showDialog(
  //     context: context,
  //     builder: (ctx) {
  //       return CommonConfirmationDialog(
  //         title: title,
  //         description: description,
  //         onLeftBtnClick: onLeftBtnClick,
  //         onRightBtnClick: onRightBtnClick,
  //         btnTextLeft: btnTextLeft,
  //         btnTextRight: btnTextRight,
  //       );
  //     },
  //   );
  // }

  static Future showLoadingDialog(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return const CommonLoadingDialog();
      },
    );
  }

  static Future showCustomBottomSheet(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return WillPopScope(
          // Prevent back button from dismissing the bottom sheet
          onWillPop: () async => false,
          child: GestureDetector(
            onTap: () {
              // Do nothing on tap to prevent closing the bottom sheet
            },
            child: widget,
          ),
        );
      },
    );
  }

  // static Future showProcessingLoading(
  //   BuildContext context,
  // ) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (ctx) {
  //       return const CommonProcessingDialog();
  //     },
  //   );
  // }

  static void showToastMessage(
    String? message,
  ) {
    Fluttertoast.showToast(
      msg: message ?? '',
      backgroundColor: Colors.black.withOpacity(0.3),
    );
  }

  // static Future showCommonFilterDialog(
  //   BuildContext context, {
  //   required List<KeyValueDto> sortOptions,
  //   required String title,
  //   bool isSingleSelected = true,
  //   List<KeyValueDto> lastSelectedSorts = const [],
  // }) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return CommonFilterDialog(
  //         sortOptions: sortOptions,
  //         isSingleSelected: isSingleSelected,
  //         lastSelectedSorts: lastSelectedSorts,
  //         title: title,
  //       );
  //     },
  //   );
  // }

  // static Future showAssessmentListFilter(
  //   BuildContext context, {
  //   required List<KeyValueDto> sortOptions,
  //   required String title,
  //   bool isSingleSelected = true,
  //   List<KeyValueDto> lastSelectedSorts = const [],
  // }) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return AssessmentTaskFilter(
  //         sortOptions: sortOptions,
  //         isSingleSelected: isSingleSelected,
  //         lastSelectedSorts: lastSelectedSorts,
  //         title: title,
  //       );
  //     },
  //   );
  // }

  // static Future showClassMaterialListFilter(
  //   BuildContext context, {
  //   required List<KeyValueDto> sortOptions,
  //   required String title,
  //   bool isSingleSelected = true,
  //   required void Function() onReset,
  //   List<KeyValueDto> lastSelectedSorts = const [],
  // }) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return ClassMaterialFilter(
  //         sortOptions: sortOptions,
  //         onReset: onReset,
  //         isSingleSelected: isSingleSelected,
  //         lastSelectedSorts: lastSelectedSorts,
  //         title: title,
  //       );
  //     },
  //   );
  // }

  // static Future showGetCourseClassListFilter(
  //   BuildContext context, {
  //   required List<KeyValueDto> classTypeOptions,
  //   required String title,
  //   bool isSingleSelected = true,
  //   List<KeyValueDto> lastSelectedSorts = const [],
  //   List<DateTime?> lastSelectedStartDate = const [],
  //   List<DateTime?> lastSelectedEndDate = const [],
  // }) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return GetCourseCourseListFilter(
  //         classTypeOptions: classTypeOptions,
  //         isSingleSelected: isSingleSelected,
  //         lastSelectedClassTypeOptions: lastSelectedSorts,
  //         title: title,
  //         lastSelectedStartDate: lastSelectedStartDate,
  //         lastSelectedEndDate: lastSelectedEndDate,
  //       );
  //     },
  //   );
  // }

  // static Future showCourseFileManagerFilter(
  //     BuildContext context, {
  //       required List<KeyValueDto> departmentTypeOptions,
  //       required List<KeyValueDto> projectSiteTypeOptions,
  //       required List<KeyValueDto> roleTypeOptions,
  //       required String title,
  //       bool isSingleSelected = true,
  //       List<KeyValueDto> lastSelectedDepartment = const [],
  //       List<KeyValueDto> lastSelectedProjectSite = const [],
  //       List<KeyValueDto> lastSelectedRole = const [],
  //     }) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return CourseFileManagerFilter(
  //         departmentTypeOptions: departmentTypeOptions,
  //         projectSiteTypeOptions: projectSiteTypeOptions,
  //         roleTypeOptions: roleTypeOptions,
  //         isSingleSelected: isSingleSelected,
  //         lastSelectedDepartmentTypeOptions: lastSelectedDepartment,
  //         lastSelectedProjectSiteTypeOptions: lastSelectedProjectSite,
  //         lastSelectedRoleTypeOptions: lastSelectedRole,
  //         title: title,
  //       );
  //     },
  //   );
  // }

  // static Future showCourseDetailFileFilter(
  //     BuildContext context, {
  //       required List<KeyValueDto> fileExtensionTypeOptions,
  //       required String title,
  //       bool isSingleSelected = true,
  //       List<KeyValueDto> lastSelectedFileExtension = const [],
  //     }) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return CourseDetailFileFilter(
  //         fileTypeOptions: fileExtensionTypeOptions,
  //         lastSelectedFileTypeOptions: lastSelectedFileExtension,
  //         isSingleSelected: isSingleSelected,
  //         title: title,
  //       );
  //     },
  //   );
  // }

  // static Future showReportFilter(
  //     BuildContext context, {
  //       required List<KeyValueDto> assessmentNameOptions,
  //       required List<KeyValueDto> siteLocationOptions,
  //       required List<KeyValueDto> monthOptions,
  //       required String title,
  //       bool isSingleSelected = true,
  //       List<KeyValueDto> lastSelectedAssessment = const [],
  //       List<KeyValueDto> lastSelectedMonth = const [],
  //       List<KeyValueDto> lastSelectedSiteLocation = const [],
  //     }) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return AssessmentReportFilter(
  //         assessmentNameOptions: assessmentNameOptions,
  //         siteLocationOptions: siteLocationOptions,
  //         isSingleSelected: isSingleSelected,
  //         lastSelectedAssessment: lastSelectedAssessment,
  //         monthOptions: monthOptions,
  //         title: title,
  //         lastSelectedMonth: lastSelectedMonth,
  //         lastSelectedSiteLocation: lastSelectedSiteLocation,
  //       );
  //     },
  //   );
  // }

  // static Future showAssessmentResultFilter(
  //   BuildContext context, {
  //   required List<KeyValueDto> sortOptions,
  //   required String title,
  //   bool isSingleSelected = true,
  //   List<KeyValueDto> lastSelectedSorts = const [],
  // }) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return AssessmentResultFilter(
  //         sortOptions: sortOptions,
  //         lastSelectedSorts: lastSelectedSorts,
  //         isSingleSelected: isSingleSelected,
  //         title: title,
  //       );
  //     },
  //   );
  // }

  // static Future showCourseListFilter(BuildContext context,
  //     {required List<KeyValueDto> sortOptions,
  //     required List<KeyValueDto> statusOptions,
  //     required String title,
  //     bool isSingleSelected = true,
  //     List<KeyValueDto> lastSelectedSorts = const [],
  //     List<KeyValueDto> lastSelectedStatus = const [],
  //     List<DateTime?> lastSelectedDate = const []}) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return CourseListFilter(
  //         statusOptions: statusOptions,
  //         lastSelectedStatus: lastSelectedStatus,
  //         sortOptions: sortOptions,
  //         isSingleSelected: isSingleSelected,
  //         lastSelectedSorts: lastSelectedSorts,
  //         title: title,
  //         lastSelectedDate: lastSelectedDate,
  //       );
  //     },
  //   );
  // }

  // static Future showAsessmentResultDateFilter(BuildContext context,
  //     {required String title,
  //     bool isSingleSelected = true,
  //     List<DateTime?> lastSelectedDate = const []}) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return AssessmentResultDateFilter(
  //         isSingleSelected: isSingleSelected,
  //         title: title,
  //         lastSelectedDate: lastSelectedDate,
  //       );
  //     },
  //   );
  // }

  // static Future showCheckPointFilter(BuildContext context,
  //     {required List<KeyValueDto> frameOptions,
  //     required List<KeyValueDto> departementOptions,
  //     required List<KeyValueDto> projectSiteOptions,
  //     required String title,
  //     bool isSingleSelected = true,
  //     List<KeyValueDto> lastSelectedFrame = const [],
  //     List<KeyValueDto> lastSelectedDepartement = const [],
  //     List<KeyValueDto> lastSelectedProjectSite = const [],
  //     List<DateTime?> lastSelectedDate = const []}) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return CheckPointFilter(
  //         frameOptions: frameOptions,
  //         departementOptions: departementOptions,
  //         projectSiteOptions: projectSiteOptions,
  //         lastSelectedFrame: lastSelectedFrame,
  //         lastSelectedDepartement: lastSelectedDepartement,
  //         lastSelectedProjectSite: lastSelectedProjectSite,
  //         isSingleSelected: isSingleSelected,
  //         title: title,
  //         lastSelectedDate: lastSelectedDate,
  //       );
  //     },
  //   );
  // }

  // static Future showAssessmentCourseListFilter(
  //   BuildContext context, {
  //   required List<KeyValueDto> departmentOptions,
  //   required List<KeyValueDto> roleOptions,
  //   required List<KeyValueDto> projectOptions,
  //   required String title,
  //   bool isSingleSelected = true,
  //   List<KeyValueDto> lastSelectedDepartment = const [],
  //   List<KeyValueDto> lastSelectedRole = const [],
  //   List<KeyValueDto> lastSelectedProjects = const [],
  //   List<DateTime?> lastSelectedDate = const [],
  // }) {
  //   return showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return AssessmentCourseListFilter(
  //         departmentOptions: departmentOptions,
  //         roleOptions: roleOptions,
  //         projectOptions: projectOptions,
  //         lastSelectedProject: lastSelectedProjects,
  //         lastSelectedRole: lastSelectedRole,
  //         lastSelectedDepartment: lastSelectedDepartment,
  //         isSingleSelected: isSingleSelected,
  //         title: title,
  //         lastSelectedDate: lastSelectedDate,
  //       );
  //     },
  //   );
  // }

  // static void showWelcomingDialog(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return const CommonWelcomingDialog();
  //     },
  //   );
  // }

  // static Future showAssessmentPopupDialog(BuildContext context) {
  //   return showModalBottomSheet(
  //     context: context,
  //     isDismissible: false,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (ctx) {
  //       return const AssessmentTestPopup();
  //     },
  //   );
  // }

  // static Future showTopModalSheetTestQuestionNumberList(
  //   BuildContext context, {
  //   required List<QuestionDto> questions,
  //   required Map<String, String> selectedAnswers,
  //   int initPage = 0,
  //   int questionPerGrid = 20,
  //   Color answeredBackgroundColor = CommonColors.blueC9,
  //   Color unAnsweredBackgroundColor = Colors.white,
  //   Color unAnsweredTextColor = CommonColors.grey78,
  //   Color answeredTextColor = Colors.white,
  //   Color backgroundColor = Colors.white,
  //   Color unActiveIndicatorColor = CommonColors.greyD9,
  //   Color currentQuestionBackgroundColor = CommonColors.blueF2,
  //   int currentQuestion = 1,
  //   double indicatorSize = 8.0,
  // }) async {
  //   Map<String, int>? page = await showTopModalSheet<Map<String, int>?>(
  //     context,
  //     QuestionNumberGridWidget(
  //       questions: questions,
  //       selectedAnswers: selectedAnswers,
  //       currentIndex: initPage,
  //       questionPerGrid: questionPerGrid,
  //       answeredBackgroundColor: answeredBackgroundColor,
  //       unAnsweredBackgroundColor: unAnsweredBackgroundColor,
  //       answeredTextColor: answeredTextColor,
  //       unAnsweredTextColor: unAnsweredTextColor,
  //       backgroundColor: backgroundColor,
  //       unActiveIndicatorColor: unActiveIndicatorColor,
  //       indicatorSize: indicatorSize,
  //       currentQuestionBackgroundColor: currentQuestionBackgroundColor,
  //       currentQuestion: currentQuestion,
  //     ),
  //   );
  //   return page;
  // }
}
