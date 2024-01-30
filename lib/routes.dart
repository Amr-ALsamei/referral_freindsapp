
// import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/middleware/AppMiddleWare.dart';
import 'package:referral_freindsapp/view/screen/Auth/SignApp.dart';
import 'package:referral_freindsapp/view/screen/Auth/Successed_SignUp.dart';
import 'package:referral_freindsapp/view/screen/Auth/forgetPassword/SuccessedResetPassword.dart';
import 'package:referral_freindsapp/view/screen/Auth/forgetPassword/forgetPassword.dart';
import 'package:referral_freindsapp/view/screen/Auth/forgetPassword/resetPassword.dart';
import 'package:referral_freindsapp/view/screen/Auth/forgetPassword/verfyCode.dart';
import 'package:referral_freindsapp/view/screen/Auth/initialLogin.dart';
import 'package:referral_freindsapp/view/screen/Auth/login.dart';
import 'package:referral_freindsapp/view/screen/Auth/loginChildren.dart';
import 'package:referral_freindsapp/view/screen/Auth/verfyCodeSignUp.dart';
import 'package:referral_freindsapp/view/screen/Letters/LettersScreen.dart';
import 'package:referral_freindsapp/view/screen/Letters/addScreen.dart';
import 'package:referral_freindsapp/view/screen/Letters/editScreen.dart';
import 'package:referral_freindsapp/view/screen/Letters/videoScreen.dart';
import 'package:referral_freindsapp/view/screen/NotificationScreen.dart';
import 'package:referral_freindsapp/view/screen/NumAndLetterhome.dart';
import 'package:referral_freindsapp/view/screen/Numbers/addScreen.dart';
import 'package:referral_freindsapp/view/screen/Numbers/editScreen.dart';
import 'package:referral_freindsapp/view/screen/Numbers/numbersScreen.dart';
import 'package:referral_freindsapp/view/screen/Numbers/videoScreen.dart';
import 'package:referral_freindsapp/view/screen/Onboarding.dart';
import 'package:referral_freindsapp/view/screen/Profile/AboutApp.dart';
import 'package:referral_freindsapp/view/screen/Profile/Days/days_detailsScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/Days/result_Exam_days.dart';
import 'package:referral_freindsapp/view/screen/Profile/Days/videoDaysScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/Famly/famly_detailsScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/Famly/result_Exam_famly.dart';
import 'package:referral_freindsapp/view/screen/Profile/Famly/videoFamlyScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/Numbers/numbers_detailsScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/Numbers/result_Exam_numbers.dart';
import 'package:referral_freindsapp/view/screen/Profile/SentencedetailsScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/TraceChildren/Result_Exam_Tracing/MainScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/TraceChildren/Result_Exam_Tracing/result_letter.dart';
import 'package:referral_freindsapp/view/screen/Profile/TraceChildren/Result_Exam_Tracing/result_number.dart';
import 'package:referral_freindsapp/view/screen/Profile/TraceChildren/Result_Exam_Tracing/result_sentences.dart';
import 'package:referral_freindsapp/view/screen/Profile/TraceChildren/Result_Exam_Tracing/rsult_days.dart';
import 'package:referral_freindsapp/view/screen/Profile/TraceChildren/Result_Exam_Tracing/rsult_famly.dart';
import 'package:referral_freindsapp/view/screen/Profile/TraceChildren/tracechildrenmain.dart';
import 'package:referral_freindsapp/view/screen/Profile/addchildrenScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/detailsScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/detailstochildren.dart';
import 'package:referral_freindsapp/view/screen/Profile/editNameScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/favoriteScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/favoriteVideoScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/manageUsers.dart';
import 'package:referral_freindsapp/view/screen/Profile/profilemain.dart';
import 'package:referral_freindsapp/view/screen/Profile/result_Exam_main.dart';
import 'package:referral_freindsapp/view/screen/Profile/result_exam_sentences.dart';
import 'package:referral_freindsapp/view/screen/Profile/result_to_children.dart';
import 'package:referral_freindsapp/view/screen/Profile/results_exams.dart';
import 'package:referral_freindsapp/view/screen/Profile/TraceChildren/tracechildrenScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/TraceChildren/tracevideoScreen.dart';
import 'package:referral_freindsapp/view/screen/Profile/videoSentenceScreen.dart';
import 'package:referral_freindsapp/view/screen/QuestionDays/QuestionDaysScreen.dart';
import 'package:referral_freindsapp/view/screen/QuestionFamly/QuestionFamlyScreen.dart';
import 'package:referral_freindsapp/view/screen/QuestionHome.dart';
import 'package:referral_freindsapp/view/screen/QuestionNumbers/QuestionNumbersScreen.dart';
import 'package:referral_freindsapp/view/screen/QuestionSentence/QuestionSentenceScreen.dart';
import 'package:referral_freindsapp/view/screen/Questions/ChildrenQuestion.dart';
import 'package:referral_freindsapp/view/screen/Questions/QuestionLetterAndNum.dart';
import 'package:referral_freindsapp/view/screen/Questions/QuestionScreen.dart';
import 'package:referral_freindsapp/view/screen/Questions/QuestionwordsHome.dart';
import 'package:referral_freindsapp/view/screen/Sentences/SentencesScreen.dart';
import 'package:referral_freindsapp/view/screen/Sentences/addScreen.dart';
import 'package:referral_freindsapp/view/screen/Sentences/editScreen.dart';
import 'package:referral_freindsapp/view/screen/Sentences/sentenceVideo.dart';
import 'package:referral_freindsapp/view/screen/Words/WordsScreen.dart';
import 'package:referral_freindsapp/view/screen/Words/Wordshome.dart';
import 'package:referral_freindsapp/view/screen/Words/addScreen.dart';
import 'package:referral_freindsapp/view/screen/Words/editScreen.dart';
import 'package:referral_freindsapp/view/screen/Words/famlyWordsVideo.dart';
import 'package:referral_freindsapp/view/screen/Words/famlywords.dart';
import 'package:referral_freindsapp/view/screen/Words/weekDays.dart';
import 'package:referral_freindsapp/view/screen/Words/weekWordsVideo.dart';
import 'package:referral_freindsapp/view/screen/Words/wordsVideoScreen.dart';
import 'package:referral_freindsapp/view/screen/homeScreen.dart';



 List<GetPage<dynamic>>? routesPages=[
  
  GetPage(name: "/", page: ()=>const OnBoarding(),middlewares:[
    AppMiddleWare()
  ] ),
 
   GetPage(name: RoutesApp.initiallogin, page: ()=>const InitialLoginApp()),
  GetPage(name: RoutesApp.login, page: ()=>const LoginApp()),
   GetPage(name: RoutesApp.loginchildren, page: ()=>const LoginchildrenApp()),
  GetPage(name: RoutesApp.onbordingRoute, page: ()=>const OnBoarding()),
  GetPage(name: RoutesApp.signapp, page: ()=>const SignApp()),
  GetPage(name: RoutesApp.forgetpassword, page: ()=>const ForgetPassword()),
  GetPage(name: RoutesApp.verfyCode, page: ()=>const VerificationCode()),
  GetPage(name:  RoutesApp.resetpassword, page: ()=>const ResetPassword()),
  GetPage(name: RoutesApp.SuccessResetPassword, page: ()=>const SuccessedResetPassword()),
  GetPage(name:  RoutesApp.SuccessedSignUp, page: ()=>const SuccessedSignUp()),
  GetPage(name:  RoutesApp.verfyCodeSignUp, page: ()=>const VerificationCodeSignUp()),
 
   GetPage(name: RoutesApp.homepage, page: ()=>const HomeScreen()),
   GetPage(name: RoutesApp.sentencespage, page: ()=>const SentencesScreen()),
   GetPage(name: RoutesApp.addsentencespage, page:()=> const AddSentencesScreen()),
   GetPage(name: RoutesApp.editsentencespage, page:()=> const EditSentencesScreen()),

   GetPage(name: RoutesApp.wordsspage, page: ()=>const WordsScreen()),
   GetPage(name: RoutesApp.addwordspage, page:()=> const AddWordsScreen()),
   GetPage(name: RoutesApp.editwordspage, page:()=> const EditWordsScreen()),
   GetPage(name: RoutesApp.wordshomepage, page: ()=>const WordsHomeScreen()),
   
   GetPage(name: RoutesApp.weekwordspage, page: ()=>const WeekWordsScreen()),
   GetPage(name: RoutesApp.weekwordsvideopage, page: ()=>const WeekWordsVideoScreen()),

   GetPage(name: RoutesApp.questionspage, page: ()=>const QuestionsScreen()),
   GetPage(name: RoutesApp.profilemainpage, page: ()=>const ProfileScreen()),
   GetPage(name: RoutesApp.editnamepage, page: ()=>const EditNameScreen()),

   GetPage(name: RoutesApp.questionsentencepage, page: ()=>const QuestionSentenceScreen()),

   GetPage(name: RoutesApp.questionwordshomepage, page: ()=>const QuestionWordsHomeScreen()),
   GetPage(name: RoutesApp.questionlettersandnumhomepage, page: ()=>const QuestionLettersAndNumHomeScreen()),
   GetPage(name: RoutesApp.questionnumberpage, page: ()=>const QuestionNumbersScreen()),
   GetPage(name: RoutesApp.resultexamnumberpage, page: ()=>const ResultExamNumberScreen()),
   GetPage(name: RoutesApp.numbersdetailspage, page: ()=>const NumberDetailsScreen()),
   //////////Letters/////////////////////////////////////
   GetPage(name: RoutesApp.letterspage, page: ()=>const LettersScreen()),
   GetPage(name: RoutesApp.videospage, page: ()=>const VideoScreen()),
   GetPage(name: RoutesApp.EditLetterpage, page: ()=>const EditLettersScreen()),
   GetPage(name: RoutesApp.addLetterpage, page: ()=>const AddLettersScreen()),
    GetPage(name: RoutesApp.addchildrenpage, page: ()=>const AddChildrenScreenPage()),
    GetPage(name: RoutesApp.tracechildrenpage, page: ()=>const TraceChildrenScreen()),
     GetPage(name: RoutesApp.videostracepage, page: ()=>const VideoTraceScreen()),
     GetPage(name: RoutesApp.videosfavoritepage, page: ()=>const VideoFavoriteScreen()),
     GetPage(name: RoutesApp.resultmainpage, page: ()=>const ResultExamMain()),
     GetPage(name: RoutesApp.resultsentencepage, page: ()=>const ResultExamSentenceScreen()),
    GetPage(name: RoutesApp.sentencesdetailspage, page: ()=>const SentencesDetailsScreen()),
     GetPage(name: RoutesApp.sentenceresultvideopage, page: ()=>const VideoSentencesScreen()),

    GetPage(name: RoutesApp.favoritechildrenpage, page: ()=>const FavoriteChildrenScreen()),
    GetPage(name: RoutesApp.resultexampage, page: ()=>const ResultExamScreen()),
    GetPage(name: RoutesApp.detailspage, page: ()=>const DetailsScreen()),
    GetPage(name: RoutesApp.childrenquestionspage, page: ()=>const ChildrenQuestionsScreen()),
    GetPage(name: RoutesApp.childrenresultexampage, page: ()=>const ChildrenResultExamScreen()),
    GetPage(name: RoutesApp.childrendetailspage, page: ()=>const DetailsChildrenScreen()),

    GetPage(name: RoutesApp.wordsvideopage, page: ()=>const WordsVideoScreen()),

    GetPage(name: RoutesApp.sentencevideopage, page: ()=>const SentenceVideoScreen()),

   GetPage(name: RoutesApp.questionhomepage, page: ()=>const QuestionHomeScreen()),
  
    GetPage(name: RoutesApp.numberspage, page: ()=>const NumbersScreen()),
   GetPage(name: RoutesApp.numbersvideospage, page: ()=>const NumbersVideoScreen()),
   GetPage(name: RoutesApp.addnumberpage, page: ()=>const AddNumbersScreen()),
   GetPage(name: RoutesApp.Editnumberpage, page: ()=>const EditNumbersScreen()),

   GetPage(name: RoutesApp.numberandletterpage, page: ()=>const NumbersAndLettersHomeScreen()),

   ///////////////////////////QuestionDays////////////////////////////////
    GetPage(name: RoutesApp.questiondayspage, page: ()=>const QuestionDaysScreen()),
    GetPage(name: RoutesApp.resultdayspage, page: ()=>const ResultExamDaysScreen()),
    GetPage(name: RoutesApp.daysdetailspage, page: ()=>const DaysDetailsScreen()),
    GetPage(name: RoutesApp.daysresultvideopage, page: ()=>const VideoDaysScreen()),
  
  ///////////////////////QuestionFamly////////////////////////////
   GetPage(name: RoutesApp.questionfamlypage, page: ()=>const QuestionFamlyScreen()),
    GetPage(name: RoutesApp.resultfamlypage, page: ()=>const ResultExamFamlyScreen()),
    GetPage(name: RoutesApp.famlydetailspage, page: ()=>const FamlyDetailsScreen()),
    GetPage(name: RoutesApp.famlyresultvideopage, page: ()=>const VideoFamlyScreen()),

    GetPage(name: RoutesApp.famlywordspage, page: ()=>const FamlyWordsScreen()),
   GetPage(name: RoutesApp.famlywordsvideopage, page: ()=>const FamlyWordsVideoScreen()),

   GetPage(name: RoutesApp.notificationpage, page: ()=>const NotificationScreen()),
   GetPage(name: RoutesApp.tracechildrenmainpage, page: ()=>const TraceChildrenMain()),

   GetPage(name: RoutesApp.aboutapplicationpage, page: ()=>const AboutApplicationScreen()),

   GetPage(name: RoutesApp.manageuserpage, page: ()=>const ManageUsersScreen()),
   GetPage(name: RoutesApp.resultexamtracingpage, page: ()=>const ResultExamMainTracing()),

   GetPage(name: RoutesApp.resultexamlettertracingpage, page: ()=>const ChildrenResultExamLetters()),
   GetPage(name: RoutesApp.resultexamnumbertacingpage, page: ()=>const ResultExamNumberTracing()),
   
   GetPage(name: RoutesApp.resultexamsentencestracingpage, page: ()=>const ResultExamSentenceTracing()),
   
   GetPage(name: RoutesApp.resultexamdaystracingpage, page: ()=>const ResultExamDaysTracing()),
   GetPage(name: RoutesApp.resultexamfamlytracingpage, page: ()=>const ResultExamFamlyTracing()),
 ];
