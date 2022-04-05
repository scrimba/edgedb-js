CREATE MIGRATION m1jaf7mi37erkzhlnredcoch6vzdf3jgkcsk3y3qvbopy4tf7soybq
    ONTO m1a7dwxnfxpqhtftejyxcxhcfs5qib64fccigbxxj4o6qw5mqevefq
{
  CREATE ABSTRACT ANNOTATION default::id_num;
  ALTER TYPE default::Course {
      CREATE ANNOTATION default::id_num := '5';
  };
  ALTER TYPE default::Hub {
      CREATE ANNOTATION default::id_num := '3';
  };
  ALTER TYPE default::Permission {
      CREATE ANNOTATION default::id_num := '18';
  };
  ALTER TYPE default::Playlist {
      CREATE ANNOTATION default::id_num := '19';
  };
  ALTER TYPE default::Role {
      CREATE ANNOTATION default::id_num := '13';
  };
  ALTER TYPE default::Scrim {
      CREATE ANNOTATION default::id_num := '8';
  };
  ALTER TYPE default::Topic {
      CREATE ANNOTATION default::id_num := '15';
  };
  ALTER TYPE default::User {
      CREATE ANNOTATION default::id_num := '1';
  };
};
