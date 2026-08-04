"use strict";

/** Minimal JSON Schema for AHPSettings.json (contract between Electron and AHK). */
const AHPSettingsSchema = {
  $schema: "https://json-schema.org/draft/2020-12/schema",
  $id: "https://github.com/combwizard/AutoHotPie/schema/AHPSettings.schema.json",
  title: "AHPSettings",
  type: "object",
  required: ["schemaVersion", "global", "appProfiles"],
  additionalProperties: true,
  properties: {
    schemaVersion: {
      type: "integer",
      minimum: 1,
      description: "Settings contract version. Bump when breaking JSON shape.",
    },
    global: {
      type: "object",
      required: ["startup", "globalAppearance"],
      additionalProperties: true,
      properties: {
        pieTips: { type: "boolean" },
        enableEscapeKeyMenuCancel: { type: "boolean" },
        app: {
          type: "object",
          additionalProperties: true,
          properties: {
            sourceFileName: { type: "string" },
            version: { type: "string" },
          },
        },
        startup: {
          type: "object",
          additionalProperties: true,
          properties: {
            runOnStartup: { type: "boolean" },
            runAHKPieMenus: { type: "boolean" },
            runOnAppQuit: { type: "boolean" },
            alwaysRunOnAppQuit: { type: "boolean" },
          },
        },
        globalAppearance: { type: "object", additionalProperties: true },
        functionConfig: {
          type: "object",
          additionalProperties: true,
          properties: {
            common: { type: "array" },
            custom: { type: "array" },
          },
        },
        htmlAhkKeyConversionTable: { type: "array" },
      },
    },
    appProfiles: {
      type: "array",
      minItems: 1,
      items: {
        type: "object",
        required: ["name", "ahkHandles", "pieKeys"],
        additionalProperties: true,
        properties: {
          name: { type: "string", minLength: 1 },
          ahkHandles: {
            type: "array",
            items: { type: "string" },
            minItems: 1,
          },
          enable: { type: "boolean" },
          pieEnableKey: { type: "object", additionalProperties: true },
          pieKeys: {
            type: "array",
            items: {
              type: "object",
              additionalProperties: true,
              properties: {
                name: { type: "string" },
                hotkey: { type: "string" },
                enable: { type: "boolean" },
                activationMode: { type: "object", additionalProperties: true },
                pieMenus: { type: "array" },
              },
            },
          },
        },
      },
    },
  },
};

const CURRENT_SCHEMA_VERSION = 1;

function ensureSchemaVersion(settings) {
  if (!settings || typeof settings !== "object") {
    throw new Error("Settings must be an object");
  }
  const next = { ...settings };
  if (next.schemaVersion == null) {
    next.schemaVersion = CURRENT_SCHEMA_VERSION;
  }
  if (typeof next.schemaVersion !== "number") {
    throw new Error("schemaVersion must be a number");
  }
  if (next.schemaVersion > CURRENT_SCHEMA_VERSION) {
    throw new Error(
      `Unsupported schemaVersion ${next.schemaVersion} (max ${CURRENT_SCHEMA_VERSION})`
    );
  }
  return next;
}

module.exports = {
  AHPSettingsSchema,
  CURRENT_SCHEMA_VERSION,
  ensureSchemaVersion,
};
