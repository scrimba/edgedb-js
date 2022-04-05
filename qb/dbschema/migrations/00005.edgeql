CREATE MIGRATION m1dbrujakkzawfjqbv252o44idjv6zz5qwiwsvgemctazodpaeqvhq
    ONTO m1fs3jdinp2o4axlqqpsiomzqqznnvlxfucxisghu6odqmxbobuczq
{
  ALTER TYPE default::Hub {
      CREATE ANNOTATION std::description := 'A Hub is a space that every entity should be part of. For now, we only have Scrimba but this could change in the future';
  };
};
