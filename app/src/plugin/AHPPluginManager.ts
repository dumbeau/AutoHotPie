import {ActionPlugin, Log, PluginProperties, PluginType} from "autohotpie-core";
import {PluginManager} from "live-plugin-manager";
import {ahpSettings} from "../settings/AHPSettings";

export class AHPPluginManager {
  private static readonly pluginManager = new PluginManager();
  private static readonly actionPlugins: {plugin: ActionPlugin, properties: PluginProperties}[] = [];

  public static getActionPlugins(): ReadonlyArray<{plugin: ActionPlugin, properties: PluginProperties}> {
    return this.actionPlugins;
  }

  static async loadPlugins(): Promise<void> {
    const pluginIds = ahpSettings.get('plugins');
    Log.main.info("Loading plugins: " + pluginIds.join(', '));

    const failedIds: string[] = [];

    for (const pluginId of pluginIds) {

      try {
        await this.pluginManager.install(pluginId)
        const plugin = this.pluginManager.require(pluginId);

        const properties = (new plugin.Properties()) as PluginProperties;

        switch (properties.type) {
          case PluginType.ACTION_PLUGIN:
            this.actionPlugins.push({plugin: new plugin.Main() as ActionPlugin, properties: properties});
            break;
        }

      } catch (e) {
        Log.main.error("Error loading plugin: " + pluginId)
        console.log(e)
        failedIds.push(pluginId);
      }
    }

    if (failedIds.length > 0) {
      Log.main.warn("Failed to load plugins: " + failedIds.join(', '));
    }

  }

}
