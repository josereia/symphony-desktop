//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
#include <dart_vlc/dart_vlc_plugin.h>
#include <flutter_acrylic/flutter_acrylic_plugin.h>
#include <just_audio_windows/just_audio_windows_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  BitsdojoWindowPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("BitsdojoWindowPlugin"));
  DartVlcPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DartVlcPlugin"));
  FlutterAcrylicPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterAcrylicPlugin"));
  JustAudioWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("JustAudioWindowsPlugin"));
}
