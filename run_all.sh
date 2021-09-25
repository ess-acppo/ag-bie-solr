#!/bin/bash

set -e
ag_bie_scripts="Load_from_SFTP.sh Process_TaxxaS_Source_Data.sh Process_ANBG_Source_Data_Algae.sh Combine_Taxonomies.sh Import_Taxonomy.sh Swap_Cores.sh"

for script in ${ag_bie_scripts}
do
    echo "RUNNING SCRIPT: ${script}"
    ./${script}
    echo
done

exit 0
