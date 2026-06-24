#!/bin/bash

gdformat $(find . -name "*.gd" -not -path "./addons/*") --line-length 120
