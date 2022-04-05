module default {
    abstract annotation decorator_model;
    type Hub {
        annotation description := 'A Hub is a space that every entity should be part of. For now, we only have Scrimba but this could change in the future';
        annotation decorator_model := '3';
        required property name -> str;
        required property legacy_id -> str;
        required link creator -> User;
    }
    scalar type permission extending bytes {
        annotation description := "8 bits representing the permission";
        constraint max_value(b'11111111');
        constraint min_value(b'0');
    };
    abstract link orderable {
       property name -> str { delegated constraint exclusive };
    }
    abstract type Entity{
        required property name -> str;
        required property legacy_id -> str;
        required link creator -> User;
        required link hub -> Hub;
    }

    abstract type Agent {
        required property name -> str;
    }

    type Topic extending Entity {
        annotation decorator_model := '15';
    }
    type Course extending Entity {
        annotation decorator_model := '5';
        multi link playlists extending orderable -> Playlist;
        # {
        #     property name -> str { constraint exclusive };
        # };
    }
    type Playlist extending Entity {
        annotation decorator_model := '19';
        multi link scrims extending orderable -> Scrim;
        #  {
        #     property name -> str { constraint exclusive };
        # };
    }
    type Scrim extending Entity {
        annotation decorator_model := '8';
    }
    type User extending Agent {
        annotation decorator_model := '1';
        required property legacy_id -> str;
        multi link pins -> Entity;
        multi link stars -> Entity;
        multi link views -> Scrim {
            property progress -> decimal {
                constraint max_value(100);
                constraint min_value(0);
                default := 0;
            };
        };
        multi link roles -> Role;
    }

    type Role extending Agent {
        annotation decorator_model := '13';
    }
    type Permission {
        annotation decorator_model := '18';
        required link agent -> Agent;
        required link entity -> Entity;
        required property allows -> permission;
        required property denies -> permission;
    }
}
