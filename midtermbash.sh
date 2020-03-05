#! /bin/bash

translate.py adra2a2b2c.fasta > aminoAcids.fas

mafft aminoAcids.fas > alignAmino.fas

reverseTranslateAlignment.py alignAmino.fas adra2a2b2c.fasta > codon.fas

raxmlHPC-PTHREADS -f a -p 12345 -x 12345 -s codon.fas -n adracodon  -# 100 -m GTRGAMMA -T 4

raxmlHPC-PTHREADS -f a -p 12345 -x 12345 -s alignAmino.fas -n adraamino  -# 100 -m PROTCATWAG -T 4

xvfb-run python ~/software/BIOL435/drawTree.py RAxML_bipartitions.adraamino adraaminoTree

xvfb-run python ~/software/BIOL435/drawTree.py RAxML_bipartitions.adracodon adracodonTree


