export interface IWindowDetails {
  title: string;
  id: number;
  bounds: {
    x: number;
    y: number;
    height: number;
    width: number;
  };
  owner: {
    name: string;
    processId: number;
    bundleId?: string;
    path: string;
  };
  base64Icon?: string;
  url?: string;
  memoryUsage: number;
}

export class ReadonlyWindowDetails implements IWindowDetails {
  constructor(
    public readonly title: string,
    public readonly id: number,
    public readonly bounds: {
      readonly x: number;
      readonly y: number;
      readonly height: number;
      readonly width: number;
    },
    public readonly owner: {
      readonly name: string;
      readonly processId: number;
      readonly bundleId?: string;
      readonly path: string;
    },
    public readonly memoryUsage: number,
    public readonly base64Icon?: string,
  ) {
  }
}
