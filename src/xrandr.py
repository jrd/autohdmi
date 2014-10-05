#!/bin/env python
# coding: utf8
# copyright: Cyrille Pontvieux
# license: MIT
from __future__ import print_function, division

from Xlib import display
from Xlib.ext import randr

d = display.Display()
s = d.screen()
w = s.root.create_window(0, 0, 1, 1, 1, s.root_depth)
res = randr.get_screen_resources(w)
modes = {}
offset = 0
for mode in res.modes:
  nextoffset = offset + mode.name_length
  modes[mode.id] = (res.mode_names[offset:nextoffset], mode)
  offset = nextoffset
for info in [randr.get_output_info(w, id, 0) for id in res.outputs]:
  for modeId in info.modes:
    (name, mode) = modes[modeId]
    refresh = round(mode.dot_clock / (mode.h_total * mode.v_total), 1)
    print(info.name, name, mode.width, mode.height, refresh)
