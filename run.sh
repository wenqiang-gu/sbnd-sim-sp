# legacy simulation
lar -n1 -c common/singlegen_muon.fcl -o gen.root
lar -n1 -c common/standard_g4_sbnd.fcl gen.root -o g4.root
lar -n1 -c standard_detsim_sbnd.fcl g4.root -o detsim.root
lar -n1 -c legacy/celltree_sbnd.fcl detsim.root
root -l -b -q common/dump_waveform.C
mv waveform.root waveform_legacy.root

# refactored simulation
export WIRECELL_PATH=/nashome/w/wgu/tmp/sbnd/wirecell/:$WIRECELL_PATH
# reuse the g4 stage from legacy simulation
lar -n1 -c refactored/standard_detsim_sbnd.fcl g4.root -o detsim.root
lar -n1 -c refactored/celltree_sbnd.fcl detsim.root
root -l -b -q common/dump_waveform.C
mv waveform.root waveform_refactored.root

rm hist*root *log *db
