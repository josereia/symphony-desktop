#!/bin/bash
echo "----Construindo app web e windows----"
flutter build windows --release
iscc ./inno.iss

echo "---------------"
echo "| Finalizado! |"
echo "---------------"