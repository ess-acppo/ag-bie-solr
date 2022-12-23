#!/bin/bash

set -e
ag_bie_scripts="Load_from_SFTP.sh Process_TaxxaS_Source_Data.sh Process_NSL_Source_Data_ICN.sh Process_NSL_Source_Data_ICZN.sh Process_ANBG_Source_Data_Vascular.sh Process_ANBG_Source_Data_Algae.sh Process_ANBG_Source_Data_Lichens.sh Process_ANBG_Source_Data_Mosses.sh Combine_Taxonomies_all.sh Import_Taxonomy.sh Swap_Cores.sh"

for script in ${ag_bie_scripts}
do
    echo "RUNNING SCRIPT: ${script}"
    ./${script}
    echo
done

exit 0
