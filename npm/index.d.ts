declare module '@apiverve/meteorites' {
  export interface meteoritesOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface meteoritesResponse {
    status: string;
    error: string | null;
    data: MeteoriteLandingsData;
    code?: number;
  }


  interface MeteoriteLandingsData {
      count:      number;
      filteredOn: string[];
      meteors:    Meteor[];
  }
  
  interface Meteor {
      name:        string;
      recclass:    string;
      mass:        string;
      year:        string;
      geolocation: Geolocation;
  }
  
  interface Geolocation {
      type:        string;
      coordinates: number[];
  }

  export default class meteoritesWrapper {
    constructor(options: meteoritesOptions);

    execute(callback: (error: any, data: meteoritesResponse | null) => void): Promise<meteoritesResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: meteoritesResponse | null) => void): Promise<meteoritesResponse>;
    execute(query?: Record<string, any>): Promise<meteoritesResponse>;
  }
}
