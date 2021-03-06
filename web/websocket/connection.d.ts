import {ERR_CONNECTION_LOST} from "./errors.js";
import {MessageBase} from "./types.js";
import {HaWebSocket} from "./socket.js";
import type {Auth} from "./auth.js";

export declare type ConnectionOptions = {
    setupRetry: number;
    auth?: Auth;
    createSocket: (options: ConnectionOptions) => Promise<HaWebSocket>;
};
export declare type ConnectionEventListener = (conn: Connection, eventData?: any) => void;
declare type Events = "ready" | "disconnected" | "reconnect-error";
declare type SubscriptionUnsubscribe = () => Promise<void>;

interface SubscribeEventCommmandInFlight<T> {
    resolve: (result?: any) => void;
    reject: (err: any) => void;
    callback: (ev: T) => void;
    subscribe: (() => Promise<SubscriptionUnsubscribe>) | undefined;
    unsubscribe: SubscriptionUnsubscribe;
}

declare type CommandWithAnswerInFlight = {
    resolve: (result?: any) => void;
    reject: (err: any) => void;
};
declare type CommandInFlight = SubscribeEventCommmandInFlight<any> | CommandWithAnswerInFlight;

export declare class Connection {
    options: ConnectionOptions;
    commandId: number;
    commands: Map<number, CommandInFlight>;
    eventListeners: Map<string, ConnectionEventListener[]>;
    closeRequested: boolean;
    suspendReconnectPromise?: Promise<void>;
    _queuedMessages?: Array<{
        resolve: (value?: unknown) => unknown;
        reject?: (err: typeof ERR_CONNECTION_LOST) => unknown;
    }>;
    socket: HaWebSocket;
    private _handleMessage;
    private _handleClose;
    private _genCmdId;

    constructor(socket: HaWebSocket, options: ConnectionOptions);

    get haVersion(): string;

    get connected(): boolean;

    setSocket(socket: HaWebSocket): void;

    addEventListener(eventType: Events, callback: ConnectionEventListener): void;

    removeEventListener(eventType: Events, callback: ConnectionEventListener): void;

    fireEvent(eventType: Events, eventData?: any): void;

    suspendReconnectUntil(suspendPromise: Promise<void>): void;

    suspend(): void;

    close(): void;

    /**
     * Subscribe to a specific or all events.
     *
     * @param callback Callback  to be called when a new event fires
     * @param eventType
     * @returns promise that resolves to an unsubscribe function
     */
    subscribeEvents<EventType>(callback: (ev: EventType) => void, eventType?: string): Promise<SubscriptionUnsubscribe>;

    ping(): Promise<unknown>;

    sendMessage(message: MessageBase, commandId?: number): void;

    sendMessagePromise<Result>(message: MessageBase): Promise<Result>;

    /**
     * Call a websocket command that starts a subscription on the backend.
     *
     * @param message the message to start the subscription
     * @param callback the callback to be called when a new item arrives
     * @param [options.resubscribe] re-established a subscription after a reconnect
     * @returns promise that resolves to an unsubscribe function
     */
    subscribeMessage<Result>(callback: (result: Result) => void, subscribeMessage: MessageBase, options?: {
        resubscribe?: boolean;
    }): Promise<SubscriptionUnsubscribe>;
}

export {};
