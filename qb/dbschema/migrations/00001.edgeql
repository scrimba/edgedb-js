CREATE MIGRATION m1a7dwxnfxpqhtftejyxcxhcfs5qib64fccigbxxj4o6qw5mqevefq
    ONTO initial
{
  CREATE ABSTRACT LINK default::orderable {
      CREATE PROPERTY name -> std::str {
          CREATE DELEGATED CONSTRAINT std::exclusive;
      };
  };
  CREATE ABSTRACT TYPE default::Agent {
      CREATE REQUIRED PROPERTY name -> std::str;
  };
  CREATE ABSTRACT TYPE default::Entity {
      CREATE REQUIRED PROPERTY legacy_id -> std::str;
      CREATE REQUIRED PROPERTY name -> std::str;
  };
  CREATE TYPE default::Course EXTENDING default::Entity;
  CREATE TYPE default::Role EXTENDING default::Agent;
  CREATE TYPE default::Playlist EXTENDING default::Entity;
  ALTER TYPE default::Course {
      CREATE MULTI LINK playlists EXTENDING default::orderable -> default::Playlist;
  };
  CREATE TYPE default::Scrim EXTENDING default::Entity;
  ALTER TYPE default::Playlist {
      CREATE MULTI LINK scrims EXTENDING default::orderable -> default::Scrim;
  };
  CREATE TYPE default::User EXTENDING default::Agent {
      CREATE MULTI LINK pins -> default::Entity;
      CREATE MULTI LINK stars -> default::Entity;
      CREATE MULTI LINK roles -> default::Role;
      CREATE MULTI LINK views -> default::Scrim {
          CREATE PROPERTY progress -> std::decimal {
              SET default := 0;
              CREATE CONSTRAINT std::max_value(100);
              CREATE CONSTRAINT std::min_value(0);
          };
      };
      CREATE REQUIRED PROPERTY legacy_id -> std::str;
  };
  CREATE SCALAR TYPE default::permission EXTENDING std::bytes {
      CREATE CONSTRAINT std::max_value(b'11111111');
      CREATE CONSTRAINT std::min_value(b'0');
  };
  CREATE TYPE default::Permission {
      CREATE REQUIRED LINK agent -> default::Agent;
      CREATE REQUIRED LINK entity -> default::Entity;
      CREATE REQUIRED PROPERTY allows -> default::permission;
      CREATE REQUIRED PROPERTY denies -> default::permission;
  };
  ALTER TYPE default::Entity {
      CREATE REQUIRED LINK creator -> default::User;
  };
  CREATE TYPE default::Hub {
      CREATE REQUIRED LINK creator -> default::User;
      CREATE REQUIRED PROPERTY legacy_id -> std::str;
      CREATE REQUIRED PROPERTY name -> std::str;
  };
  ALTER TYPE default::Entity {
      CREATE REQUIRED LINK hub -> default::Hub;
  };
  CREATE TYPE default::Topic EXTENDING default::Entity;
};
