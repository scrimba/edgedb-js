import type { GeneratorParams } from "../generate";
import fs from "fs";
import path from "path";
import serialize from "serialize-javascript";

export const generateIntrospection = (params: GeneratorParams) => {
  const { dir, ...rest } = params;
  const spec = dir.getPath("__spec__");
  spec.addImport({ $: true }, "edgedb");
  spec.writeln([
    JSON.stringify(rest),
  ]);
  spec.nl();
  const ourTypes = Object.getOwnPropertyNames(rest.typesByName).reduce(
    (acc, typeName) => {
      if (typeName.startsWith("default::")) {
        acc[typeName] = rest.typesByName[typeName];
      }
      return acc;
    },
    {} as any,
  );

  const s = {
    casts: rest.casts,
    scalars: Array.from(rest.scalars.values()),
    functions: Array.from(rest.functions.values()).flat(3).map((o) => {
      if (!o.annotations) delete o.annotations;
      if (!o.description) delete o.description;
      return o;
    }),
    operators: Array.from(rest.operators.values()).flat(3).map((o) => {
      if (!o.annotations) delete o.annotations;
      if (!o.description) delete o.description;
      return o;
    }),
    types: ourTypes,
  };
  fs.writeFileSync(
    path.join(__dirname, "../../../../schema.json"),
    serialize(s),
    "utf-8",
  );
  s.types = rest.typesByName;
  fs.writeFileSync(
    path.join(__dirname, "../../../../full_schema.json"),
    serialize(s),
    "utf-8",
  );
  spec.addExport("spec");
};
