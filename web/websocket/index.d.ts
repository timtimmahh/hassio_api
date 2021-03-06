import {Connection, ConnectionOptions} from "./connection.js";

export * from "./auth.js";
export * from "./collection.js";
export * from "./connection.js";
export * from "./config.js";
export * from "./services.js";
export * from "./entities.js";
export * from "./errors.js";
export * from "./socket.js";
export * from "./types.js";
export * from "./commands.js";

export declare function createConnection(options?: Partial<ConnectionOptions>): Promise<Connection>;
