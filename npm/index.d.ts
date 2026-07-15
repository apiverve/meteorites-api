declare module '@apiverve/meteorites' {
  export interface meteoritesOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface meteoritesResponse {
    status: string;
    error: string | null;
    data: MeteoriteLandingsData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface MeteoriteLandingsData {
      count:      number | null;
      filteredOn: (null | string)[];
      meteors:    Meteor[];
  }
  
  interface Meteor {
      name:        null | string;
      recclass:    null | string;
      mass:        null | string;
      year:        null | string;
      geolocation: Geolocation;
  }
  
  interface Geolocation {
      type:        null | string;
      coordinates: (number | null)[];
  }

  export default class meteoritesWrapper {
    constructor(options: meteoritesOptions);

    execute(callback: (error: any, data: meteoritesResponse | null) => void): Promise<meteoritesResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: meteoritesResponse | null) => void): Promise<meteoritesResponse>;
    execute(query?: Record<string, any>): Promise<meteoritesResponse>;
  }
}
