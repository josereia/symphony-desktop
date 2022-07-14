#!/bin/bash
echo "Compilando..."
flutter build linux
mv ./build/linux/x64/release/bundle/symphony_desktop ./build/linux/x64/release/bundle/symphony
echo "Criando pacote .deb"
flutter_to_debian
cp ./debian/packages/symphony_1.0.0_amd64.deb ./releases/symphony.deb
echo "Finalizado."