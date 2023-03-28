import { Prisma, PrismaClient } from "@prisma/client";
import {
  DefaultDataTransformer,
  DefaultErrorShape,
  ProcedureBuilder,
  RootConfig,
  unsetMarker,
} from "@trpc/server";

export const GroupsRoutes = (
  prisma: PrismaClient<
    Prisma.PrismaClientOptions,
    never,
    Prisma.RejectOnNotFound | Prisma.RejectPerOperation | undefined
  >,
  publicProcedure:
    | ProcedureBuilder<{
        _config: RootConfig<{
          ctx: object;
          meta: object;
          errorShape: DefaultErrorShape;
          transformer: DefaultDataTransformer;
        }>;
        _ctx_out: object;
        _input_in: typeof unsetMarker;
        _input_out: typeof unsetMarker;
        _output_in: typeof unsetMarker;
        _output_out: typeof unsetMarker;
        _meta: object;
      }>
    | undefined
) => {
  if (!publicProcedure) {
    throw Error("public Procedure not found");
  }
  const getAll = publicProcedure.query(async () => {
    const groupName = await prisma.groups.findMany({});
    return groupName;
  });
  return { getAllGroups: getAll };
};