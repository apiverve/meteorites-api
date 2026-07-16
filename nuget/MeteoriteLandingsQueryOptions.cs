using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.MeteoriteLandings
{
    /// <summary>
    /// Query options for the Meteorite Landings API
    /// </summary>
    public class MeteoriteLandingsQueryOptions
    {
        /// <summary>
        /// The name of the meteorite you want to search for
        /// </summary>
        [JsonProperty("name")]
        public string Name { get; set; }

        /// <summary>
        /// Minimum mass of the meteorite in grams
        /// </summary>
        [JsonProperty("mass")]
        public double? Mass { get; set; }

        /// <summary>
        /// The year the meteorite fell to Earth
        /// </summary>
        [JsonProperty("year")]
        public double? Year { get; set; }
    }
}
