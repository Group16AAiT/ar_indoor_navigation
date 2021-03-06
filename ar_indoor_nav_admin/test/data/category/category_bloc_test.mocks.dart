// Mocks generated by Mockito 5.0.14 from annotations
// in ar_indoor_nav_admin/test/data/category/category_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;

import 'package:ar_indoor_nav_admin/data/account/data_provider/account_local_provider.dart'
    as _i5;
import 'package:ar_indoor_nav_admin/data/account/data_provider/account_remote_provider.dart'
    as _i4;
import 'package:ar_indoor_nav_admin/data/account/repository/account_repository.dart'
    as _i8;
import 'package:ar_indoor_nav_admin/data/categories/data_provider/category_data.dart'
    as _i2;
import 'package:ar_indoor_nav_admin/data/categories/models/categories.dart'
    as _i3;
import 'package:ar_indoor_nav_admin/data/categories/repository/categories_repository.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeCategoriesDataProvider_0 extends _i1.Fake
    implements _i2.CategoriesDataProvider {}

class _FakeCategory_1 extends _i1.Fake implements _i3.Category {}

class _FakeAccountRemoteDataProvider_2 extends _i1.Fake
    implements _i4.AccountRemoteDataProvider {}

class _FakeAccountLocalDataProvider_3 extends _i1.Fake
    implements _i5.AccountLocalDataProvider {}

/// A class which mocks [CategoriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoriesRepository extends _i1.Mock
    implements _i6.CategoriesRepository {
  MockCategoriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.CategoriesDataProvider get dataProvider =>
      (super.noSuchMethod(Invocation.getter(#dataProvider),
              returnValue: _FakeCategoriesDataProvider_0())
          as _i2.CategoriesDataProvider);
  @override
  _i7.Future<_i3.Category> createCategory(
          _i3.Category? category, String? bldgId, String? token) =>
      (super.noSuchMethod(
              Invocation.method(#createCategory, [category, bldgId, token]),
              returnValue: Future<_i3.Category>.value(_FakeCategory_1()))
          as _i7.Future<_i3.Category>);
  @override
  _i7.Future<List<_i3.Category>> getCategories({String? bldgId}) =>
      (super.noSuchMethod(
              Invocation.method(#getCategories, [], {#bldgId: bldgId}),
              returnValue: Future<List<_i3.Category>>.value(<_i3.Category>[]))
          as _i7.Future<List<_i3.Category>>);
  @override
  _i7.Future<void> updateCategory(_i3.Category? category, String? token) =>
      (super.noSuchMethod(Invocation.method(#updateCategory, [category, token]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> deleteCategory(String? id, String? bldgId, String? token) =>
      (super.noSuchMethod(
          Invocation.method(#deleteCategory, [id, bldgId, token]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AccountRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountRepository extends _i1.Mock implements _i8.AccountRepository {
  MockAccountRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.AccountRemoteDataProvider get remoteDataProvider =>
      (super.noSuchMethod(Invocation.getter(#remoteDataProvider),
              returnValue: _FakeAccountRemoteDataProvider_2())
          as _i4.AccountRemoteDataProvider);
  @override
  _i5.AccountLocalDataProvider get localDataProvider =>
      (super.noSuchMethod(Invocation.getter(#localDataProvider),
              returnValue: _FakeAccountLocalDataProvider_3())
          as _i5.AccountLocalDataProvider);
  @override
  _i7.Future<void> signUpAdmin(String? name, String? email, String? password) =>
      (super.noSuchMethod(
          Invocation.method(#signUpAdmin, [name, email, password]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> login(String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#login, [email, password]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<bool> isSignedIn() =>
      (super.noSuchMethod(Invocation.method(#isSignedIn, []),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<bool> changePassword(String? oldPassword, String? newPassword) =>
      (super.noSuchMethod(
          Invocation.method(#changePassword, [oldPassword, newPassword]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  String toString() => super.toString();
}
