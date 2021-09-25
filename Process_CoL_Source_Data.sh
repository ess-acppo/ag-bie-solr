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
workDir="/data/work/CoL"
sourceDir="${workDir}/${datestamp}"
processDir="/data/processing/CoL/CoL_Package_DwCA"
processCmd="./CoL_Package_DwCA_run.sh"
dataSetID="col-moll"

# Clear work area
rm "${workDir}"/DwC/*
rm "${workDir}"/Processed/*

# Convert TaxxaS tables into DwCA
cd "${processDir}" || bail "Uable to get to process directory ${processDir}"
${processCmd} --context_param "workDir=${workDir}" --context_param "dateStamp=${datestamp}" --context_param "configDir=${configDir}" --context_param "outputDir=${workDir}" --context_param "nslDataResourceUID=${dataSetID}"
if [ $? -ne 0 ]; then
 bail "Unable to process source files"
fi

echo "Processing Results"
wc -l "${workDir}"/DwC/*.csv
wc -l "${workDir}"/Processed/*.csv
