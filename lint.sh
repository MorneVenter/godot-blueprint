#!/bin/bash

gdlint $(find . -name "*.gd" -not -path "./addons/*")
