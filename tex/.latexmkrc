#!/usr/bin/env perl
$latex        = 'uplatex -synctex=1';
$latex_silent = 'uplatex -synctex=1 -interaction=batchmode';
$bibtex       = 'upbibtex';
$dvipdf       = 'dvipdfmx %O -o %D %S';
$makeindex    = 'mendex %O -U -o %D %S';
$max_repeat   = 5;
$pdf_mode     = 3;

$pvc_view_file_via_temporary = 0;
$pdf_previewer = 'open -ga /Applications/Skim.app';
