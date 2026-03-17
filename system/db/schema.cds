using {
    managed,
    sap,
    sap.common.CodeList,
} from '@sap/cds/common';

namespace sap.capire.systems;

entity systems : managed {
    key uuid               : UUID;
        system_number      : String(10);
        sid                : String(8);
        external_id        : String(6);
        system_role        : String;
        lifecycle_status   : Association to life_cycle_status default 'L';
        db_type            : String;
        network_seg_id     : String;
        business_type      : String(5);
        EU_access          : Boolean;
        data_center_id     : String;
        virtual_datacenter : String;
        extension_name     : String;
        extension_value    : String;
        DB_shared_tnts     : Boolean;
        change_log         : Association to Authors;
}

entity life_cycle_status : CodeList {
    key lifecycle_status : String enum {
            Live = 'L';
            Deleted = 'D';
            Provisioning_in_process = 'PIP';
            On_stock = 'OS';
            Decommissioning_in_process = 'DIP'
        };
};

entity Authors : managed {
    key uuid            : UUID;
        tech_change_log : Association to technical_change_log;
        sys_adm_data    : Association to admin_data;
        systems         : Association to many systems
                              on systems.change_log = $self;
}

entity technical_change_log : managed, sap.common.CodeList {
    key uuid              : UUID;
        changed_at        : Timestamp default $session.Timestamp;
        changed_by        : String default $user.id;
        object_changed_at : String;
        change_type       : String;
        element_name      : String;
        old_value         : String;
        new_value         : String;
        Authors           : Association to many Authors
                                on Authors.tech_change_log = $self;
        parent            : Association to technical_change_log;
        children          : Composition of many technical_change_log
                                on children.parent = $self;
}

entity admin_data : managed {
    key uuid       : UUID;
        created_at : Timestamp default $session.Timestamp;
        created_by : String default $user.id;
        changed_at : Timestamp default $session.Timestamp;
        changed_by : String default $user.id;
        
}
