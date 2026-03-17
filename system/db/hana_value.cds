using {
    managed,
    sap,
    sap.common.CodeList
} from '@sap/cds/common';

namespace sap.capire.HANA_BO;

entity HANA_BO : managed {
   key uuid : UUID,
   key id   : integer
        description : String
}
