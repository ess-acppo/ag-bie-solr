#!/bin/sh -x
bail() {
  echo 1>&2 $*
  exit 1
}

echo "${datestamp}"
datestamp=`date +'%Y%m%d'`
echo "${datestamp}"

chmod +x *.sh

# Configuration
username=dawr
configDir="/data/processing/config"
workDir="/data/work/CoL"
sourceDir="${workDir}/${datestamp}"

# Retrieve from server
[ -d "${sourceDir}" ] || mkdir -p "${sourceDir}" || bail "Unable to create source directory ${sourceDir}"
cd "${sourceDir}" || bail "Unable to access source directory ${sourceDir}"
rm -rf * || bail "Unable to clear source directory ${sourceDir}"
tblBiota="tblBiota_${datestamp}.csv"
cp ~/ag-bie-solr/base/Molluscs/tblBiota_moll.csv $tblBiota
tblBiotaAssociate="tblBiotaAssociate_${datestamp}.csv"
cp ~/ag-bie-solr/base/Molluscs/tblBiotaAssociate_moll.csv $tblBiotaAssociate
tblCommonName="tblCommonName_${datestamp}.csv"
cp ~/ag-bie-solr/base/Molluscs/tblCommonName_moll.csv $tblCommonName
