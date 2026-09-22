import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<NewsStruct> _newsList = [];
  List<NewsStruct> get newsList => _newsList;
  set newsList(List<NewsStruct> value) {
    _newsList = value;
  }

  void addToNewsList(NewsStruct value) {
    newsList.add(value);
  }

  void removeFromNewsList(NewsStruct value) {
    newsList.remove(value);
  }

  void removeAtIndexFromNewsList(int index) {
    newsList.removeAt(index);
  }

  void updateNewsListAtIndex(
    int index,
    NewsStruct Function(NewsStruct) updateFn,
  ) {
    newsList[index] = updateFn(_newsList[index]);
  }

  void insertAtIndexInNewsList(int index, NewsStruct value) {
    newsList.insert(index, value);
  }

  List<DisplayUserStruct> _displayUserList = [];
  List<DisplayUserStruct> get displayUserList => _displayUserList;
  set displayUserList(List<DisplayUserStruct> value) {
    _displayUserList = value;
  }

  void addToDisplayUserList(DisplayUserStruct value) {
    displayUserList.add(value);
  }

  void removeFromDisplayUserList(DisplayUserStruct value) {
    displayUserList.remove(value);
  }

  void removeAtIndexFromDisplayUserList(int index) {
    displayUserList.removeAt(index);
  }

  void updateDisplayUserListAtIndex(
    int index,
    DisplayUserStruct Function(DisplayUserStruct) updateFn,
  ) {
    displayUserList[index] = updateFn(_displayUserList[index]);
  }

  void insertAtIndexInDisplayUserList(int index, DisplayUserStruct value) {
    displayUserList.insert(index, value);
  }

  List<DisplayUserStruct> _csvListOfUser = [];
  List<DisplayUserStruct> get csvListOfUser => _csvListOfUser;
  set csvListOfUser(List<DisplayUserStruct> value) {
    _csvListOfUser = value;
  }

  void addToCsvListOfUser(DisplayUserStruct value) {
    csvListOfUser.add(value);
  }

  void removeFromCsvListOfUser(DisplayUserStruct value) {
    csvListOfUser.remove(value);
  }

  void removeAtIndexFromCsvListOfUser(int index) {
    csvListOfUser.removeAt(index);
  }

  void updateCsvListOfUserAtIndex(
    int index,
    DisplayUserStruct Function(DisplayUserStruct) updateFn,
  ) {
    csvListOfUser[index] = updateFn(_csvListOfUser[index]);
  }

  void insertAtIndexInCsvListOfUser(int index, DisplayUserStruct value) {
    csvListOfUser.insert(index, value);
  }

  List<CompanyStruct> _companyList = [];
  List<CompanyStruct> get companyList => _companyList;
  set companyList(List<CompanyStruct> value) {
    _companyList = value;
  }

  void addToCompanyList(CompanyStruct value) {
    companyList.add(value);
  }

  void removeFromCompanyList(CompanyStruct value) {
    companyList.remove(value);
  }

  void removeAtIndexFromCompanyList(int index) {
    companyList.removeAt(index);
  }

  void updateCompanyListAtIndex(
    int index,
    CompanyStruct Function(CompanyStruct) updateFn,
  ) {
    companyList[index] = updateFn(_companyList[index]);
  }

  void insertAtIndexInCompanyList(int index, CompanyStruct value) {
    companyList.insert(index, value);
  }

  CompanyStruct _selectedCompany = CompanyStruct();
  CompanyStruct get selectedCompany => _selectedCompany;
  set selectedCompany(CompanyStruct value) {
    _selectedCompany = value;
  }

  void updateSelectedCompanyStruct(Function(CompanyStruct) updateFn) {
    updateFn(_selectedCompany);
  }

  List<CategoryStruct> _categoryList = [];
  List<CategoryStruct> get categoryList => _categoryList;
  set categoryList(List<CategoryStruct> value) {
    _categoryList = value;
  }

  void addToCategoryList(CategoryStruct value) {
    categoryList.add(value);
  }

  void removeFromCategoryList(CategoryStruct value) {
    categoryList.remove(value);
  }

  void removeAtIndexFromCategoryList(int index) {
    categoryList.removeAt(index);
  }

  void updateCategoryListAtIndex(
    int index,
    CategoryStruct Function(CategoryStruct) updateFn,
  ) {
    categoryList[index] = updateFn(_categoryList[index]);
  }

  void insertAtIndexInCategoryList(int index, CategoryStruct value) {
    categoryList.insert(index, value);
  }

  int _selectedAdmin = 0;
  int get selectedAdmin => _selectedAdmin;
  set selectedAdmin(int value) {
    _selectedAdmin = value;
  }

  List<DisplayUserStruct> _adminList = [];
  List<DisplayUserStruct> get adminList => _adminList;
  set adminList(List<DisplayUserStruct> value) {
    _adminList = value;
  }

  void addToAdminList(DisplayUserStruct value) {
    adminList.add(value);
  }

  void removeFromAdminList(DisplayUserStruct value) {
    adminList.remove(value);
  }

  void removeAtIndexFromAdminList(int index) {
    adminList.removeAt(index);
  }

  void updateAdminListAtIndex(
    int index,
    DisplayUserStruct Function(DisplayUserStruct) updateFn,
  ) {
    adminList[index] = updateFn(_adminList[index]);
  }

  void insertAtIndexInAdminList(int index, DisplayUserStruct value) {
    adminList.insert(index, value);
  }
}
