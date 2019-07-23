#!/usr/bin/env bash

mcs -langversion:ISO-2 -sdk:4.5 /unsafe -target:library BytesHelper.cs
cp BytesHelper.dll ../Assets/Plugins/Slua_Managed/BytesHelper.dll
