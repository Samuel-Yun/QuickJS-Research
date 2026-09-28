# Source acquisition and Release build

The official repository is [WebKit/WebKit](https://github.com/WebKit/WebKit), pinned to [commit `fd3406f`](https://github.com/WebKit/WebKit/commit/fd3406f133a4e56d7aaf399ba5611ae44b8da7e9) (2026-09-20 06:07:14 UTC). It is a detached commit, originally selected from the project's earlier JSC feasibility candidate; no moving branch is used. `git rev-parse HEAD` on the Windows source checkout returned the full hash and `git status --short` was empty. Because this is a partial sparse Git checkout, no independent source-archive hash applies. No interpreter/runtime source file was edited.

## Acquisition decision

Current official [Windows port documentation](https://docs.webkit.org/Ports/WindowsPort.html) describes a Windows x64 build, but current `Source/cmake/OptionsMSVC.cmake:1` states MSVC support was dropped in favor of clang-cl. The available Windows environment had VS 2022/MSVC and SDK 26100, but not a complete current clang-cl/Ruby/gperf toolchain. The official Windows buildbot API returned HTTP 403 and its archive endpoint HTTP 502 during this investigation; no verifiable Windows-native artifact was obtained. This is a practical feasibility conclusion for this machine, **not** a claim that WebKit cannot be built on Windows.

The fixed source was fetched from the official GitHub mirror using Windows Git with a shallow blob-filtered fetch and sparse checkout of `Tools/Scripts`, `Source/cmake`, JavaScriptCore, WTF, bmalloc, `Source/WebCore/Configurations`, `Source/ThirdParty/unifdef`, `Source/ThirdParty/gtest`, and `Tools/TestWebKitAPI`. Relevant current entry points are `Tools/Scripts/build-jsc`, `Source/cmake/OptionsJSCOnly.cmake` and `Source/JavaScriptCore/CMakeLists.txt`. A reproducible acquisition outline (run in a fresh directory, with the exact commit rather than `main`) is:

```sh
git init webkit-fd3406f
git -C webkit-fd3406f remote add origin https://github.com/WebKit/WebKit.git
git -C webkit-fd3406f fetch --depth=1 --filter=blob:none origin fd3406f133a4e56d7aaf399ba5611ae44b8da7e9
git -C webkit-fd3406f sparse-checkout init --cone
git -C webkit-fd3406f sparse-checkout set Tools/Scripts Source/cmake Source/JavaScriptCore Source/WTF Source/bmalloc Source/WebCore/Configurations Source/ThirdParty/unifdef Source/ThirdParty/gtest Tools/TestWebKitAPI
git -C webkit-fd3406f checkout --detach FETCH_HEAD
git -C webkit-fd3406f rev-parse HEAD
git -C webkit-fd3406f status --short
```

The same pinned tree was copied to WSL ext4 for building. The actual build source path and commit were verified with `git rev-parse HEAD`. `build-jsc --help` was checked before selecting flags. The Ubuntu packages used were `ruby`, `ninja-build`, `libicu-dev` and `gperf`; their observed versions are in `environment.txt`. A rebuild with future distro-package revisions is not guaranteed to produce the same bytes; compare the resulting hashes against `binary_hashes.txt`.

## Commands and outcome

```sh
perl /home/mzyx/jsc_webkit_fd3406f/Tools/Scripts/build-jsc --help
perl /home/mzyx/jsc_webkit_fd3406f/Tools/Scripts/build-jsc \
  --jsc-only --release --build-dir=/home/mzyx/jsc_build_fd3406f --makeargs=-j2
```

The first attempt failed at CMake configuration because the sparse source omitted unifdef/gtest/TestWebKitAPI; see `build_attempt.log`. After adding those **unchanged upstream** directories, the same command completed all 2719 Ninja steps and printed `JavaScriptCore is now built (29m:44s)`; see `build_attempt_2.log`. No build-system patch was needed. WSL packages added from Ubuntu repositories: Ruby, Ninja, libicu-dev and gperf; compiler and CMake were preinstalled.

Actual `CMakeCache.txt` values: `CMAKE_BUILD_TYPE=Release`, `/usr/bin/c++` (GCC 13.3.0), `CMAKE_C_FLAGS_RELEASE=-O3 -DNDEBUG`, `CMAKE_CXX_FLAGS_RELEASE=-O3 -DNDEBUG`, `ENABLE_JIT=ON`, `ENABLE_C_LOOP=OFF`, `ENABLE_FTL_JIT=ON`, `ENABLE_API_TESTS=OFF`, `ENABLE_ASSERTS=AUTO`, `USE_CXX_STDLIB_ASSERTIONS=ON`. `Source/cmake/OptionsCommon.cmake:334-342` says `AUTO` defers engine assertions to `NDEBUG`; the configure log explicitly reports lightweight `_GLIBCXX_ASSERTIONS=1`. `-O3` is the selected CMake/WebKit Release setting, **not** a manual optimization added to one engine. No `-march=native`, sanitizer or LTO option was explicitly supplied; a scan of generated `build.ninja` found no `-flto` or `-fsanitize=` flags. See saved [build_configuration.txt](build_configuration.txt). The release build contains JIT support for the default positive-control probe; runtime `--useJIT=false` selects LLInt-only JS execution.

Built shell: `/home/mzyx/jsc_build_fd3406f/JSCOnly/Release/bin/jsc`; exact sizes and hashes are in `binary_hashes.txt`. `jsc --version` is unsupported, so the version identity is the Git commit plus executable/library hashes. Full current-shell help is `probes/smoke/jsc_help.txt`. Basic arithmetic, function, loop, property, regexp and eval smoke returned `SMOKE_PASS:107` (`probes/smoke/basic.stdout.txt`).

Rebuild location and OS matter: this is an Ubuntu/WSL ELF, not a native Windows executable. `PERFORMANCE_COMPARABILITY = NO` against existing native Windows QuickJS/V8 measurements.
