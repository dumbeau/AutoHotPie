/* SystemJS module definition */
declare const nodeModule: NodeModule;
interface NodeModule {
  id: string;
}
interface Window {
  process: any;
  require: any;
  electronAPI: {
    getSettings: () => Promise<Record<string, any>[]>;
  };
}
