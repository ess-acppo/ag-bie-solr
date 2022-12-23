#!/bin/bash

set -e
ag_bie_scripts="Load_Col_Molluscs.sh Process_CoL_Source_Data.sh Combine_Taxonomies_Moll_only.sh Import_Taxonomy.sh Swap_Cores.sh"

for script in ${ag_bie_scripts}
do
    echo "RUNNING SCRIPT: ${script}"
    ./${script}
    echo
done

exit 0
