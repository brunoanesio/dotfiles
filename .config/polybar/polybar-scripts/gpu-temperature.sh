#!/bin/sh

sensors | grep edge: | tr -d '+' | awk '{print $2}'
