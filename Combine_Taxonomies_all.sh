#!/bin/sh -x
bail() {
  echo 1>&2 $*
  exit 1
}

echo "${datestamp}"
datestamp=`date +'%Y%m%d'`
echo "${datestamp}"

# Configuration
configDir="/data/processing/config"
workDir="/data/work/combined"
taxxasDir="/data/work/TaxxaS"
nslICNDir="/data/work/NSL-ICN"
nslICZNDir="/data/work/NSL-ICZN"
anbgVASCDir="/data/work/ANBG-VASC"
anbgALGAEDir="/data/work/ANBG-ALGAE"
anbgLICHDir="/data/work/ANBG-LICH"
anbgMOSSDir="/data/work/ANBG-MOSS"
colDir="/data/work/CoL"
combineDir="/data/processing/ala-name-matching"
combineCmd="build-combined.sh"
combinedDir="${workDir}/combined_${datestamp}"
combined="${workDir}/combined"
archiveDir="/data/archive"

# Clear work area
rm "${combined}"/*

# Combine DwCAs
cd "${combineDir}" || bail "Uable to get to process directory ${combineDir}"
./build-combined.sh -c "${configDir}/taxxas-taxon-config.json" -w "${workDir}" -o "${combined}" "${colDir}/DwC" "${taxxasDir}/DwC/" "${nslICZNDir}/DwC" "${nslICNDir}/DwC" "${anbgVASCDir}/DwC" "${anbgALGAEDir}/DwC" "${anbgLICHDir}/DwC" "${anbgMOSSDir}/DwC"
#./build-combined.sh -c "${configDir}/taxxas-taxon-config.json" -w "${workDir}" -o "${combined}"  "${taxxasDir}/DwC/"
if [ $? -ne 0 ]; then
 bail "Unable to combine taxonomies"
fi

# Archive result
[ -d "${archiveDir}" ] || mkdir -p "${archiveDir}" || bail "Unable to create ${archiveDir}"
cd "${combined}" || bail "Unable to move to ${combined}"
zip "${archiveDir}/combined_${datestamp}.zip" *