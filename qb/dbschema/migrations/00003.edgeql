CREATE MIGRATION m1zgyifc4wmsqblwzdjtntjarr5shcbdoe3sbis4mn5mexsh4qwo3q
    ONTO m1jaf7mi37erkzhlnredcoch6vzdf3jgkcsk3y3qvbopy4tf7soybq
{
  ALTER SCALAR TYPE default::permission {
      CREATE ANNOTATION std::description := '8 bits representing the permission';
  };
};
