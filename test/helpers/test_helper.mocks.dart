// Mocks generated by Mockito 5.4.4 from annotations
// in docdiscovery/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:typed_data' as _i11;

import 'package:algolia/algolia.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:docdiscovery/core/error/failure.dart' as _i9;
import 'package:docdiscovery/core/utils.dart' as _i7;
import 'package:docdiscovery/domain/entities/practitioner.dart' as _i10;
import 'package:docdiscovery/domain/entities/user.dart' as _i21;
import 'package:docdiscovery/domain/repositories/auth_repository.dart' as _i5;
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart'
    as _i4;
import 'package:docdiscovery/domain/repositories/user_repository.dart' as _i6;
import 'package:docdiscovery/domain/usecases/get_connected_user_use_case.dart'
    as _i23;
import 'package:docdiscovery/domain/usecases/get_practitioner_info_use_case.dart'
    as _i14;
import 'package:docdiscovery/domain/usecases/get_practitioner_profile_use_case.dart'
    as _i19;
import 'package:docdiscovery/domain/usecases/save_practitioner_use_case.dart'
    as _i13;
import 'package:docdiscovery/domain/usecases/search_practitioner_use_case.dart'
    as _i15;
import 'package:docdiscovery/domain/usecases/sign_in_use_case.dart' as _i22;
import 'package:docdiscovery/domain/usecases/sign_up_user_use_case.dart'
    as _i20;
import 'package:file_picker/src/file_picker.dart' as _i17;
import 'package:file_picker/src/file_picker_result.dart' as _i18;
import 'package:flutter/src/widgets/navigator.dart' as _i16;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAlgolia_1 extends _i1.SmartFake implements _i3.Algolia {
  _FakeAlgolia_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAlgoliaMultiIndexesReference_2 extends _i1.SmartFake
    implements _i3.AlgoliaMultiIndexesReference {
  _FakeAlgoliaMultiIndexesReference_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAlgoliaIndexReference_3 extends _i1.SmartFake
    implements _i3.AlgoliaIndexReference {
  _FakeAlgoliaIndexReference_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAlgoliaIndexesSnapshot_4 extends _i1.SmartFake
    implements _i3.AlgoliaIndexesSnapshot {
  _FakeAlgoliaIndexesSnapshot_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePractitionerRepository_5 extends _i1.SmartFake
    implements _i4.PractitionerRepository {
  _FakePractitionerRepository_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthRepository_6 extends _i1.SmartFake
    implements _i5.AuthRepository {
  _FakeAuthRepository_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserRepository_7 extends _i1.SmartFake
    implements _i6.UserRepository {
  _FakeUserRepository_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMailUtil_8 extends _i1.SmartFake implements _i7.MailUtil {
  _FakeMailUtil_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PractitionerRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPractitionerRepository extends _i1.Mock
    implements _i4.PractitionerRepository {
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>> savePractitioner(
          _i10.PractitionerEntity? practitioner) =>
      (super.noSuchMethod(
        Invocation.method(
          #savePractitioner,
          [practitioner],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>.value(
                _FakeEither_0<_i9.Failure, _i10.PractitionerEntity>(
          this,
          Invocation.method(
            #savePractitioner,
            [practitioner],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>.value(
                _FakeEither_0<_i9.Failure, _i10.PractitionerEntity>(
          this,
          Invocation.method(
            #savePractitioner,
            [practitioner],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>> getById(
          String? practitionerId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getById,
          [practitionerId],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>.value(
                _FakeEither_0<_i9.Failure, _i10.PractitionerEntity>(
          this,
          Invocation.method(
            #getById,
            [practitionerId],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>.value(
                _FakeEither_0<_i9.Failure, _i10.PractitionerEntity>(
          this,
          Invocation.method(
            #getById,
            [practitionerId],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>);

  @override
  _i8.Future<List<_i10.PractitionerEntity>> search(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #search,
          [query],
        ),
        returnValue: _i8.Future<List<_i10.PractitionerEntity>>.value(
            <_i10.PractitionerEntity>[]),
        returnValueForMissingStub:
            _i8.Future<List<_i10.PractitionerEntity>>.value(
                <_i10.PractitionerEntity>[]),
      ) as _i8.Future<List<_i10.PractitionerEntity>>);

  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> uploadPractitionerProfile(
    String? practitionerId,
    _i11.Uint8List? profile,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadPractitionerProfile,
          [
            practitionerId,
            profile,
          ],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #uploadPractitionerProfile,
            [
              practitionerId,
              profile,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, String>>.value(
                _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #uploadPractitionerProfile,
            [
              practitionerId,
              profile,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);

  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> getProfile(
          String? practitionerId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProfile,
          [practitionerId],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #getProfile,
            [practitionerId],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, String>>.value(
                _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #getProfile,
            [practitionerId],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);

  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> updatePractitionerProfilePicture(
    String? practitionerId,
    String? profilePictureUrl,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePractitionerProfilePicture,
          [
            practitionerId,
            profilePictureUrl,
          ],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #updatePractitionerProfilePicture,
            [
              practitionerId,
              profilePictureUrl,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, String>>.value(
                _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #updatePractitionerProfilePicture,
            [
              practitionerId,
              profilePictureUrl,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
}

/// A class which mocks [Algolia].
///
/// See the documentation for Mockito's code generation for more information.
class MockAlgolia extends _i1.Mock implements _i3.Algolia {
  @override
  String get applicationId => (super.noSuchMethod(
        Invocation.getter(#applicationId),
        returnValue: _i12.dummyValue<String>(
          this,
          Invocation.getter(#applicationId),
        ),
        returnValueForMissingStub: _i12.dummyValue<String>(
          this,
          Invocation.getter(#applicationId),
        ),
      ) as String);

  @override
  Map<String, String> get extraHeaders => (super.noSuchMethod(
        Invocation.getter(#extraHeaders),
        returnValue: <String, String>{},
        returnValueForMissingStub: <String, String>{},
      ) as Map<String, String>);

  @override
  List<String> get extraUserAgents => (super.noSuchMethod(
        Invocation.getter(#extraUserAgents),
        returnValue: <String>[],
        returnValueForMissingStub: <String>[],
      ) as List<String>);

  @override
  _i3.Algolia get instance => (super.noSuchMethod(
        Invocation.getter(#instance),
        returnValue: _FakeAlgolia_1(
          this,
          Invocation.getter(#instance),
        ),
        returnValueForMissingStub: _FakeAlgolia_1(
          this,
          Invocation.getter(#instance),
        ),
      ) as _i3.Algolia);

  @override
  _i3.AlgoliaMultiIndexesReference get multipleQueries => (super.noSuchMethod(
        Invocation.getter(#multipleQueries),
        returnValue: _FakeAlgoliaMultiIndexesReference_2(
          this,
          Invocation.getter(#multipleQueries),
        ),
        returnValueForMissingStub: _FakeAlgoliaMultiIndexesReference_2(
          this,
          Invocation.getter(#multipleQueries),
        ),
      ) as _i3.AlgoliaMultiIndexesReference);

  @override
  _i3.Algolia setHeader(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setHeader,
          [
            key,
            value,
          ],
        ),
        returnValue: _FakeAlgolia_1(
          this,
          Invocation.method(
            #setHeader,
            [
              key,
              value,
            ],
          ),
        ),
        returnValueForMissingStub: _FakeAlgolia_1(
          this,
          Invocation.method(
            #setHeader,
            [
              key,
              value,
            ],
          ),
        ),
      ) as _i3.Algolia);

  @override
  _i3.AlgoliaIndexReference index(String? index) => (super.noSuchMethod(
        Invocation.method(
          #index,
          [index],
        ),
        returnValue: _FakeAlgoliaIndexReference_3(
          this,
          Invocation.method(
            #index,
            [index],
          ),
        ),
        returnValueForMissingStub: _FakeAlgoliaIndexReference_3(
          this,
          Invocation.method(
            #index,
            [index],
          ),
        ),
      ) as _i3.AlgoliaIndexReference);

  @override
  _i8.Future<_i3.AlgoliaIndexesSnapshot> getIndices() => (super.noSuchMethod(
        Invocation.method(
          #getIndices,
          [],
        ),
        returnValue: _i8.Future<_i3.AlgoliaIndexesSnapshot>.value(
            _FakeAlgoliaIndexesSnapshot_4(
          this,
          Invocation.method(
            #getIndices,
            [],
          ),
        )),
        returnValueForMissingStub: _i8.Future<_i3.AlgoliaIndexesSnapshot>.value(
            _FakeAlgoliaIndexesSnapshot_4(
          this,
          Invocation.method(
            #getIndices,
            [],
          ),
        )),
      ) as _i8.Future<_i3.AlgoliaIndexesSnapshot>);

  @override
  _i8.Future<void> pushEvents(List<_i3.AlgoliaEvent>? events) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushEvents,
          [events],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [SavePractitionerUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSavePractitionerUseCase extends _i1.Mock
    implements _i13.SavePractitionerUseCase {
  @override
  _i4.PractitionerRepository get practitionerRepository => (super.noSuchMethod(
        Invocation.getter(#practitionerRepository),
        returnValue: _FakePractitionerRepository_5(
          this,
          Invocation.getter(#practitionerRepository),
        ),
        returnValueForMissingStub: _FakePractitionerRepository_5(
          this,
          Invocation.getter(#practitionerRepository),
        ),
      ) as _i4.PractitionerRepository);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>> execute(
          _i10.PractitionerEntity? practitioner) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [practitioner],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>.value(
                _FakeEither_0<_i9.Failure, _i10.PractitionerEntity>(
          this,
          Invocation.method(
            #execute,
            [practitioner],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>.value(
                _FakeEither_0<_i9.Failure, _i10.PractitionerEntity>(
          this,
          Invocation.method(
            #execute,
            [practitioner],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>);
}

/// A class which mocks [GetPractitionerInfoUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPractitionerInfoUseCase extends _i1.Mock
    implements _i14.GetPractitionerInfoUseCase {
  @override
  _i4.PractitionerRepository get practitionerRepository => (super.noSuchMethod(
        Invocation.getter(#practitionerRepository),
        returnValue: _FakePractitionerRepository_5(
          this,
          Invocation.getter(#practitionerRepository),
        ),
        returnValueForMissingStub: _FakePractitionerRepository_5(
          this,
          Invocation.getter(#practitionerRepository),
        ),
      ) as _i4.PractitionerRepository);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>> execute(
          String? practitionerId) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [practitionerId],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>.value(
                _FakeEither_0<_i9.Failure, _i10.PractitionerEntity>(
          this,
          Invocation.method(
            #execute,
            [practitionerId],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>.value(
                _FakeEither_0<_i9.Failure, _i10.PractitionerEntity>(
          this,
          Invocation.method(
            #execute,
            [practitionerId],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i10.PractitionerEntity>>);
}

/// A class which mocks [SearchPractitionerUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchPractitionerUseCase extends _i1.Mock
    implements _i15.SearchPractitionerUseCase {
  @override
  _i4.PractitionerRepository get practitionerRepository => (super.noSuchMethod(
        Invocation.getter(#practitionerRepository),
        returnValue: _FakePractitionerRepository_5(
          this,
          Invocation.getter(#practitionerRepository),
        ),
        returnValueForMissingStub: _FakePractitionerRepository_5(
          this,
          Invocation.getter(#practitionerRepository),
        ),
      ) as _i4.PractitionerRepository);

  @override
  _i8.Future<List<_i10.PractitionerEntity>> execute(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [query],
        ),
        returnValue: _i8.Future<List<_i10.PractitionerEntity>>.value(
            <_i10.PractitionerEntity>[]),
        returnValueForMissingStub:
            _i8.Future<List<_i10.PractitionerEntity>>.value(
                <_i10.PractitionerEntity>[]),
      ) as _i8.Future<List<_i10.PractitionerEntity>>);
}

/// A class which mocks [NavigatorObserver].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigatorObserver extends _i1.Mock implements _i16.NavigatorObserver {
  @override
  void didPush(
    _i16.Route<dynamic>? route,
    _i16.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didPush,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didPop(
    _i16.Route<dynamic>? route,
    _i16.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didPop,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didRemove(
    _i16.Route<dynamic>? route,
    _i16.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didRemove,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didReplace({
    _i16.Route<dynamic>? newRoute,
    _i16.Route<dynamic>? oldRoute,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #didReplace,
          [],
          {
            #newRoute: newRoute,
            #oldRoute: oldRoute,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didStartUserGesture(
    _i16.Route<dynamic>? route,
    _i16.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didStartUserGesture,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didStopUserGesture() => super.noSuchMethod(
        Invocation.method(
          #didStopUserGesture,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [FilePicker].
///
/// See the documentation for Mockito's code generation for more information.
class MockFilePicker extends _i1.Mock implements _i17.FilePicker {
  @override
  _i8.Future<_i18.FilePickerResult?> pickFiles({
    String? dialogTitle,
    String? initialDirectory,
    _i17.FileType? type = _i17.FileType.any,
    List<String>? allowedExtensions,
    dynamic Function(_i17.FilePickerStatus)? onFileLoading,
    bool? allowCompression = true,
    bool? allowMultiple = false,
    bool? withData = false,
    bool? withReadStream = false,
    bool? lockParentWindow = false,
    bool? readSequential = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pickFiles,
          [],
          {
            #dialogTitle: dialogTitle,
            #initialDirectory: initialDirectory,
            #type: type,
            #allowedExtensions: allowedExtensions,
            #onFileLoading: onFileLoading,
            #allowCompression: allowCompression,
            #allowMultiple: allowMultiple,
            #withData: withData,
            #withReadStream: withReadStream,
            #lockParentWindow: lockParentWindow,
            #readSequential: readSequential,
          },
        ),
        returnValue: _i8.Future<_i18.FilePickerResult?>.value(),
        returnValueForMissingStub: _i8.Future<_i18.FilePickerResult?>.value(),
      ) as _i8.Future<_i18.FilePickerResult?>);

  @override
  _i8.Future<bool?> clearTemporaryFiles() => (super.noSuchMethod(
        Invocation.method(
          #clearTemporaryFiles,
          [],
        ),
        returnValue: _i8.Future<bool?>.value(),
        returnValueForMissingStub: _i8.Future<bool?>.value(),
      ) as _i8.Future<bool?>);

  @override
  _i8.Future<String?> getDirectoryPath({
    String? dialogTitle,
    bool? lockParentWindow = false,
    String? initialDirectory,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDirectoryPath,
          [],
          {
            #dialogTitle: dialogTitle,
            #lockParentWindow: lockParentWindow,
            #initialDirectory: initialDirectory,
          },
        ),
        returnValue: _i8.Future<String?>.value(),
        returnValueForMissingStub: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);

  @override
  _i8.Future<String?> saveFile({
    String? dialogTitle,
    String? fileName,
    String? initialDirectory,
    _i17.FileType? type = _i17.FileType.any,
    List<String>? allowedExtensions,
    bool? lockParentWindow = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFile,
          [],
          {
            #dialogTitle: dialogTitle,
            #fileName: fileName,
            #initialDirectory: initialDirectory,
            #type: type,
            #allowedExtensions: allowedExtensions,
            #lockParentWindow: lockParentWindow,
          },
        ),
        returnValue: _i8.Future<String?>.value(),
        returnValueForMissingStub: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);
}

/// A class which mocks [GetPractitionerProfileUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPractitionerProfileUseCase extends _i1.Mock
    implements _i19.GetPractitionerProfileUseCase {
  @override
  _i4.PractitionerRepository get practitionerRepository => (super.noSuchMethod(
        Invocation.getter(#practitionerRepository),
        returnValue: _FakePractitionerRepository_5(
          this,
          Invocation.getter(#practitionerRepository),
        ),
        returnValueForMissingStub: _FakePractitionerRepository_5(
          this,
          Invocation.getter(#practitionerRepository),
        ),
      ) as _i4.PractitionerRepository);

  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> execute(String? practitionerId) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [practitionerId],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [practitionerId],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, String>>.value(
                _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [practitionerId],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i5.AuthRepository {
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> signUp(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [
            email,
            password,
          ],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #signUp,
            [
              email,
              password,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, String>>.value(
                _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #signUp,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);

  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> signIn(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [
            email,
            password,
          ],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #signIn,
            [
              email,
              password,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, String>>.value(
                _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #signIn,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);

  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> getConnectedUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getConnectedUser,
          [],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #getConnectedUser,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, String>>.value(
                _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #getConnectedUser,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
}

/// A class which mocks [MailUtil].
///
/// See the documentation for Mockito's code generation for more information.
class MockMailUtil extends _i1.Mock implements _i7.MailUtil {
  @override
  bool isValid(String? email) => (super.noSuchMethod(
        Invocation.method(
          #isValid,
          [email],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}

/// A class which mocks [SignUpUserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignUpUserUseCase extends _i1.Mock implements _i20.SignUpUserUseCase {
  @override
  _i5.AuthRepository get authRepository => (super.noSuchMethod(
        Invocation.getter(#authRepository),
        returnValue: _FakeAuthRepository_6(
          this,
          Invocation.getter(#authRepository),
        ),
        returnValueForMissingStub: _FakeAuthRepository_6(
          this,
          Invocation.getter(#authRepository),
        ),
      ) as _i5.AuthRepository);

  @override
  _i6.UserRepository get userRepository => (super.noSuchMethod(
        Invocation.getter(#userRepository),
        returnValue: _FakeUserRepository_7(
          this,
          Invocation.getter(#userRepository),
        ),
        returnValueForMissingStub: _FakeUserRepository_7(
          this,
          Invocation.getter(#userRepository),
        ),
      ) as _i6.UserRepository);

  @override
  _i7.MailUtil get mailUtil => (super.noSuchMethod(
        Invocation.getter(#mailUtil),
        returnValue: _FakeMailUtil_8(
          this,
          Invocation.getter(#mailUtil),
        ),
        returnValueForMissingStub: _FakeMailUtil_8(
          this,
          Invocation.getter(#mailUtil),
        ),
      ) as _i7.MailUtil);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>> execute(
          _i20.SignUpUserRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [request],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>.value(
            _FakeEither_0<_i9.Failure, _i21.UserEntity>(
          this,
          Invocation.method(
            #execute,
            [request],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>.value(
                _FakeEither_0<_i9.Failure, _i21.UserEntity>(
          this,
          Invocation.method(
            #execute,
            [request],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>);
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i6.UserRepository {
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>> saveUserInfo(
          _i21.UserEntity? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveUserInfo,
          [user],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>.value(
            _FakeEither_0<_i9.Failure, _i21.UserEntity>(
          this,
          Invocation.method(
            #saveUserInfo,
            [user],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>.value(
                _FakeEither_0<_i9.Failure, _i21.UserEntity>(
          this,
          Invocation.method(
            #saveUserInfo,
            [user],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>> getByAuthId(
          String? authId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getByAuthId,
          [authId],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>.value(
            _FakeEither_0<_i9.Failure, _i21.UserEntity>(
          this,
          Invocation.method(
            #getByAuthId,
            [authId],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>.value(
                _FakeEither_0<_i9.Failure, _i21.UserEntity>(
          this,
          Invocation.method(
            #getByAuthId,
            [authId],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>);
}

/// A class which mocks [SignInUserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInUserUseCase extends _i1.Mock implements _i22.SignInUserUseCase {
  @override
  _i5.AuthRepository get authRepository => (super.noSuchMethod(
        Invocation.getter(#authRepository),
        returnValue: _FakeAuthRepository_6(
          this,
          Invocation.getter(#authRepository),
        ),
        returnValueForMissingStub: _FakeAuthRepository_6(
          this,
          Invocation.getter(#authRepository),
        ),
      ) as _i5.AuthRepository);

  @override
  _i6.UserRepository get userRepository => (super.noSuchMethod(
        Invocation.getter(#userRepository),
        returnValue: _FakeUserRepository_7(
          this,
          Invocation.getter(#userRepository),
        ),
        returnValueForMissingStub: _FakeUserRepository_7(
          this,
          Invocation.getter(#userRepository),
        ),
      ) as _i6.UserRepository);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>> execute(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [
            email,
            password,
          ],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>.value(
            _FakeEither_0<_i9.Failure, _i21.UserEntity>(
          this,
          Invocation.method(
            #execute,
            [
              email,
              password,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>.value(
                _FakeEither_0<_i9.Failure, _i21.UserEntity>(
          this,
          Invocation.method(
            #execute,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>);
}

/// A class which mocks [GetConnectedUserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetConnectedUserUseCase extends _i1.Mock
    implements _i23.GetConnectedUserUseCase {
  @override
  _i5.AuthRepository get authRepository => (super.noSuchMethod(
        Invocation.getter(#authRepository),
        returnValue: _FakeAuthRepository_6(
          this,
          Invocation.getter(#authRepository),
        ),
        returnValueForMissingStub: _FakeAuthRepository_6(
          this,
          Invocation.getter(#authRepository),
        ),
      ) as _i5.AuthRepository);

  @override
  _i6.UserRepository get userRepository => (super.noSuchMethod(
        Invocation.getter(#userRepository),
        returnValue: _FakeUserRepository_7(
          this,
          Invocation.getter(#userRepository),
        ),
        returnValueForMissingStub: _FakeUserRepository_7(
          this,
          Invocation.getter(#userRepository),
        ),
      ) as _i6.UserRepository);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>.value(
            _FakeEither_0<_i9.Failure, _i21.UserEntity>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>.value(
                _FakeEither_0<_i9.Failure, _i21.UserEntity>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i21.UserEntity>>);
}
