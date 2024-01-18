// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated from `rust_auto_opaque_test.dart` by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

// FRB_INTERNAL_GENERATOR: {"enableAll": true}

import 'package:flutter_rust_bridge/src/droppable/droppable.dart';
import 'package:frb_example_pure_dart/src/rust/api/pseudo_manual/rust_auto_opaque_twin_rust_async_moi.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.dart';
import 'package:test/test.dart';

import '../../test_utils.dart';

Future<void> main({bool skipRustLibInit = false}) async {
  if (!skipRustLibInit) await RustLib.init();

  group('simple functions', () {
    test('return opaque', () async {
      final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
      expect(obj.isDisposed, false);
      obj.dispose();
    });

    group('arg owned', () {
      test('can be called', () async {
        final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgOwnTwinRustAsyncMoi(arg: obj, expect: 100));
      });

      test('after call, the object cannot be used again', () async {
        final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgOwnTwinRustAsyncMoi(arg: obj, expect: 100));

        expect(obj.isDisposed, true);

        await expectLater(
            () =>
                rustAutoOpaqueArgBorrowTwinRustAsyncMoi(arg: obj, expect: 100),
            throwsA(isA<DroppableDisposedException>()));
      });
    });

    group('arg ref', () {
      test('can be called', () async {
        final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgBorrowTwinRustAsyncMoi(arg: obj, expect: 100));
        expect(obj.isDisposed, false);
      });

      test('after call, the object can still be used again', () async {
        final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgBorrowTwinRustAsyncMoi(arg: obj, expect: 100));

        expect(obj.isDisposed, false);

        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgBorrowTwinRustAsyncMoi(arg: obj, expect: 100));
      });
    });

    group('arg ref mut', () {
      test('can be called', () async {
        final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgMutBorrowTwinRustAsyncMoi(
                arg: obj, expect: 100, adder: 1));
        expect(obj.isDisposed, false);
      });

      test('after call, the object can still be used again', () async {
        final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgMutBorrowTwinRustAsyncMoi(
                arg: obj, expect: 100, adder: 1));

        expect(obj.isDisposed, false);

        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgMutBorrowTwinRustAsyncMoi(
                arg: obj, expect: 101, adder: 10));

        expect(obj.isDisposed, false);

        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgBorrowTwinRustAsyncMoi(arg: obj, expect: 111));
      });

      test('does change the internal data', () async {
        final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);

        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgBorrowTwinRustAsyncMoi(arg: obj, expect: 100));

        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgMutBorrowTwinRustAsyncMoi(
                arg: obj, expect: 100, adder: 1));

        // expect internal data to change
        await futurizeVoidTwinRustAsyncMoi(
            rustAutoOpaqueArgBorrowTwinRustAsyncMoi(arg: obj, expect: 100 + 1));
      });
    });

    group('concurrent calls', () {
      test('can call multiple `&T` concurrently', () async {
        final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
        await Future.wait([
          futurizeVoidTwinRustAsyncMoi(
              rustAutoOpaqueArgBorrowTwinRustAsyncMoi(arg: obj, expect: 100)),
          futurizeVoidTwinRustAsyncMoi(
              rustAutoOpaqueArgBorrowTwinRustAsyncMoi(arg: obj, expect: 100)),
        ]);
      });

      // Not test yet, since this requires one function to acquire the Rust RwLock
      // before the other releases it, thus require some timing.
      //
      // test('cannot call multiple `T` concurrently', () async {
      //   final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
      //   await expectLater(() async {
      //     return Future.wait([
      //       futurizeVoidTwinRustAsyncMoi(
      //           rustAutoOpaqueArgOwnTwinRustAsyncMoi(arg: obj, expect: 100)),
      //       futurizeVoidTwinRustAsyncMoi(
      //           rustAutoOpaqueArgOwnTwinRustAsyncMoi(arg: obj, expect: 100)),
      //     ]);
      //   }, throwsA(isA<DroppableDisposedException>()));
      // });
      //
      // test('cannot call multiple `&mut T` concurrently', () async {
      //   final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
      //   await expectLater(() async {
      //     return Future.wait([
      //       futurizeVoidTwinRustAsyncMoi(rustAutoOpaqueArgMutBorrowTwinRustAsyncMoi(
      //           arg: obj, expect: 100, adder: 1)),
      //       futurizeVoidTwinRustAsyncMoi(rustAutoOpaqueArgMutBorrowTwinRustAsyncMoi(
      //           arg: obj, expect: 100, adder: 1)),
      //     ]);
      //   }, throwsA(isA<DroppableDisposedException>()));
      // });
      //
      // test('cannot call one `&T` and one `&mut T` concurrently', () async {
      //   final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
      //   await expectLater(() async {
      //     return Future.wait([
      //       futurizeVoidTwinRustAsyncMoi(
      //           rustAutoOpaqueArgBorrowTwinRustAsyncMoi(arg: obj, expect: 100)),
      //       futurizeVoidTwinRustAsyncMoi(rustAutoOpaqueArgMutBorrowTwinRustAsyncMoi(
      //           arg: obj, expect: 100, adder: 1)),
      //     ]);
      //   }, throwsA(isA<DroppableDisposedException>()));
      // });
    });
  });

  group('with other args', () {
    test('call rustAutoOpaqueArgOwnAndReturnOwnTwinRustAsyncMoi', () async {
      final a = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 42);

      final b = await rustAutoOpaqueArgOwnAndReturnOwnTwinRustAsyncMoi(arg: a);

      await futurizeVoidTwinRustAsyncMoi(
          rustAutoOpaqueArgOwnTwinRustAsyncMoi(arg: b, expect: 42));
    });

    test('call rustAutoOpaqueTwoArgsTwinRustAsyncMoi', () async {
      final a = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 10);
      final b = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 20);

      await futurizeVoidTwinRustAsyncMoi(
          rustAutoOpaqueTwoArgsTwinRustAsyncMoi(a: a, b: b));
    });

    test('call rustAutoOpaqueNormalAndOpaqueArgTwinRustAsyncMoi', () async {
      final a = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 42);

      await futurizeVoidTwinRustAsyncMoi(
          rustAutoOpaqueNormalAndOpaqueArgTwinRustAsyncMoi(a: a, b: 'hello'));
    });
  });

  group('complex type signatures', () {
    test('plus sign', () async {
      final obj = await rustAutoOpaquePlusSignReturnTwinRustAsyncMoi();
      await futurizeVoidTwinRustAsyncMoi(
          rustAutoOpaquePlusSignArgTwinRustAsyncMoi(arg: obj));
    });

    test('callable', () async {
      final obj = await rustAutoOpaqueCallableReturnTwinRustAsyncMoi();
      await futurizeVoidTwinRustAsyncMoi(
          rustAutoOpaqueCallableArgTwinRustAsyncMoi(arg: obj));
    });
  });

  group('trait object', () {
    Future<void> _body(BoxHelloTraitTwinRustAsyncMoi obj, String expect) async {
      await futurizeVoidTwinRustAsyncMoi(
          rustAutoOpaqueTraitObjectArgBorrowTwinRustAsyncMoi(
              arg: obj, expect: expect));
      await futurizeVoidTwinRustAsyncMoi(
          rustAutoOpaqueTraitObjectArgMutBorrowTwinRustAsyncMoi(
              arg: obj, expect: expect));
      await futurizeVoidTwinRustAsyncMoi(
          rustAutoOpaqueTraitObjectArgOwnTwinRustAsyncMoi(
              arg: obj, expect: expect));
    }

    test(
        'case one',
        () async => await _body(
            await rustAutoOpaqueTraitObjectReturnOwnOneTwinRustAsyncMoi(),
            'hello'));
    test(
        'case two',
        () async => await _body(
            await rustAutoOpaqueTraitObjectReturnOwnTwoTwinRustAsyncMoi(),
            'B'));
  });

  test('static method', () async {
    final obj = await NonCloneSimpleTwinRustAsyncMoi
        .staticMethodReturnOwnTwinRustAsyncMoi();
    await futurizeVoidTwinRustAsyncMoi(
        NonCloneSimpleTwinRustAsyncMoi.staticMethodArgBorrowTwinRustAsyncMoi(
            arg: obj));
    await futurizeVoidTwinRustAsyncMoi(
        NonCloneSimpleTwinRustAsyncMoi.staticMethodArgMutBorrowTwinRustAsyncMoi(
            arg: obj));
    await futurizeVoidTwinRustAsyncMoi(
        NonCloneSimpleTwinRustAsyncMoi.staticMethodArgOwnTwinRustAsyncMoi(
            arg: obj));
  });

  test('instance method', () async {
    final obj = await NonCloneSimpleTwinRustAsyncMoi.newTwinRustAsyncMoi();
    await futurizeVoidTwinRustAsyncMoi(
        obj.instanceMethodArgBorrowTwinRustAsyncMoi());
    await futurizeVoidTwinRustAsyncMoi(
        obj.instanceMethodArgMutBorrowTwinRustAsyncMoi());
    await futurizeVoidTwinRustAsyncMoi(
        obj.instanceMethodReturnOwnTwinRustAsyncMoi());
    await futurizeVoidTwinRustAsyncMoi(
        obj.instanceMethodArgOwnTwinRustAsyncMoi());
  });
  test('instance newWithResult', () async {
    final obj =
        await NonCloneSimpleTwinRustAsyncMoi.newWithResultTwinRustAsyncMoi();
    await futurizeVoidTwinRustAsyncMoi(
        obj.instanceMethodArgBorrowTwinRustAsyncMoi());
  });

  test('getter', () async {
    final obj = await NonCloneSimpleTwinRustAsyncMoi.newTwinRustAsyncMoi();
    expect(await obj.instanceMethodGetterTwinRustAsyncMoi, 42);
  });

  test('types with both encodable and opaque fields', () async {
    final obj =
        await rustAutoOpaqueStructWithGoodAndOpaqueFieldReturnOwnTwinRustAsyncMoi();
    await futurizeVoidTwinRustAsyncMoi(
        rustAutoOpaqueStructWithGoodAndOpaqueFieldArgBorrowTwinRustAsyncMoi(
            arg: obj));
    await futurizeVoidTwinRustAsyncMoi(
        rustAutoOpaqueStructWithGoodAndOpaqueFieldArgMutBorrowTwinRustAsyncMoi(
            arg: obj));
    await futurizeVoidTwinRustAsyncMoi(
        rustAutoOpaqueStructWithGoodAndOpaqueFieldArgOwnTwinRustAsyncMoi(
            arg: obj));
  });

  group('borrow + mut borrow', () {
    test('when same object', () async {
      final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
      await expectRustPanic(
        () async => rustAutoOpaqueBorrowAndMutBorrowTwinRustAsyncMoi(
            borrow: obj, mutBorrow: obj),
        'TwinRustAsyncMoi',
        messageMatcherOnNative: matches(RegExp('Fail to.*borrow object')),
      );
    });

    test('when different object', () async {
      final a = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
      final b = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 200);
      expect(
          await rustAutoOpaqueBorrowAndMutBorrowTwinRustAsyncMoi(
              borrow: a, mutBorrow: b),
          300);
    });
  });

  group('borrow + borrow', () {
    test('when same object', () async {
      final obj = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
      expect(
          await rustAutoOpaqueBorrowAndBorrowTwinRustAsyncMoi(a: obj, b: obj),
          200);
    });

    test('when different object', () async {
      final a = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 100);
      final b = await rustAutoOpaqueReturnOwnTwinRustAsyncMoi(initial: 200);
      expect(
          await rustAutoOpaqueBorrowAndBorrowTwinRustAsyncMoi(a: a, b: b), 300);
    });
  });
}